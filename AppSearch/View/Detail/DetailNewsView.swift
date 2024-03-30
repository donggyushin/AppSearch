//
//  NewsView.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

extension DetailViewController {
    final class NewsView: UIView {
        
        private lazy var titleLabel: TitleLabel = {
            let view = TitleLabel()
            view.text = "새로운 소식"
            return view
        }()
        
        private lazy var versionLabel: SecondaryLabel = {
            let view = SecondaryLabel()
            return view
        }()
        
        private lazy var padding: UIView = {
            let view = UIView()
            view.snp.makeConstraints { make in
                make.height.equalTo(1)
            }
            return view
        }()
        
        private lazy var notesView: ExpandableTextView = {
            let view = ExpandableTextView()
            return view
        }()
        
        private lazy var verticalStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [titleLabel, versionLabel, padding, notesView])
            view.axis = .vertical
            view.spacing = 4
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configUI(version: String, releaseNotes: String) {
            versionLabel.text = version
            notesView.text = releaseNotes
        }
        
        private func configUI() {
            addSubview(verticalStackView)
            verticalStackView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview().inset(10)
                make.left.right.equalToSuperview().inset(20)
            }
        }
    }
}
