//
//  InventoryCollectionViewCell.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 17.02.2024.
//

import UIKit

class InventoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identidier = String(describing: InventoryCollectionViewCell.self)
    
    // MARK: - Private
    
    private lazy var squareBackViewWeapon: UIView = {
        let squareBackView = UIView().forAutoLayout()
        squareBackView.backgroundColor = .clear
        
        return squareBackView
    }()
    
    private lazy var weaponColorLineView: UIView = {
        let weaponColorLineView = UIView().forAutoLayout()
        weaponColorLineView.backgroundColor = .blueGradientStart
        return weaponColorLineView
    }()
    
    private lazy var weaponNameLabel: UILabel = {
        let weaponNameLabel = UILabel().forAutoLayout()
        weaponNameLabel.textColor = .textPrimary
        weaponNameLabel.text = "ARK Scale"
        weaponNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        weaponNameLabel.textAlignment = .left
        return weaponNameLabel
    }()
    
    private lazy var weaponIcon: UIImageView = {
        let weaponIcon = UIImageView().forAutoLayout()
        weaponIcon.image = UIImage(named: "akr")
        weaponIcon.contentMode = .scaleAspectFill
        weaponIcon.clipsToBounds = true
        return weaponIcon
    }()
    
    // MARK: - View Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViewCell()
    }
}

// MARK: - Extension

private extension InventoryCollectionViewCell {
    
    func configureViewCell() {
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        contentView.addSubview(squareBackViewWeapon)
        squareBackViewWeapon.backgroundColor = .gray2With30Alpha
        squareBackViewWeapon.addSubview(weaponIcon)
        squareBackViewWeapon.addSubview(weaponColorLineView)
        weaponColorLineView.addSubview(weaponNameLabel)
    }
    
    func configureConstraints() {
        
        squareBackViewWeapon.setSimpleConstraints()
        
        NSLayoutConstraint.activate([
            weaponIcon.topAnchor.constraint(equalTo: squareBackViewWeapon.topAnchor),
            weaponIcon.leadingAnchor.constraint(equalTo: squareBackViewWeapon.leadingAnchor),
            weaponIcon.trailingAnchor.constraint(equalTo: squareBackViewWeapon.trailingAnchor),
            
            weaponColorLineView.topAnchor.constraint(equalTo: weaponIcon.bottomAnchor),
            weaponColorLineView.leadingAnchor.constraint(equalTo: squareBackViewWeapon.leadingAnchor),
            weaponColorLineView.trailingAnchor.constraint(equalTo: squareBackViewWeapon.trailingAnchor),
            weaponColorLineView.bottomAnchor.constraint(equalTo: squareBackViewWeapon.bottomAnchor),
            weaponColorLineView.heightAnchor.constraint(equalToConstant: 20),
            
            weaponNameLabel.topAnchor.constraint(equalTo: weaponColorLineView.topAnchor),
            weaponNameLabel.leadingAnchor.constraint(equalTo: weaponColorLineView.leadingAnchor, constant: 5),
            weaponNameLabel.trailingAnchor.constraint(equalTo: weaponColorLineView.trailingAnchor),
            weaponNameLabel.bottomAnchor.constraint(equalTo: weaponColorLineView.bottomAnchor),
        ])
    }
}
