//
//  ShopModuleBuilder.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

class ShopModuleBuilder {
    static func build() -> ShopViewController {
        let interactor = ShopInteractor()
        let router = ShopRouter()
        let presenter = ShopPresenter(interactor: interactor, router: router)
        let viewController = ShopViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
