//
//  ChildTradingPlatformViewController.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 19.02.2024.
//

import UIKit

class ChildTradingPlatformViewController: UIViewController {
    
    // MARK: - Public
    private lazy var tradingContainerView = TradingContainterView().forAutoLayout()
    private lazy var sortingView = TradingSortFilterView().forAutoLayout()
    
    // MARK: - Private
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

private extension ChildTradingPlatformViewController {
    
    func initialize() {
        view.backgroundColor = .red
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        view.addSubview(tradingContainerView)
        view.addSubview(sortingView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            sortingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            sortingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            sortingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            sortingView.widthAnchor.constraint(equalToConstant: 166),
            
            tradingContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            tradingContainerView.leadingAnchor.constraint(equalTo: sortingView.trailingAnchor, constant: 5),
            tradingContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tradingContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            
        ])
    }
}
