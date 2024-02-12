//
//  SideBarInteractor.swift
//  Nefedov Andrey
//
//  Created by Andrey on 11.02.2024
//

protocol SideBarInteractorProtocol: AnyObject {
}

class SideBarInteractor: SideBarInteractorProtocol {
    weak var presenter: SideBarPresenterProtocol?
}
