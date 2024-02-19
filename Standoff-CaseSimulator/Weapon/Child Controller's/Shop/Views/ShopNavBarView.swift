//
//  ShopNavBarView.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 18.02.2024.
//

import UIKit

protocol ShopNavBarViewDelegate: AnyObject {
    func didSelect(index: Int)
}

class ShopNavBarView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: ShopNavBarViewDelegate?
    
    private var selectedIndex = 0 {
        didSet {
            [shopButton, promotionButton].forEach {
                if $0.tag == oldValue {
                    $0.backgroundColor = .clear
                }
                if $0.tag == selectedIndex {
                    $0.backgroundColor = .grayWith50Alpha
                }
            }
        }
    }
        
    private lazy var shopButton: UIButton = {
        let shopButton = UIButton(type: .system)
        shopButton.translatesAutoresizingMaskIntoConstraints = false
        shopButton.setTitle("МАГАЗИН", for: .normal)
        shopButton.setTitleColor(.textPrimary, for: .normal)
        shopButton.tag = 0
        shopButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        shopButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        return shopButton
    }()
    
    private lazy var promotionButton: UIButton = {
        let promotionButton = UIButton(type: .system)
        promotionButton.translatesAutoresizingMaskIntoConstraints = false
        promotionButton.setTitle("АКЦИИ", for: .normal)
        promotionButton.setTitleColor(.textPrimary, for: .normal)
        promotionButton.tag = 1
        promotionButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        promotionButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        return promotionButton
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution  = .fillEqually
        buttonStackView.alignment = UIStackView.Alignment.leading
        return buttonStackView
    }()
    
    // MARK: - Life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    // MARK: - @objc funcs
    
    @objc
    private func didChangeSelected(_ sender: UIButton) {
        self.selectedIndex = sender.tag
        delegate?.didSelect(index: sender.tag)
    }

}

// MARK: - Extension

private extension ShopNavBarView {
    
    func initialize() {
        configureNavBarView()
    }
    
    func configureNavBarView() {
        // Set colors
        self.backgroundColor = .blackWith40Alpha
        shopButton.backgroundColor = .grayWith50Alpha
        // Set subview's
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(shopButton)
        buttonStackView.addArrangedSubview(promotionButton)
        // Set constraints
        buttonStackView.setSimpleConstraints()
    }
    
//    func configureSubviews() {
//        addSubview(buttonStackView)
//        buttonStackView.addArrangedSubview(shopButton)
//        buttonStackView.addArrangedSubview(promotionButton)
//    }
//    
//    func configureConstraints() {
//        buttonStackView.setSimpleConstraints()
////        NSLayoutConstraint.activate([
////        
////            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
////            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
////            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
////            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
////            
////        ])
//    }
}
