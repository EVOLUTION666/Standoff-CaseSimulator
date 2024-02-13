//
//  AchievementsView.swift
//  Standoff-CaseSimulator
//
//  Created by Александр Горелкин on 13.02.2024.
//

import UIKit
final class AchievementsView: UIView {
    private var dataArray: [AchivmentModel] = []
    private lazy var achievementsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(AchivmentCell.self, forCellWithReuseIdentifier: AchivmentCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        return collectionView
    }()
    init() {
        super.init(frame: .zero)
        addView(achievementsCollectionView)
        NSLayoutConstraint.activate([
            achievementsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            achievementsCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            achievementsCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            achievementsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupWithData(array: [AchivmentModel]) {
        self.dataArray = array
        Task {
            self.achievementsCollectionView.reloadData
        }
    }
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1/2)), repeatingSubitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}
extension AchievementsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchivmentCell.identifier, for: indexPath) as! AchivmentCell
        cell.setupCell(achivmentModel: dataArray[indexPath.row])
        return cell
    }
}

