//
//  MarketViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

protocol MarketViewProtocol: AnyObject {
    
}

class MarketViewController: ContainerViewController {
    
    // MARK: - Public
    var presenter: MarketPresenterProtocol?
    
    // MARK: - Private
    private lazy var marketNavBar = MarketNavBarView().forAutoLayout()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension MarketViewController {
    func initialize() {
        view.backgroundColor = .white
        marketNavBar.delegate = self
        setupViewControllers()
        configureNavBar()
    }
    
    func setupViewControllers() {
        let tradingPlatformVC = ChildTradingPlatformViewController()
        let promotionVC = ChildPromotionMarketViewController()
        self.setViewControllers([tradingPlatformVC, promotionVC])
    }
    
    func configureNavBar() {
        self.contentStackView.addArrangedSubview(marketNavBar)
        marketNavBar.setConstraintsForNavBar()
    }
}

// MARK: - MarketViewProtocol
extension MarketViewController: MarketViewProtocol {
    
}

extension MarketViewController: MarketNavBarViewDelegate {
    func didSelect(index: Int) {
        self.changeSelectedViewController(at: index)
    }
    
    
}
