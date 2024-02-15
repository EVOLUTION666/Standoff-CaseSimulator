//
//  ShopViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

protocol ShopViewProtocol: AnyObject {
}

class ShopViewController: UIViewController {
    // MARK: - Public
    var presenter: ShopPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension ShopViewController {
    func initialize() {
        view.backgroundColor = .white
    }
}

// MARK: - ShopViewProtocol
extension ShopViewController: ShopViewProtocol {
}
