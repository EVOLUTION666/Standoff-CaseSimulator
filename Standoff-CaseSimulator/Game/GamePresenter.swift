//
//  GamePresenter.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

protocol GamePresenterProtocol: AnyObject {
}

class GamePresenter {
    weak var view: GameViewProtocol?
    var router: GameRouterProtocol
    var interactor: GameInteractorProtocol

    init(interactor: GameInteractorProtocol, router: GameRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension GamePresenter: GamePresenterProtocol {
}
