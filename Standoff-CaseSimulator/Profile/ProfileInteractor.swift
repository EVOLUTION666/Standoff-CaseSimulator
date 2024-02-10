//
//  ProfileInteractor.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

protocol ProfileInteractorProtocol: AnyObject {
}

class ProfileInteractor: ProfileInteractorProtocol {
    weak var presenter: ProfilePresenterProtocol?
}
