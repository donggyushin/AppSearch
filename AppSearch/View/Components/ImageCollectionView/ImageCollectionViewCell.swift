//
//  ImageCollectionViewCell.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit
import SDWebImage

extension ImageCollectionView {
    final class Cell: UICollectionViewCell {
        static let identifier = "ImageCollectionViewCell"
        
        private lazy var imageView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFill
            view.layer.cornerRadius = 12
            view.clipsToBounds = true
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            imageView.image = nil
        }
        
        func set(imageUrl: String) {
            imageView.sd_setImage(with: URL(string: imageUrl))
        }
        
        private func configUI() {
            addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}
