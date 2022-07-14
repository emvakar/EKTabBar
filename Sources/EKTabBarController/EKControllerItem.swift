//
//  EKControllerItem.swift
//  EKTabBarController
//
//  Created by Emil Karimov on 14.07.2022.
//  Copyright © 2022 Emil Karimov. All rights reserved.
//

import UIKit

public struct EKControllerItem {
    
    let tabBarButtonItem: UITabBarItem
    let viewController: UIViewController
    
    public init(tabBarButtonItem: UITabBarItem, viewController: UIViewController) {
        self.tabBarButtonItem = tabBarButtonItem
        self.viewController = viewController
    }

}
