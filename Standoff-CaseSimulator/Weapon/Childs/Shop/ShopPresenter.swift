//
//  ShopPresenter.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

protocol ShopPresenterProtocol: AnyObject {
}

class ShopPresenter {
    weak var view: ShopViewProtocol?
    var router: ShopRouterProtocol
    var interactor: ShopInteractorProtocol

    init(interactor: ShopInteractorProtocol, router: ShopRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ShopPresenter: ShopPresenterProtocol {
}
