//
//  WeaponNavigationBarView.swift
//  Standoff-CaseSimulator
//
//  Created by Александр Горелкин on 14.02.2024.
//

import UIKit
protocol WeaponNavigationBarViewDelegate: AnyObject {
    func didSelect(index: Int)
}
final class WeaponNavigationBarView: UIView {
    private weak var delegate: WeaponNavigationBarViewDelegate?
    private var selectedIndex: Int = 0 {
        didSet {
            buttonsStackView.subviews.forEach {
                if $0.tag == oldValue {
                    $0.backgroundColor = .clear
                }
                if $0.tag == selectedIndex {
                    $0.backgroundColor = .grayWith50Alpha
                }
            }
        }
    }
    private lazy var buttonsStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution  = .fillEqually
        buttonStackView.alignment = UIStackView.Alignment.leading
        return buttonStackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    @objc
    func didChangeSelected(_ sender: UIButton) {
        self.selectedIndex = sender.tag
        delegate?.didSelect(index: sender.tag)
    }
}
// MARK: - Private functions
extension WeaponNavigationBarView {
    private func setupSubviews() {
        addView(buttonsStackView)
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            buttonsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        fillStackView()
    }
    private func fillStackView() {
        R.Strings.WeaponController.stringsArray.enumerated().forEach { (index, name) in
            let button = createButton(buttonTitle: name, tag: index)
            buttonsStackView.addArrangedSubview(button)
        }
    }
    private func createButton(buttonTitle: String, tag: Int) -> UIButton {
        let inventoryButton = UIButton(type: .system)
        inventoryButton.setTitle(buttonTitle, for: .normal)
        inventoryButton.setTitleColor(.textPrimary, for: .normal)
        inventoryButton.tag = tag
        inventoryButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        return inventoryButton
    }
}
