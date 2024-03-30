//
//  MainCoordinator.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toAppDetail(from: UIViewController, app: App) {
        print("navigate to app detail controller")
    }
}
