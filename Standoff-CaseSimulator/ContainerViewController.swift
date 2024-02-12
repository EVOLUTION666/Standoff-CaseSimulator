import UIKit

class ContainerViewController: UIViewController {
    
    // MARK: - Private
    
    private var viewControllers: [UIViewController] = []
    private(set) var selectedIndex: Int! {
        didSet {
            if oldValue != nil {
                viewControllers[oldValue].remove()
            }
            self.updateViewController()
        }
    }
    private(set) var contentStackView: UIStackView = {
        let stack = UIStackView().forAutoLayout()
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    func setViewControllers(_ viewControllers: [UIViewController], selectedViewController: Int = 0) {
        self.viewControllers = viewControllers
        if selectedViewController < viewControllers.count {
            self.selectedIndex = selectedViewController
        }
    }
    
    func changeSelectedViewController(at index: Int) {
        if index < viewControllers.count {
            self.selectedIndex = index
        }
    }
    
    func add(_ child: UIViewController) {
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: contentStackView.bottomAnchor),
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        child.didMove(toParent: self)
    }
}

private extension ContainerViewController {
    private func updateViewController() {
        self.add(self.viewControllers[selectedIndex])
    }
}

extension NSLayoutConstraint {
    @discardableResult
    func activated() -> NSLayoutConstraint {
        self.isActive = true
        return self
    }
}
