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
        view.layer.cornerRadius = 12
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var nameView = PrimaryLabel()
    
    private lazy var genresView = SecondaryLabel()
    
    private lazy var labelsContainerView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameView, genresView])
        view.alignment = .leading
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    private lazy var appTitleSection: UIStackView = {
        let view = UIStackView(arrangedSubviews: [iconView, labelsContainerView])
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 12
        return view
    }()
    
    private lazy var starRatingView: StarRatingView = {
        let view = StarRatingView()
        return view
    }()
    
    private lazy var starRatingNumberView: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
        view.textColor = .secondaryLabel
        return view
    }()
    
    private lazy var starRatingViewContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [starRatingView, starRatingNumberView, UIView()])
        view.axis = .horizontal
        return view
    }()
    
    private lazy var imageCollectionView: ImageCollectionView = {
        let view = ImageCollectionView()
        view.snp.makeConstraints { make in
            make.height.equalTo(210)
        }
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [appTitleSection, starRatingViewContainer])
        view.axis = .vertical
        view.spacing = 10
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
        imageCollectionView.removeFromSuperview()
    }
    
    func configUI(app: App) {
        iconView.sd_setImage(with: URL(string: app.artworkUrl100))
        nameView.text = app.trackName
        genresView.text = app.genres.joined(separator: ",")
        starRatingView.set(rating: app.averageUserRating)
        starRatingNumberView.text = app.formattedAverageUserRating
        
        let images = app.screenshotUrls.prefix(3).map({ String($0) })
        if images.isEmpty == false {
            imageCollectionView.images = images
            verticalStackView.addArrangedSubview(imageCollectionView)
        }
    }
    
    private func configUI() {
        selectionStyle = .none
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(20)
        }
    }
}
