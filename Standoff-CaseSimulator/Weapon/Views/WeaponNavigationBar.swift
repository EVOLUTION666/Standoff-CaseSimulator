//
//  WeaponNavigationBar.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 15.02.2024.
//

import UIKit

protocol WeaponNavigationBarViewDelegate: AnyObject {
    func didSelect(index: Int)
}

class WeaponNavigationBarView: UIView {
    
    weak var delegate: WeaponNavigationBarViewDelegate?
    
    private var selectedIndex = 0 {
        didSet {
            [inventoryButton, shopButton, marketButton].forEach {
                if $0.tag == oldValue {
                    $0.backgroundColor = .clear
                }
                if $0.tag == selectedIndex {
                    $0.backgroundColor = .grayWith50Alpha
                }
            }
        }
    }
    
    private lazy var inventoryButton: UIButton = {
        let inventoryButton = UIButton(type: .system).forAutoLayout()
        inventoryButton.setTitle("ИНВЕНТАРЬ", for: .normal)
        inventoryButton.setTitleColor(.textPrimary, for: .normal)
        inventoryButton.tag = 0
        inventoryButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        inventoryButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return inventoryButton
    }()
    
    private lazy var shopButton: UIButton = {
        let shopButton = UIButton(type: .system).forAutoLayout()
        shopButton.setTitle("МАГАЗИН", for: .normal)
        shopButton.setTitleColor(.textPrimary, for: .normal)
        shopButton.tag = 1
        shopButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        shopButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return shopButton
    }()
    
    private lazy var marketButton: UIButton = {
        let marketButton = UIButton(type: .system).forAutoLayout()
        marketButton.setTitle("РЫНОК", for: .normal)
        marketButton.setTitleColor(.textPrimary, for: .normal)
        marketButton.tag = 2
        marketButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        marketButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return marketButton
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView().forAutoLayout()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution  = .fillEqually
        buttonStackView.alignment = UIStackView.Alignment.leading
        return buttonStackView
    }()
    
    private lazy var goldCurrencyView: GoldCurrencyView = {
        let goldCurrencyView = GoldCurrencyView().forAutoLayout()
        return goldCurrencyView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let generalStackView = UIStackView().forAutoLayout()
        generalStackView.alignment = .trailing
        return generalStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    @objc
    private func didChangeSelected(_ sender: UIButton) {
        self.selectedIndex = sender.tag
        delegate?.didSelect(index: sender.tag)
    }
}

extension WeaponNavigationBarView {
    
    private func configureView() {
        backgroundColor = .blackWith70Alpha
        inventoryButton.backgroundColor = .grayWith50Alpha
        configureSubviews()
        setupConstraints()
    }
    
    private func configureSubviews() {
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(inventoryButton)
        buttonStackView.addArrangedSubview(shopButton)
        buttonStackView.addArrangedSubview(marketButton)
        addSubview(goldCurrencyView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            goldCurrencyView.leadingAnchor.constraint(equalTo: buttonStackView.trailingAnchor, constant: 100),
            goldCurrencyView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            goldCurrencyView.centerYAnchor.constraint(equalTo: buttonStackView.centerYAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            goldCurrencyView.heightAnchor.constraint(equalToConstant: 20),
        
        ])
    }
    
}

