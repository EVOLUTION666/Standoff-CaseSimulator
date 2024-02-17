//
//  ShopInteractor.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

protocol ShopInteractorProtocol: AnyObject {
}

class ShopInteractor: ShopInteractorProtocol {
    weak var presenter: ShopPresenterProtocol?
}
