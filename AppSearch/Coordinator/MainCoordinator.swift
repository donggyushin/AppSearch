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
    
    func openAppStore(appId: String) {
        guard let url = URL(string: "https://apps.apple.com/app/id\(appId)") else { return }
        UIApplication.shared.open(url)
    }
    
    func openAppStore(appId: Int) {
        openAppStore(appId: "\(appId)")
    }
}
