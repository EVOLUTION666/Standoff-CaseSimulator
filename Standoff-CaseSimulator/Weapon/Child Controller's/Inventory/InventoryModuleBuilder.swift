//
//  InventoryModuleBuilder.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

class InventoryModuleBuilder {
    static func build() -> InventoryViewController {
        let interactor = InventoryInteractor()
        let router = InventoryRouter()
        let presenter = InventoryPresenter(interactor: interactor, router: router)
        let viewController = InventoryViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
