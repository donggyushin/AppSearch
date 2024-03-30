//
//  ImageCollectionView.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

final class ImageCollectionView: UIView {
    
    var images: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var cellCountInScreen: CGFloat = 3 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var spacing: CGFloat = 12 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: frame, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ inset: UIEdgeInsets) {
        collectionView.contentInset = inset
    }
    
    func set(isPagingEnabled: Bool) {
        collectionView.isPagingEnabled = isPagingEnabled
    }
    
    private func configUI() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ImageCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell ?? Cell()
        cell.set(imageUrl: images[indexPath.item])
        return cell
    }
}

extension ImageCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - ((cellCountInScreen - 1) * spacing)) / cellCountInScreen
        let height = collectionView.frame.height
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }
}
