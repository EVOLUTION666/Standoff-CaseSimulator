//
//  WeaponModuleBuilder.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

class WeaponModuleBuilder {
    static func build() -> WeaponViewController {
        let interactor = WeaponInteractor()
        let router = WeaponRouter()
        let presenter = WeaponPresenter(interactor: interactor, router: router)
        let viewController = WeaponViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
