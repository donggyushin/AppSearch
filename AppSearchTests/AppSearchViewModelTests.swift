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
        
        func getSearchHistory() throws -> [String] {
            [
            "search1",
            "seaRch2",
            "searCh3",
            "saerch4"
            ]
        }
        
        func postSearchHistory(query: String) throws { }
    }
    
    func testSetSearchQueryHistories2() {
        let viewModel: SearchViewModel = .init(appRepository: AppRepositoryTest())
        XCTAssertEqual(viewModel.searchQueryHistories, ["search1", "seaRch2", "searCh3", "saerch4"])
        
        viewModel.searchQueryUpdated(query: "search")
        XCTAssertEqual(viewModel.searchQueryHistories, ["search1", "seaRch2", "searCh3"])
        
        viewModel.searchQueryUpdated(query: "search2")
        XCTAssertEqual(viewModel.searchQueryHistories, ["seaRch2"])
        
        viewModel.searchQueryUpdated(query: "seaRch3")
        XCTAssertEqual(viewModel.searchQueryHistories, ["searCh3"])
        
        viewModel.searchQueryUpdated(query: "search4")
        XCTAssertEqual(viewModel.searchQueryHistories, [])
    }
}
