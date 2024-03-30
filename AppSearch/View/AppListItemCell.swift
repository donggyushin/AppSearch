//
//  AppListItemCell.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class AppListItemCell: UITableViewCell {
    static let identifier = "AppListItemCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        
    }
}
