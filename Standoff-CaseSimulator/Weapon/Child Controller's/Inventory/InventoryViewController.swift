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
    
    // MARK: - Private
    
    private lazy var inventoryContainerView = InventoryView().forAutoLayout()

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
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        view.addSubview(inventoryContainerView)
    }
    
    func configureConstraints() {
        inventoryContainerView.setSimpleConstraints(constant: 5)
    }
}

// MARK: - InventoryViewProtocol
extension InventoryViewController: InventoryViewProtocol {
    
}
