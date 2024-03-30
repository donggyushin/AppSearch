//
//  Divider.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class Divider: UIView {
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
