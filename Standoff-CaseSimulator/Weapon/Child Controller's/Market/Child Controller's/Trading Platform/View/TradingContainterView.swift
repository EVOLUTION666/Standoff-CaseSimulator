//
//  TradingContainterView.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 19.02.2024.
//

import UIKit

class TradingContainterView: UIView {
    
    // MARK: - Private
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: compositionalLayout()).forAutoLayout()
        collectionView.backgroundColor = .white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TradingContainterView")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - View Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension TradingContainterView {
    
    func initialize() {
        configureCollectionView()
    }
    
    func configureCollectionView() {
        addSubview(collectionView)
        collectionView.setSimpleConstraints()
    }
    
    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let fraction: CGFloat = 1 / 4
        let spacing = CGFloat(5)
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1 / 2.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsetsReference = .none
        
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: -10, trailing: spacing)
        return UICollectionViewCompositionalLayout(section: section)
    }

}

extension TradingContainterView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TradingContainterView", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
}


