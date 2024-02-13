//
//  NameProfileView.swift
//  Standoff-CaseSimulator
//
//  Created by Александр Горелкин on 13.02.2024.
//

import UIKit
final class NameProfileView: UIView {
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var idAndNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
    }()
    init(id: String, name: String, imageName: String = "q") {
        super.init(frame: .zero)
        backgroundColor = .gray
        profileImageView.image = UIImage(named: imageName)
        fillStackView(with: id, and: name)
        setupSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func fillStackView(with id: String,and name: String) {
        idAndNameStackView.addArrangedSubview(CustomLabel(text: id))
        idAndNameStackView.addArrangedSubview(CustomLabel(text: name))
    }
    private func setupSubviews() {
        addView(profileImageView)
        addView(idAndNameStackView)
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            
            idAndNameStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            idAndNameStackView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 20),
            idAndNameStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
}
