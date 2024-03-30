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
    
    private lazy var appsTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.register(AppListItemCell.self, forCellReuseIdentifier: AppListItemCell.identifier)
        view.separatorStyle = .none
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Apps"
        navigationItem.searchController = searchController
        configUI()
        bind()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(appsTableView)
        appsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bind() {
        viewModel.$apps
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.appsTableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
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

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppListItemCell.identifier) as? AppListItemCell ?? AppListItemCell()
        let app = viewModel.apps[indexPath.row]
        cell.configUI(app: app)
        return cell
    }
}
