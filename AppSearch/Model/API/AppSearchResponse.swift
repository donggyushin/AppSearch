//
//  AppSearchResponse.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import Foundation

struct AppSearchResponse: Decodable {
    let resultCount: Int
    let results: [App]
}
