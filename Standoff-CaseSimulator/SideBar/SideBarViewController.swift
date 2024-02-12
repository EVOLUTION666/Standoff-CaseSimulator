//
//  SideBarViewController.swift
//  Nefedov Andrey
//
//  Created by Andrey on 11.02.2024
//

import UIKit

protocol SideBarViewProtocol: AnyObject {
    
}

class SideBarViewController: UIViewController, SideTabBarDelegate {
    
    // MARK: - Public
    var presenter: SideBarPresenterProtocol?
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return [.bottom]
    }
    
    // MARK: - Private
    
    private lazy var sideTabBar: SideTabBar = {
        let tabBar = SideTabBar()
        tabBar.backgroundColor = .blackWith70Alpha
        return tabBar.forAutoLayout()
    }()
    private lazy var gradient: CAGradientLayer = .baseGradientLayer
    private var viewControllers: [UIViewController] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(gradient)
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNeedsUpdateOfHomeIndicatorAutoHidden()
        setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradient.frame = view.bounds
    }

}

// MARK: - Public extension

extension SideBarViewController {
    func didSelect(index: Int) {
        viewControllers.forEach({ $0.remove() })
        add(viewControllers[index])
    }
}

// MARK: - Private extension

private extension SideBarViewController {
    func initialize() {
        presenter?.viewDidLoaded()
        configureSubviews()
        configureConstraints()
        configureViewControllers()
        configureSideBar()
    }
    
    func configureViewControllers() {
        let profileVC = ProfileModuleBuilder.build()
        let weaponVC = WeaponModuleBuilder.build()
        let gameVC = GameModuleBuilder.build()
        
        self.viewControllers = [profileVC, weaponVC, gameVC]
        self.add(profileVC)
    }
    
    func configureSideBar() {
        sideTabBar.setItems([.init(title: nil, image: .init(named: "profile")!),
                             .init(title: nil, image: .init(named: "weapon")!),
                             .init(title: nil, image: .init(named: "game")!)])
        self.sideTabBar.sideTabBarDelegate = self
        self.sideTabBar.backgroundColor = .clear
    }
    
    func configureSubviews() {
        view.addSubview(sideTabBar)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            sideTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sideTabBar.topAnchor.constraint(equalTo: view.topAnchor),
            sideTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideTabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
        ])
    }
    
    
    func add(_ child: UIViewController) {
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: sideTabBar.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        child.didMove(toParent: self)
    }
}

// MARK: - SideBarViewProtocol
extension SideBarViewController: SideBarViewProtocol {
}

