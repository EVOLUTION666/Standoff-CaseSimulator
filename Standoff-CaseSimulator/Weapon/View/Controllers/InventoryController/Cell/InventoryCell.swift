//
//  InventoryCollectionCell.swift
//  Standoff-CaseSimulator
//
//  Created by Александр Горелкин on 14.02.2024.
//

import UIKit
final class InventoryCell: UICollectionViewCell {
    static let identifier = String(describing: InventoryCell.self)
    private lazy var inventoryImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.autoresizingMask = .flexibleHeight
        return imageView
    }()
    private lazy var inventoryLabel = CustomLabel(text: "inventory Text", font: .boldSystemFont(ofSize: 11), textColor: .white, textAlignment: .center)
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear.withAlphaComponent(0.2)
        inventoryLabel.backgroundColor = .clear
        setupSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubviews() {
        addView(inventoryImageView)
        addView(inventoryLabel)
        NSLayoutConstraint.activate([
            inventoryImageView.topAnchor.constraint(equalTo: topAnchor),
            inventoryImageView.leftAnchor.constraint(equalTo: leftAnchor),
            inventoryImageView.rightAnchor.constraint(equalTo: rightAnchor),
            
            inventoryLabel.topAnchor.constraint(equalTo: inventoryImageView.bottomAnchor, constant: 3),
            inventoryLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 15),
            inventoryLabel.leftAnchor.constraint(equalTo: leftAnchor),
            inventoryLabel.rightAnchor.constraint(equalTo: rightAnchor),
            inventoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
    func setupCell(inventoryModel: AchivmentModel) {
        inventoryLabel.text = inventoryModel.title
        inventoryImageView.image = UIImage(named: "\(inventoryModel.image)")
    }
}

