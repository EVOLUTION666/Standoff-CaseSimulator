//
//  WeaponViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

protocol WeaponViewProtocol: AnyObject {
    
}

class WeaponViewController: ContainerViewController {
    
    // MARK: - Public
    
    var presenter: WeaponPresenterProtocol?
    
    // MARK: - Private
    
    private lazy var weaponNavBar = WeaponNavigationBarView().forAutoLayout()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension WeaponViewController {
    func initialize() {
        view.backgroundColor = .clear
        weaponNavBar.delegate = self
        setupVC()
        configureSubviews()
    }
    
    func setupVC() {
        let inventoryVC = InventoryModuleBuilder.build()
        let shopVC = ShopModuleBuilder.build()
        let marketVC = MarketModuleBuilder.build()
        self.setViewControllers([inventoryVC, shopVC, marketVC])
    }
    
    func configureSubviews() {
        self.contentStackView.addArrangedSubview(weaponNavBar)
    }
}

// MARK: - WeaponViewProtocol
extension WeaponViewController: WeaponViewProtocol {
    
}

// MARK: - WeaponNavigationBarViewDelegate
extension WeaponViewController: WeaponNavigationBarViewDelegate {
    func didSelect(index: Int) {
        changeSelectedViewController(at: index)
    }
}
