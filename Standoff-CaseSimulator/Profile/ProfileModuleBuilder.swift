//
//  ProfileModuleBuilder.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

class ProfileModuleBuilder {
    static func build() -> ProfileViewController {
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let presenter = ProfilePresenter(interactor: interactor, router: router)
        let viewController = ProfileViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
