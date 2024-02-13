//
//  ProfileViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 10.02.2024
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    func setupCollectionView(with achivmentArray: [AchivmentModel])
}

class ProfileViewController: UIViewController {
    // MARK: - Public
    var presenter: ProfilePresenterProtocol?
    
    private lazy var nameView = NameProfileView(id: "Loop io", name: "Name")
    private lazy var achivmentCollection = AchievementsView()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        achivmentCollection.setupWithData(array: [
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello"),
            .init(image: "q", title: "Hello")
        ])
        initialize()
    }
}

// MARK: - Private functions
private extension ProfileViewController {
    func initialize() {
        view.backgroundColor = .red
        view.addView(nameView)
        view.addView(achivmentCollection)
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            nameView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            nameView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.318),
            nameView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.417),
            
            achivmentCollection.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 10),
            achivmentCollection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            achivmentCollection.rightAnchor.constraint(equalTo: nameView.rightAnchor),
            achivmentCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        
        
        ])
    }
}

// MARK: - ProfileViewProtocol
extension ProfileViewController: ProfileViewProtocol {
    func setupCollectionView(with achivmentArray: [AchivmentModel]) {
        achivmentCollection.setupWithData(array: achivmentArray)
    }
}
