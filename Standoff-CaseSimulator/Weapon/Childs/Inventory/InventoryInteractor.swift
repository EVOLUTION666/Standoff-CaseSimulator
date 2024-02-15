//
//  InventoryInteractor.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

protocol InventoryInteractorProtocol: AnyObject {
}

class InventoryInteractor: InventoryInteractorProtocol {
    weak var presenter: InventoryPresenterProtocol?
}
