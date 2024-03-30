//
//  AppRepositoryDomain.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import Foundation

final class AppRepositoryDomain: AppRepository {
    static let shared = AppRepositoryDomain()
    
    private let api = AppRepositoryAPI.shared
    private let coreData = AppRepositoryCoreData.shared
    
    private init() { }
    
    func get(query: String) async throws -> [App] {
        let response = try await api.get(query: query)
        return response.results
    }
    
    func getSearchHistory() throws -> [String] {
        let histories = try coreData.get()
        return histories.compactMap({ $0.query })
    }
    
    func postSearchHistory(query: String) throws {
        try coreData.post(query: query)
    }
}
