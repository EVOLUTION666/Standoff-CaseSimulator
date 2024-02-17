//
//  MarketModuleBuilder.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

import UIKit

class MarketModuleBuilder {
    static func build() -> MarketViewController {
        let interactor = MarketInteractor()
        let router = MarketRouter()
        let presenter = MarketPresenter(interactor: interactor, router: router)
        let viewController = MarketViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
