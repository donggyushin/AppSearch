//
//  TestViewController.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

class TestViewController: UIViewController {
    
    private lazy var imageCollectionView: ImageCollectionView = {
        let view = ImageCollectionView()
        view.images = [
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/a4/bb/fa/a4bbfaea-49e9-12ca-5f78-4e1bea0b2dcd/19912b69-5483-48e1-be6a-667ba4d22b75_screenshot_01.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/a4/bb/fa/a4bbfaea-49e9-12ca-5f78-4e1bea0b2dcd/19912b69-5483-48e1-be6a-667ba4d22b75_screenshot_01.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/a4/bb/fa/a4bbfaea-49e9-12ca-5f78-4e1bea0b2dcd/19912b69-5483-48e1-be6a-667ba4d22b75_screenshot_01.jpg/392x696bb.jpg",
        ]
        view.cellCountInScreen = 3
//        view.set(.init(top: 0, left: 12, bottom: 0, right: 12))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageCollectionView)
        imageCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(350)
        }
    }
}
