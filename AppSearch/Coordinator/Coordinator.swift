//
//  Coordinator.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func toAppDetail(from: UIViewController, app: App)
}
