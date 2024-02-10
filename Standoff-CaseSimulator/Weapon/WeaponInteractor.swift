//
//  WeaponInteractor.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

protocol WeaponInteractorProtocol: AnyObject {
}

class WeaponInteractor: WeaponInteractorProtocol {
    weak var presenter: WeaponPresenterProtocol?
}
