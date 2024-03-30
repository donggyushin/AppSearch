//
//  AppListItemCell.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit
import SnapKit
import SDWebImage

final class AppListItemCell: UITableViewCell {
    static let identifier = "AppListItemCell"
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var nameView: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: UIFont.systemFontSize)
        return view
    }()
    
    private lazy var genresView: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
        view.textColor = .secondaryLabel
        return view
    }()
    
    private lazy var labelsContainerView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameView, genresView])
        view.alignment = .leading
        view.axis = .vertical
        view.spacing = 8 
        return view
    }()
    
    private lazy var appTitleSection: UIStackView = {
        let view = UIStackView(arrangedSubviews: [iconView, labelsContainerView])
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 12
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [appTitleSection])
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        iconView.image = nil
    }
    
    func configUI(app: App) {
        iconView.sd_setImage(with: URL(string: app.artworkUrl100))
        nameView.text = app.trackName
        genresView.text = app.genres.joined(separator: ",")
    }
    
    private func configUI() {
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
}