//
//  UIView + Ext.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 11.02.2024.
//

import UIKit

extension UIView {
    func forAutoLayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        var constraints = [NSLayoutConstraint]()
        
        if let width = width {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width))
        }
        
        if let height = height {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setSize(size: CGSize) {
        self.setSize(width: size.width, height: size.height)
    }
    
    func setSimpleConstraints(constant: CGFloat = 0) {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant)
        ])
    }
    
    func setConstraintsForNavBar() {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        ])
    }
}

