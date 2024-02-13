//
//  AchivmentCell.swift
//  Standoff-CaseSimulator
//
//  Created by Александр Горелкин on 13.02.2024.
//

import UIKit
final class AchivmentCell: UICollectionViewCell {
    static let identifier = String(describing: AchivmentCell.self)
    private lazy var achivmentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.autoresizingMask = .flexibleHeight
        return imageView
    }()
    private lazy var achivmentLabel = CustomLabel(text: "Achivment Text", font: .boldSystemFont(ofSize: 11), textColor: .white, textAlignment: .center)
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear.withAlphaComponent(0.2)
        achivmentLabel.backgroundColor = .clear
        setupSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubviews() {
        addView(achivmentImageView)
        addView(achivmentLabel)
        NSLayoutConstraint.activate([
            achivmentImageView.topAnchor.constraint(equalTo: topAnchor),
            achivmentImageView.leftAnchor.constraint(equalTo: leftAnchor),
            achivmentImageView.rightAnchor.constraint(equalTo: rightAnchor),
            
            achivmentLabel.topAnchor.constraint(equalTo: achivmentImageView.bottomAnchor, constant: 3),
            achivmentLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 15),
            achivmentLabel.leftAnchor.constraint(equalTo: leftAnchor),
            achivmentLabel.rightAnchor.constraint(equalTo: rightAnchor),
            achivmentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
    func setupCell(achivmentModel: AchivmentModel) {
        achivmentLabel.text = achivmentModel.title
        achivmentImageView.image = UIImage(named: "\(achivmentModel.image)")
    }
}
