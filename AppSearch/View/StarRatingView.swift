//
//  StarRatingView.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class StarRatingView: UIView {
    private var rating: CGFloat = 0 {
        didSet {
            updateStarRatings()
        }
    }
    
    private lazy var starViews: [UIImageView] = {
        var views: [UIImageView] = []
        
        for _ in 0..<5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "star")
            imageView.tintColor = .gray
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(15)
            }
            views.append(imageView)
        }
        
        return views
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: starViews)
        view.axis = .horizontal
        view.spacing = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func set(rating: CGFloat) {
        self.rating = rating
    }
    
    private func configUI() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func updateStarRatings() {
        for (index, imageView) in starViews.enumerated() {
            if CGFloat(index) < rating {
                imageView.image = .init(systemName: "star.fill")
            } else {
                imageView.image = .init(systemName: "star")
            }
        }
    }
}

