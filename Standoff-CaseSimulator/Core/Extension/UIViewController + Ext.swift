//
//  UIViewController + Ext.swift
//  Standoff-CaseSimulator
//
//  Created by Andrey on 11.02.2024.
//

import UIKit

extension UIViewController {
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
