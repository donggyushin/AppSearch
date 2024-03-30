//
//  App.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import Foundation

struct App: Decodable {
    let artistId: Int
    let artistName: String
    let artworkUrl512: String
    let averageUserRating: CGFloat
    let contentAdvisoryRating: String
    let currency: String
    let currentVersionReleaseDate: String
    let description: String
    let formattedPrice: String
    let genres: [String]
    let languageCodesISO2A: [String]
    let minimumOsVersion: Int
    let price: Int
    let releaseDate: String
    let releaseNotes: String
    let screenshotUrls: [String]
    let sellerName: String
    let trackName: String
    let userRatingCount: Int
    let version: String
}
