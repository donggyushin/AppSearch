//
//  DetailViewController.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let app: App
    
    private lazy var scrollView = UIScrollView()
    private lazy var contentsView = UIView()
    
    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.configUI(appId: app.trackId, imageUrl: app.artworkUrl512, title: app.trackName, genres: app.genres)
        view.delegate = self
        return view
    }()
    
    private lazy var newsView: NewsView = {
        let view = NewsView()
        view.configUI(version: app.version, releaseNotes: app.releaseNotes ?? "")
        return view
    }()
    
    private lazy var preview: Preview = {
        let view = Preview()
        view.set(images: app.screenshotUrls)
        return view
    }()
    
    private lazy var infoView: InfoView = {
        let view = InfoView()
        view.configUI(description: app.description)
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [headerView, Divider(), newsView, Divider(), preview, Divider(), infoView, UIView()])
        view.axis = .vertical
        return view
    }()
    
    init(app: App) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentsView)
        contentsView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width)
        }
        
        contentsView.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension DetailViewController: DetailHeaderDelegate {
    func tapDownloadButton(appId: Int) {
        coordinator.openAppStore(appId: appId)
    }
}
