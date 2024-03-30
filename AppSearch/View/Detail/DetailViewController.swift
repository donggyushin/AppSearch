//
//  DetailViewController.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class DetailViewController: UIViewController {
    
    init(app: App) {
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
    }
}
