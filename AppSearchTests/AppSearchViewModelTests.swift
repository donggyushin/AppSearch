//
//  AppSearchViewModelTests.swift
//  AppSearchTests
//
//  Created by 신동규 on 3/30/24.
//

import XCTest

final class AppSearchViewModelTests: XCTestCase {
    
    class AppRepositoryTest: AppRepository {
        func get(query: String) async throws -> [App] { [] }
        
        func getSearchHistory() throws -> [String] { [] }
        
        func postSearchHistory(query: String) throws { }
    }
    
    func testSetSearchQueryHistories() throws {
        let viewModel: SearchViewModel = .init(appRepository: AppRepositoryTest())
        let allSearchQueryHistories: [String] = [
        "search1",
        "seaRch2",
        "searCh3",
        "saerch4"
        ]
        let result1 = viewModel.setSearchQueryHistories(searchQuery: "search", allSearchQueryHistories: allSearchQueryHistories)
        let result2 = viewModel.setSearchQueryHistories(searchQuery: "search2", allSearchQueryHistories: allSearchQueryHistories)
        let result3 = viewModel.setSearchQueryHistories(searchQuery: "seaRch3", allSearchQueryHistories: allSearchQueryHistories)
        let result4 = viewModel.setSearchQueryHistories(searchQuery: "search4", allSearchQueryHistories: allSearchQueryHistories)
        
        XCTAssertEqual(result1, ["search1", "seaRch2", "searCh3",])
        XCTAssertEqual(result2, ["seaRch2"])
        XCTAssertEqual(result3, ["searCh3"])
        XCTAssertEqual(result4, [])
    }

}
