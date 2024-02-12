//
//  SideBarPresenter.swift
//  Nefedov Andrey
//
//  Created by Andrey on 11.02.2024
//

protocol SideBarPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class SideBarPresenter {
    weak var view: SideBarViewProtocol?
    var router: SideBarRouterProtocol
    var interactor: SideBarInteractorProtocol

    init(interactor: SideBarInteractorProtocol, router: SideBarRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension SideBarPresenter: SideBarPresenterProtocol {
    func viewDidLoaded() {
        
    }
}
