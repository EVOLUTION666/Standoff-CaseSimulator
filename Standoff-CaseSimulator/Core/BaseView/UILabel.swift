//
//  UILabel.swift
//  Standoff-CaseSimulator
//
//  Created by Александр Горелкин on 13.02.2024.
//

import UIKit
final class CustomLabel: UILabel {
    init(text: String,
         font: UIFont = .systemFont(ofSize: 11, weight: .medium),
         textColor: UIColor = .white,
         textAlignment: NSTextAlignment = .left,
         numberOfLines: Int = 1
    ) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
