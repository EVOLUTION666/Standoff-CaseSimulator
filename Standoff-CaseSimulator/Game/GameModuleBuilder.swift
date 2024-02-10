//
//  GameModuleBuilder.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

class GameModuleBuilder {
    static func build() -> GameViewController {
        let interactor = GameInteractor()
        let router = GameRouter()
        let presenter = GamePresenter(interactor: interactor, router: router)
        let viewController = GameViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
