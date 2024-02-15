//
//  InventoryViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

protocol InventoryViewProtocol: AnyObject {
    
}

class InventoryViewController: UIViewController {
    // MARK: - Public
    var presenter: InventoryPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension InventoryViewController {
    func initialize() {
        view.backgroundColor = .blue
    }
}

// MARK: - InventoryViewProtocol
extension InventoryViewController: InventoryViewProtocol {
}
