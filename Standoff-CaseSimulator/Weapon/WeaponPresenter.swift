//
//  WeaponPresenter.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

protocol WeaponPresenterProtocol: AnyObject {
}

class WeaponPresenter {
    weak var view: WeaponViewProtocol?
    var router: WeaponRouterProtocol
    var interactor: WeaponInteractorProtocol

    init(interactor: WeaponInteractorProtocol, router: WeaponRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension WeaponPresenter: WeaponPresenterProtocol {
}
