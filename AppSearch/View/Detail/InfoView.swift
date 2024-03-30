//
//  InfoView.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

extension DetailViewController {
    final class InfoView: UIView {
        
        private lazy var expandableView = ExpandableTextView()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configUI(description: String) {
            expandableView.text = description
        }
        
        private func configUI() {
            addSubview(expandableView)
            expandableView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview().inset(10)
                make.left.right.equalToSuperview().inset(20)
            }
        }
    }
}
