//
//  SideBarModuleBuilder.swift
//  Nefedov Andrey
//
//  Created by Andrey on 11.02.2024
//

import UIKit

class SideBarModuleBuilder {
    static func build() -> SideBarViewController {
        let interactor = SideBarInteractor()
        let router = SideBarRouter()
        let presenter = SideBarPresenter(interactor: interactor, router: router)
        let viewController = SideBarViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
