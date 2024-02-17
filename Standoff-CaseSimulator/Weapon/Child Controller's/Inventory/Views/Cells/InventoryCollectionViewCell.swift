//
//  InventoryCollectionViewCell.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 17.02.2024.
//

import UIKit

class InventoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public
    
    static let identifier = "InventoryCollectionViewCell"
    
    // MARK: - Private
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [backgroundWeaponImageView, rareIndicatorView]).forAutoLayout()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var backgroundWeaponImageView: UIView = {
        let backgroundWeaponImageView = UIView().forAutoLayout()
        backgroundWeaponImageView.backgroundColor = .white
        return backgroundWeaponImageView
    }()
    
    private lazy var weaponImageView: UIImageView = {
        let imageView = UIImageView().forAutoLayout()
        imageView.image = UIImage(named: "akr")
        return imageView
    }()
    
    private lazy var rareIndicatorView: UIView = {
        let rareIndicatorView = UIView().forAutoLayout()
        rareIndicatorView.backgroundColor = .red
        return rareIndicatorView
    }()
    
    private lazy var nameWeaponLabel: UILabel = {
        let nameWeaponLabel = UILabel().forAutoLayout()
        nameWeaponLabel.text = "AKR Scale"
        nameWeaponLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        nameWeaponLabel.textColor = .black
        return nameWeaponLabel
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

private extension InventoryCollectionViewCell {
    func initialize() {
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        addSubview(stackView)
        backgroundWeaponImageView.addSubview(weaponImageView)
        rareIndicatorView.addSubview(nameWeaponLabel)
    }
    
    func configureConstraints() {
        stackView.setSimpleConstraints()
    }
}
