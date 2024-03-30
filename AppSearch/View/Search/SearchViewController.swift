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
        view.delegate = self
        view.register(AppListItemCell.self, forCellReuseIdentifier: AppListItemCell.identifier)
        view.separatorStyle = .none
        return view
    }()
    
    private lazy var searchHistoryTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.center = self.view.center
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
        
        view.addSubview(searchHistoryTableView)
        searchHistoryTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(loadingIndicator)
    }
    
    private func bind() {
        viewModel.$apps
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.appsTableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
        
        viewModel.$searchQueryHistories
            .receive(on: DispatchQueue.main)
            .sink { query in
                self.searchHistoryTableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
        
        viewModel.updateSearchQuery
            .sink { text in
                self.searchController.searchBar.text = text
            }
            .store(in: &viewModel.cancellables)
        
        viewModel
            .$loading
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { loading in
                loading ? self.loadingIndicator.startAnimating() : self.loadingIndicator.stopAnimating()
            }
            .store(in: &viewModel.cancellables)
        
        viewModel
            .$renderingMode
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { mode in
                switch mode {
                case .apps:
                    self.searchHistoryTableView.isHidden = true
                    self.appsTableView.isHidden = false
                case .searchHistory:
                    self.searchHistoryTableView.isHidden = false
                    self.appsTableView.isHidden = true
                }
            }
            .store(in: &viewModel.cancellables)
        
        viewModel
            .searchCompleted
            .receive(on: DispatchQueue.main)
            .sink {
                self.searchController.searchBar.resignFirstResponder()
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
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel.searchBarTextDidBeginEditing()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        viewModel.searchBarTextDidEndEditing()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchHistoryTableView {
            return viewModel.searchQueryHistories.count
        } else {
            return viewModel.apps.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == searchHistoryTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell()
            let searchQuery = viewModel.searchQueryHistories[indexPath.row]
            cell.textLabel?.text = searchQuery
            cell.imageView?.image = .init(systemName: "magnifyingglass")
            cell.imageView?.tintColor = .gray
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AppListItemCell.identifier) as? AppListItemCell ?? AppListItemCell()
            let app = viewModel.apps[indexPath.row]
            cell.configUI(app: app)
            return cell
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == searchHistoryTableView {
            let query = viewModel.searchQueryHistories[indexPath.row]
            viewModel.tapSearchQuery(query: query)
        } else {
            let app = viewModel.apps[indexPath.row]
            coordinator.toAppDetail(from: self, app: app)
        }
    }
}
