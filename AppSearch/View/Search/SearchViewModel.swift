//
//  SearchViewModel.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import Combine

final class SearchViewModel {
    enum RenderingMode {
        case apps
        case searchHistory
    }
    
    private let appRepository: AppRepository
    var cancellables: Set<AnyCancellable> = []
    
    @Published private(set) var apps: [App] = []
    @Published private(set) var loading = false
    @Published private(set) var searchQuery: String = ""
    @Published private(set) var searchQueryForBinding: String = ""
    @Published private(set) var searchQueryHistories: [String] = []
    @Published private(set) var renderingMode: RenderingMode = .searchHistory
    
    private(set) var searchCompleted: PassthroughSubject<(), Never> = .init()
    
    @Published private var allSearchQueryHistories: [String] = []
    
    init(appRepository: AppRepository) {
        self.appRepository = appRepository
        refreshAllSearchQueryHistories()
        bind()
    }
    
    func searchBarTextDidBeginEditing() {
        renderingMode = .searchHistory
    }
    
    func searchBarTextDidEndEditing() {
        if apps.isEmpty == false {
            renderingMode = .apps
        }
    }
    
    func searchQueryUpdated(query: String) {
        searchQuery = query
    }
    
    func tapEnter() {
        search()
    }
    
    func tapSearchQuery(query: String) {
        searchQuery = query
        searchQueryForBinding = query
        search()
    }
    
    func tapCancel() {
        apps = []
        searchQuery = ""
        searchQueryForBinding = ""
    }
    
    private func bind() {
        $searchQuery
            .combineLatest($allSearchQueryHistories)
            .sink { searchQuery, allSearchQueryHistories in
                self.searchQueryHistories = self.setSearchQueryHistories(searchQuery: searchQuery, allSearchQueryHistories: allSearchQueryHistories)
            }
            .store(in: &cancellables)
        
        $apps
            .sink { apps in
                self.renderingMode = apps.isEmpty ? .searchHistory : .apps
            }
            .store(in: &cancellables)
    }
    
    private func refreshAllSearchQueryHistories() {
        allSearchQueryHistories = (try? appRepository.getSearchHistory()) ?? allSearchQueryHistories
    }
    
    private func search() {
        Task {
            do {
                guard loading == false else { return }
                loading = true
                apps = try await appRepository.get(query: searchQuery)
                if apps.isEmpty == false {
                    try? appRepository.postSearchHistory(query: searchQuery)
                    refreshAllSearchQueryHistories()
                    searchCompleted.send()
                }
                loading = false
            } catch {
                loading = false
            }
        }
    }
    
    private func setSearchQueryHistories(searchQuery: String, allSearchQueryHistories: [String]) -> [String] {
        guard searchQuery.isEmpty == false else {
            return allSearchQueryHistories
        }
        
        return allSearchQueryHistories.filter({ $0.lowercased().contains(searchQuery.lowercased()) })
    }
}
