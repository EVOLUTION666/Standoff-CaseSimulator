import UIKit

protocol SideTabBarDelegate: AnyObject {
    func didSelect(index: Int)
}

class SideTabBar: UIView {
    
    // MARK: - Public
    
    enum SideTabBarAxis {
        case horizontal, vertical
    }
    
    var axis: SideTabBarAxis = .vertical {
        didSet {
            self.updateAxis()
        }
    }
    
    weak var sideTabBarDelegate: SideTabBarDelegate?
    
    // MARK: - Private
    
    private(set) var selectedItem = 0
    private var items = [SideTabBarItem.DisplayItem]()
    
    private lazy var sideBarStackView: UIStackView = {
        let sideBarStackView = UIStackView()
        sideBarStackView.axis = .vertical
        sideBarStackView.distribution = .fillEqually
        sideBarStackView.alignment = .fill
        return sideBarStackView.forAutoLayout()
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public extension

extension SideTabBar {
    func setItems(_ items: [SideTabBarItem.DisplayItem]) {
        self.items.removeAll()
        self.sideBarStackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        self.selectedItem = 0
        self.items = items
        items.enumerated().forEach({
            let item = SideTabBarItem()
            item.addTarget(self, action: #selector(didSelect), for: .touchUpInside)
            item.setDisplayItem($0.element)
            item.tag = $0.offset
            if $0.offset == self.selectedItem {
                item.isSelected = true
            }
            sideBarStackView.insertArrangedSubview(item, at: $0.offset)
            item.widthAnchor.constraint(equalTo: sideBarStackView.widthAnchor).isActive = true
        })
    }
}

// MARK: - Private extension

private extension SideTabBar {
    
    func initialize() {
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        addSubview(sideBarStackView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            sideBarStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sideBarStackView.topAnchor.constraint(equalTo: self.topAnchor),
            sideBarStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            sideBarStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func updateAxis() {
        sideBarStackView.axis = self.axis == .vertical ? .vertical : .horizontal
        self.layoutIfNeeded()
    }
}

// MARK: - @objc extension

private extension SideTabBar {
    @objc
    func didSelect(_ sender: SideTabBarItem ) {
        self.selectedItem = sender.tag
        self.sideBarStackView.arrangedSubviews.forEach({ ($0 as? SideTabBarItem)?.isSelected = false })
        sender.isSelected.toggle()
        self.sideTabBarDelegate?.didSelect(index: sender.tag)
    }
}
