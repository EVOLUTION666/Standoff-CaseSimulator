//
//  MarketViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

protocol MarketViewProtocol: AnyObject {
}

class MarketViewController: UIViewController {
    // MARK: - Public
    var presenter: MarketPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension MarketViewController {
    func initialize() {
    }
}

// MARK: - MarketViewProtocol
extension MarketViewController: MarketViewProtocol {
}
