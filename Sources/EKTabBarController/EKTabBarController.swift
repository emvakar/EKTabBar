//
//  EKTabBarController.swift
//  EKTabBarController
//
//  Created by Emil Karimov on 14.07.2022.
//  Copyright © 2022 Emil Karimov. All rights reserved.
//

import UIKit

public final class EKTabBarController: UITabBarController {

    private lazy var floatingTabbarView: EKFloatingBarView = makeFloatingBarView()

    private let controllerItems: [EKControllerItem]
    private let insets: UIEdgeInsets
    private let cornerRadius: CGFloat
    private let backColor: UIColor
    private let bottomSpace: CGFloat
    private let borderWidth: CGFloat
    private let borderColor: UIColor
    
    /// Initialize TabBar controller
    /// - Parameters:
    ///   - controllerItems: Your tab and view controller items
    ///   - cornerRadius: Your cornerRadius for floating tabbar
    ///   - backgroundColor: Background Color for floating tabbar
    ///   - insets: insets for position
    ///   - bottomSpace: space to bottom
    public init(controllerItems: [EKControllerItem],
                cornerRadius: CGFloat,
                backgroundColor: UIColor,
                insets: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16),
                bottomSpace: CGFloat = 50,
                borderWidth: CGFloat = 0,
                borderColor: UIColor = .clear) {
        
        self.controllerItems = controllerItems
        self.insets = UIEdgeInsets(top: insets.top - borderWidth,
                                   left: insets.left - borderWidth,
                                   bottom: insets.bottom - borderWidth,
                                   right: insets.right - borderWidth)
        self.cornerRadius = cornerRadius
        self.backColor = backgroundColor
        self.bottomSpace = abs(bottomSpace)

        self.borderColor = borderColor
        self.borderWidth = borderWidth
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = controllerItems.map { $0.viewController }
        tabBar.isHidden = true
        setupFloatingTabBar()
    }

    // MARK: - Public
    
    public func visibility(isHidden: Bool) {
        floatingTabbarView.visibility(isHidden: isHidden)
    }

}

extension EKTabBarController: EKFloatingBarViewDelegate {

    func did(selectindex: Int) {

        if selectedIndex == selectindex, selectindex < viewControllers?.count ?? 0, let navigationViewController = viewControllers?[selectindex] as? UINavigationController {
            navigationViewController.popToRootViewController(animated: true)
        }

        selectedIndex = selectindex

    }

}

// MARK: - Private

private extension EKTabBarController {
    
    func setupFloatingTabBar() {
        floatingTabbarView.delegate = self
        view.addSubview(floatingTabbarView)
        floatingTabbarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(insets)
            make.bottom.equalTo(-bottomSpace)
        }
    }

    func makeFloatingBarView() -> EKFloatingBarView {
        let items = controllerItems.compactMap({ $0.tabBarButtonItem })
        return EKFloatingBarView(items, cornerRadius: cornerRadius, backgroundColor: backColor, borderWidth: borderWidth, borderColor: borderColor)
    }
    
    func createNavViewController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {

        viewController.navigationItem.title = title

        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)

        return navController
    }

}
