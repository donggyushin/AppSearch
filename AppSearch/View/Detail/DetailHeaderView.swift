//
//  HeaderView.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit
import SDWebImage

protocol DetailHeaderDelegate: AnyObject {
    func tapDownloadButton(appId: Int)
}

extension DetailViewController {
    final class HeaderView: UIView {
        private var appId: Int?
        
        weak var delegate: DetailHeaderDelegate?
        
        private lazy var imageView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.snp.makeConstraints { make in
                make.width.height.equalTo(80)
            }
            view.layer.cornerRadius = 18
            view.clipsToBounds = true
            return view
        }()
        
        private lazy var titleLabel = TitleLabel()

        private lazy var genresLabel: SecondaryLabel = {
            let view = SecondaryLabel()
            view.numberOfLines = 2
            return view
        }()
        
        private lazy var downloadButton: UIButton = {
            let view = UIButton(type: .system)
            view.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)
            view.addTarget(self, action: #selector(tapDownload), for: .touchUpInside)
            return view
        }()
        
        private lazy var rightVerticalStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [titleLabel, genresLabel, UIView(), downloadButton])
            view.alignment = .leading
            view.axis = .vertical
            view.spacing = 4
            return view
        }()
        
        private lazy var horizontalStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [imageView, rightVerticalStackView])
            view.axis = .horizontal
            view.spacing = 12
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configUI(appId: Int, imageUrl: String, title: String, genres: [String]) {
            self.appId = appId
            imageView.sd_setImage(with: .init(string: imageUrl))
            titleLabel.text = title
            genresLabel.text = genres.joined(separator: ",")
        }
        
        private func configUI() {
            addSubview(horizontalStackView)
            horizontalStackView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview().inset(10)
                make.left.right.equalToSuperview().inset(20)
            }
        }
        
        @objc private func tapDownload() {
            guard let appId else { return }
            delegate?.tapDownloadButton(appId: appId)
        }
    }
}
