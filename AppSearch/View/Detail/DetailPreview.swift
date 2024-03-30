//
//  Preview.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

extension DetailViewController {
    final class Preview: UIView {
        
        private lazy var titleLabel: TitleLabel = {
            let view = TitleLabel()
            view.text = "미리 보기"
            return view
        }()
        
        private lazy var imageCollectionView: ImageCollectionView = {
            let view = ImageCollectionView()
            view.set(.init(top: 0, left: 20, bottom: 0, right: 20))
            view.cellCountInScreen = 1.5
            view.snp.makeConstraints { make in
                make.height.equalTo(500)
            }
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func set(images: [String]) {
            imageCollectionView.images = images
        }
        
        private func configUI() {
            addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.left.equalToSuperview().inset(20)
                make.top.equalToSuperview().inset(10)
            }
            
            addSubview(imageCollectionView)
            imageCollectionView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview().inset(20)
            }
        }
    }
}
