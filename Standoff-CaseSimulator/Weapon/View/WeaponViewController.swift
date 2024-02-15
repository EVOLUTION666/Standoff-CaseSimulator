//
//  WeaponViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

protocol WeaponViewProtocol: AnyObject {
}

final class WeaponViewController: ContainerViewController, WeaponNavigationBarViewDelegate {
    // MARK: - Public
    var presenter: WeaponPresenterProtocol?
    private lazy var weaponNavBar = WeaponNavigationBarView()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    func didSelect(index: Int) {
        <#code#>
    }
}

// MARK: - Private functions
private extension WeaponViewController {
    func initialize() {
        view.backgroundColor = .green
        view.addView(weaponNavBar)
        NSLayoutConstraint.activate([
            weaponNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            weaponNavBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            weaponNavBar.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
// MARK: - WeaponViewProtocol
extension WeaponViewController: WeaponViewProtocol {
    
}
