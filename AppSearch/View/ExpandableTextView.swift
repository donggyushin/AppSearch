//
//  ExpandableTextView.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit
import SnapKit

class ExpandableTextView: UIView {
    private let descriptionLabel = UILabel()
    private let moreButton = UIButton(type: .system)
    
    private var isExpanded = false {
        didSet {
            descriptionLabel.numberOfLines = isExpanded ? 0 : maximumNumberOfLines
            moreButton.setTitle(isExpanded ? "접기" : "더보기", for: .normal)
            layoutIfNeeded() // 확장/축소 시 레이아웃 업데이트
        }
    }
    
    var maximumNumberOfLines: Int = 3 {
        didSet {
            descriptionLabel.numberOfLines = maximumNumberOfLines
        }
    }
    
    var text: String? {
        didSet {
            descriptionLabel.text = text
            checkTextLength()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        descriptionLabel.numberOfLines = maximumNumberOfLines
        descriptionLabel.lineBreakMode = .byTruncatingTail
        addSubview(descriptionLabel)
        
        moreButton.setTitle("더보기", for: .normal)
        moreButton.addTarget(self, action: #selector(toggleExpansion), for: .touchUpInside)
        addSubview(moreButton)
    }
    
    private func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.leading.bottom.equalToSuperview()
        }
    }
    
    private func checkTextLength() {
        let tempLabel = UILabel()
        tempLabel.numberOfLines = 0
        tempLabel.text = descriptionLabel.text
        tempLabel.font = descriptionLabel.font
        tempLabel.lineBreakMode = .byWordWrapping
        let maxWidth = descriptionLabel.bounds.width
        let size = tempLabel.sizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
        
        if size.height > descriptionLabel.font.lineHeight * CGFloat(maximumNumberOfLines) {
            moreButton.isHidden = false
        } else {
            moreButton.isHidden = true
        }
    }
    
    @objc private func toggleExpansion() {
        isExpanded.toggle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkTextLength()
    }
}

