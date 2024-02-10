//
//  GameInteractor.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

protocol GameInteractorProtocol: AnyObject {
}

class GameInteractor: GameInteractorProtocol {
    weak var presenter: GamePresenterProtocol?
}
