//
//  GameViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

protocol GameViewProtocol: AnyObject {
}

class GameViewController: UIViewController {
    // MARK: - Public
    var presenter: GamePresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension GameViewController {
    func initialize() {
    }
}

// MARK: - GameViewProtocol
extension GameViewController: GameViewProtocol {
}
