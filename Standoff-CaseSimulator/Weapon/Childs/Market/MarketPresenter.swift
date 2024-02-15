//
//  MarketPresenter.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

protocol MarketPresenterProtocol: AnyObject {
}

class MarketPresenter {
    weak var view: MarketViewProtocol?
    var router: MarketRouterProtocol
    var interactor: MarketInteractorProtocol

    init(interactor: MarketInteractorProtocol, router: MarketRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MarketPresenter: MarketPresenterProtocol {
}
