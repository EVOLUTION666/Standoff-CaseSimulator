//
//  WeaponViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

protocol WeaponViewProtocol: AnyObject {
}

class WeaponViewController: UIViewController {
    // MARK: - Public
    var presenter: WeaponPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension WeaponViewController {
    func initialize() {
    }
}

// MARK: - WeaponViewProtocol
extension WeaponViewController: WeaponViewProtocol {
}
