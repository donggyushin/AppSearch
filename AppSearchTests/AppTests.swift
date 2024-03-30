//
//  AppTests.swift
//  AppSearchTests
//
//  Created by 신동규 on 3/30/24.
//

import XCTest

final class AppTests: XCTestCase {
    
    func testFormmatedAverageCount() {
        let app1 = App(artistId: 1, artistName: "", artworkUrl100: "", artworkUrl60: "", artworkUrl512: "", averageUserRating: 4.5231, contentAdvisoryRating: "", currency: "", currentVersionReleaseDate: "", description: "", formattedPrice: "", genres: [], languageCodesISO2A: [], minimumOsVersion: "", price: 0, releaseDate: "", releaseNotes: nil, screenshotUrls: [], sellerName: "", trackId: 1, trackName: "", userRatingCount: 0, version: "")
        
        let app2 = App(artistId: 1, artistName: "", artworkUrl100: "", artworkUrl60: "", artworkUrl512: "", averageUserRating: 5, contentAdvisoryRating: "", currency: "", currentVersionReleaseDate: "", description: "", formattedPrice: "", genres: [], languageCodesISO2A: [], minimumOsVersion: "", price: 0, releaseDate: "", releaseNotes: nil, screenshotUrls: [], sellerName: "", trackId: 1, trackName: "", userRatingCount: 0, version: "")
        
        let app3 = App(artistId: 1, artistName: "", artworkUrl100: "", artworkUrl60: "", artworkUrl512: "", averageUserRating: 5.01, contentAdvisoryRating: "", currency: "", currentVersionReleaseDate: "", description: "", formattedPrice: "", genres: [], languageCodesISO2A: [], minimumOsVersion: "", price: 0, releaseDate: "", releaseNotes: nil, screenshotUrls: [], sellerName: "", trackId: 1, trackName: "", userRatingCount: 0, version: "")
        
        XCTAssertEqual(app1.formattedAverageUserRating, "4.5")
        XCTAssertEqual(app2.formattedAverageUserRating, "5")
        XCTAssertEqual(app3.formattedAverageUserRating, "5")
    }
}
