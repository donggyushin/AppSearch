//
//  AppRepository.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import Foundation

protocol AppRepository {
    func get(query: String) async throws -> [App]
    func getSearchHistory() throws -> [String]
    func postSearchHistory(query: String) throws
}
