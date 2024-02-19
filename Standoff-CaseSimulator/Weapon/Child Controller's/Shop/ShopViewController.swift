//
//  ShopViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

protocol ShopViewProtocol: AnyObject {
    
}

class ShopViewController: ContainerViewController {
    
    // MARK: - Public
    
    var presenter: ShopPresenterProtocol?
    
    // MARK: - Private
    
    private lazy var shopNavBar = ShopNavBarView().forAutoLayout()

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
        shopNavBar.delegate = self
        setupViewControllers()
        configureNavBar()
    }
    
    func setupViewControllers() {
        let shop = ChildShopViewController()
        let promotion = ChildPromotionViewController()
        self.setViewControllers([shop, promotion])
    }
    
    func configureNavBar() {
        self.contentStackView.addArrangedSubview(shopNavBar)
        shopNavBar.setConstraintsForNavBar()
    }
    
//    func configureSubviews() {
//        self.contentStackView.addArrangedSubview(shopNavBar)
//    }
//    
//    func configureConstraints() {
//        NSLayoutConstraint.activate([
//        
//            shopNavBar.topAnchor.constraint(equalTo: view.topAnchor),
//            shopNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            shopNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            
//        ])
//    }
}

extension ShopViewController: ShopNavBarViewDelegate {
    func didSelect(index: Int) {
        self.changeSelectedViewController(at: index)
    }
}


// MARK: - ShopViewProtocol
extension ShopViewController: ShopViewProtocol {
    
}
