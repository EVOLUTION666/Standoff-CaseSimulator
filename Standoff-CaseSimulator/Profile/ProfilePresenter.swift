//
//  ProfilePresenter.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

protocol ProfilePresenterProtocol: AnyObject {
}

class ProfilePresenter {
    weak var view: ProfileViewProtocol?
    var router: ProfileRouterProtocol
    var interactor: ProfileInteractorProtocol

    init(interactor: ProfileInteractorProtocol, router: ProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
}
