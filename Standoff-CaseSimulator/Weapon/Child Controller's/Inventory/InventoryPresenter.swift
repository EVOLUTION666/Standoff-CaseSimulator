//
//  InventoryPresenter.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

protocol InventoryPresenterProtocol: AnyObject {
}

class InventoryPresenter {
    weak var view: InventoryViewProtocol?
    var router: InventoryRouterProtocol
    var interactor: InventoryInteractorProtocol

    init(interactor: InventoryInteractorProtocol, router: InventoryRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension InventoryPresenter: InventoryPresenterProtocol {
}
