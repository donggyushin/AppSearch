//
//  APIClient.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    private var defaultHeaders: [String: String] {
        ["Content-Type": "application/json"]
    }
    
    private init() { }
    
    func request<T: Decodable>(method: Method = .get, url: String, body: Codable? = nil, additionalHeaders: [String: String]? = nil) async throws -> T {
        guard let url = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else { throw CustomError.invalidUrl }
        
        var headers = self.defaultHeaders
        
        if let additionalHeaders {
            additionalHeaders.forEach({ headers[$0.key] = $0.value })
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw CustomError.serverError }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}

extension APIClient {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
}
