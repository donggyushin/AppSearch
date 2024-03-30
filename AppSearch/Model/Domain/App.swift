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
    let artworkUrl100: String
    let artworkUrl60: String
    let artworkUrl512: String
    let averageUserRating: CGFloat
    let contentAdvisoryRating: String
    let currency: String
    let currentVersionReleaseDate: String
    let description: String
    let formattedPrice: String
    let genres: [String]
    let languageCodesISO2A: [String]
    let minimumOsVersion: String
    let price: Int
    let releaseDate: String
    let releaseNotes: String?
    let screenshotUrls: [String]
    let sellerName: String
    let trackId: Int
    let trackName: String
    let userRatingCount: Int
    let version: String
    
    var formattedAverageUserRating: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1

        if let formattedNumber = formatter.string(from: NSNumber(value: averageUserRating)) {
            return formattedNumber
        } else {
            return "\(averageUserRating)"
        }
    }
}
