//
//  ProfileViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
}

class ProfileViewController: UIViewController {
    // MARK: - Public
    var presenter: ProfilePresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension ProfileViewController {
    func initialize() {
        view.backgroundColor = .red
    }
}

// MARK: - ProfileViewProtocol
extension ProfileViewController: ProfileViewProtocol {
}
