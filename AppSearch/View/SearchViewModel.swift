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
    @Published private(set) var searchQueryHistories: [String] = []
    @Published private(set) var renderingMode: RenderingMode = .searchHistory
    
    @Published private var allSearchQueryHistories: [String] = []
    
    init(appRepository: AppRepository) {
        self.appRepository = appRepository
        
        allSearchQueryHistories = (try? appRepository.getSearchHistory()) ?? []
        
        bind()
    }
    
    func searchQueryUpdated(query: String) {
        searchQuery = query
    }
    
    func tapEnter() {
        Task {
            do {
                guard loading == false else { return }
                loading = true
                apps = try await appRepository.get(query: searchQuery)
                loading = false
            } catch {
                loading = false
            }
            
        }
    }
    
    func setSearchQueryHistories(searchQuery: String, allSearchQueryHistories: [String]) -> [String] {
        guard searchQuery.isEmpty == false else {
            return allSearchQueryHistories
        }
        
        return allSearchQueryHistories.filter({ $0.lowercased().contains(searchQuery.lowercased()) })
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
}
