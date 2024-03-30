//
//  MainCoordinator.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

var coordinator: Coordinator = MainCoordinator()

final class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func toAppDetail(from: UIViewController, app: App) {
        navigationController?.pushViewController(DetailViewController(app: app), animated: true)
    }
}
