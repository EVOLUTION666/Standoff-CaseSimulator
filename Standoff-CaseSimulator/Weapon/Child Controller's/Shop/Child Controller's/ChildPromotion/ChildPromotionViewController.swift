//
//  ChildPromotionViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 18.02.2024
//

import UIKit

protocol ChildPromotionViewProtocol: AnyObject {
}

class ChildPromotionViewController: UIViewController {
    
    // MARK: - Public

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension ChildPromotionViewController {
    func initialize() {
        view.backgroundColor = .accentOrange
    }
}

// MARK: - ChildPromotionViewProtocol
extension ChildPromotionViewController: ChildPromotionViewProtocol {
}
