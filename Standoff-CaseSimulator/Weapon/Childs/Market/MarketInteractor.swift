//
//  MarketInteractor.swift
//  Nefedov Andrey
//
//  Created by Andrey on 15.02.2024
//

protocol MarketInteractorProtocol: AnyObject {
}

class MarketInteractor: MarketInteractorProtocol {
    weak var presenter: MarketPresenterProtocol?
}
