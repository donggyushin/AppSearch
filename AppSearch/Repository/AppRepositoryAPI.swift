//
//  AppRepositoryAPI.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import Foundation

final class AppRepositoryAPI {
    static let shared = AppRepositoryAPI()
    private let apiClient = APIClient.shared
    private init() { }
    
    func get(query: String) async throws -> AppSearchResponse {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw CustomError.failEncoding }
        return try await apiClient.request(url: "https://itunes.apple.com/search?term=\(query)&media=software&country=KR")
    }
}
