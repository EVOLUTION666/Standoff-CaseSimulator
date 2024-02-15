//
//  InventoryViewController.swift
//  Standoff-CaseSimulator
//
//  Created by Александр Горелкин on 14.02.2024.
//

import UIKit
final class InventoryViewController: UIViewController {
    private var inventoryData: [AchivmentModel] = []
    private lazy var inventoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(InventoryCell.self, forCellWithReuseIdentifier: InventoryCell.identifier)
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    private func setupSubviews() {
        view.addView(inventoryCollectionView)
        NSLayoutConstraint.activate([
            inventoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            inventoryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            inventoryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            inventoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        
        ])
    }
    func setupCollectionView(with data: [AchivmentModel]) {
        self.inventoryData = data
        Task {
            inventoryCollectionView.reloadData()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1/5),
                                                                         heightDimension: .fractionalHeight(1)),
                                                       repeatingSubitem: item,
                                                       count: 5)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
extension InventoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        inventoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InventoryCell.identifier, for: indexPath) as! InventoryCell
        cell.setupCell(inventoryModel: inventoryData[indexPath.row])
        return cell
    }
}
