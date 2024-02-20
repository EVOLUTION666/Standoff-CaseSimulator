//
//  TradingCollectionViewCell.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 20.02.2024.

import UIKit

class TradingCollectionViewCell: UICollectionViewCell {
    
    static let identidier = String(describing: TradingCollectionViewCell.self)
    
    // MARK: - Properties
    
    private lazy var squareBackViewWeapon: UIView = {
        let squareBackView = UIView().forAutoLayout()
        squareBackView.backgroundColor = .clear

        return squareBackView
    }()
    
    private lazy var weaponColorLineView: UIView = {
        let weaponColorLineView = UIView().forAutoLayout()
        weaponColorLineView.backgroundColor = .blue
        return weaponColorLineView
    }()
    
    private lazy var weaponNameLabel: UILabel = {
        let weaponNameLabel = UILabel().forAutoLayout()
        weaponNameLabel.textColor = .textPrimary
        weaponNameLabel.text = "ARK SCALE"
        weaponNameLabel.textAlignment = .left
        weaponNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return weaponNameLabel
    }()
    
    private lazy var weaponIcon: UIImageView = {
        let weaponIcon = UIImageView().forAutoLayout()
        weaponIcon.image = UIImage(named: "akr")
        weaponIcon.contentMode = .scaleAspectFit
        weaponIcon.clipsToBounds = true
        return weaponIcon
    }()
    
    private lazy var statTrackLabel: UILabel = {
        let statTrackLabel = UILabel().forAutoLayout()
        statTrackLabel.text = "StatTrack*"
        statTrackLabel.font = UIFont.systemFont(ofSize: 12)
        statTrackLabel.textColor = UIColor(named: "FF900D")
        return statTrackLabel
    }()
    
    private lazy var bottomView: UIView = {
        let bottomView = UIView().forAutoLayout()
        bottomView.backgroundColor = .gray2With30Alpha
        return bottomView
    }()
    
    private lazy var countLabel: UILabel = {
        let countLabel = UILabel().forAutoLayout()
        countLabel.text = "343 ШТ"
        countLabel.textColor = .white
        countLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return countLabel
    }()
    
    private lazy var goldIcon: UIImageView = {
        let goldIcon = UIImageView().forAutoLayout()
        goldIcon.image = UIImage(named: "gold")
        return goldIcon
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel().forAutoLayout()
        priceLabel.text = "120.00"
        priceLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        priceLabel.textColor = .white
        return priceLabel
    }()
    
    // MARK: - Life cycle
    
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

private extension TradingCollectionViewCell {
    
    func configureViewCell() {
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        contentView.addSubview(squareBackViewWeapon)
        squareBackViewWeapon.addSubview(weaponIcon)
        weaponIcon.addSubview(statTrackLabel)
        squareBackViewWeapon.addSubview(weaponColorLineView)
        squareBackViewWeapon.addSubview(bottomView)
        weaponColorLineView.addSubview(weaponNameLabel)
        bottomView.addSubview(countLabel)
        bottomView.addSubview(goldIcon)
        bottomView.addSubview(priceLabel)
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
            weaponColorLineView.heightAnchor.constraint(equalToConstant: 20),
            
            bottomView.topAnchor.constraint(equalTo: weaponColorLineView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: squareBackViewWeapon.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: squareBackViewWeapon.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: squareBackViewWeapon.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 17),
            
            weaponNameLabel.topAnchor.constraint(equalTo: weaponColorLineView.topAnchor),
            weaponNameLabel.leadingAnchor.constraint(equalTo: weaponColorLineView.leadingAnchor, constant: 5),
            weaponNameLabel.trailingAnchor.constraint(equalTo: weaponColorLineView.trailingAnchor),
            weaponNameLabel.bottomAnchor.constraint(equalTo: weaponColorLineView.bottomAnchor),
            
            countLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
            countLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 5),
            countLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -5),
            priceLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            
            goldIcon.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            goldIcon.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -2),
            goldIcon.heightAnchor.constraint(equalToConstant: 8),
            goldIcon.widthAnchor.constraint(equalToConstant: 8),
            
            statTrackLabel.leadingAnchor.constraint(equalTo: weaponIcon.leadingAnchor, constant: 5),
            statTrackLabel.bottomAnchor.constraint(equalTo: weaponIcon.bottomAnchor, constant: -3),
            
        ])
    }
}

