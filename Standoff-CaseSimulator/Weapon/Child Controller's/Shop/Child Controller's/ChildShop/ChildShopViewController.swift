//
//  ChildShopViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 18.02.2024
//

import UIKit

protocol ChildShopViewProtocol: AnyObject {
    
}

class ChildShopViewController: UIViewController {
    
    // MARK: - Public
    
    // MARK: - Private

    private lazy var shopContainerView = ShopContainerView().forAutoLayout()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension ChildShopViewController {
    func initialize() {
        view.backgroundColor = .red
        view.addSubview(shopContainerView)
        shopContainerView.setSimpleConstraints(constant: 5)
    }
}

// MARK: - ChildShopViewProtocol
extension ChildShopViewController: ChildShopViewProtocol {
    
}
