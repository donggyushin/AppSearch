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
    
    private lazy var moreButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("더보기", for: .normal)
        return view
    }()
    
    private var isExpanded = false {
        didSet {
            descriptionLabel.numberOfLines = isExpanded ? 0 : maximumNumberOfLines
            if isExpanded {
                moreButton.isHidden = true
            }
            layoutIfNeeded()
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
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkTextLength()
    }
    
    private func configUI() {
        descriptionLabel.numberOfLines = maximumNumberOfLines
        descriptionLabel.lineBreakMode = .byTruncatingTail
        addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        moreButton.setTitle("더보기", for: .normal)
        moreButton.addTarget(self, action: #selector(expand), for: .touchUpInside)
        addSubview(moreButton)
        
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
        
        if size.height <= descriptionLabel.font.lineHeight * CGFloat(maximumNumberOfLines) {
            moreButton.isHidden = true
        }
    }
    
    @objc private func expand() {
        isExpanded = true
    }
}

