//
//  SearchViewController.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class SearchViewController: UIViewController {
    private let searchController = UISearchController(searchResultsController: nil)
    private let viewModel = SearchViewModel(appRepository: AppRepositoryDomain.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
//        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Apps"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchQueryUpdated(query: searchController.searchBar.text ?? "")
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.tapEnter()
    }
}
