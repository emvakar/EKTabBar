//
//  UIView+Extension.swift
//  EKTabBarController
//
//  Created by Emil Karimov on 29.10.2022.
//  Copyright © 2022 Emil Karimov. All rights reserved.
//

import UIKit

extension UIView {

    struct Constants {
        static let ExternalBorderName = "externalBorder"
    }

    func addExternalBorder(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> CALayer {
        let externalBorder = CALayer()
        externalBorder.frame = CGRectMake(-borderWidth, -borderWidth, frame.size.width + 2 * borderWidth, frame.size.height + 2 * borderWidth)
        externalBorder.borderColor = borderColor.cgColor
        externalBorder.borderWidth = borderWidth
        externalBorder.name = Constants.ExternalBorderName

        layer.insertSublayer(externalBorder, at: 0)
        layer.masksToBounds = false

        return externalBorder
    }

    func removeExternalBorders() {
        layer.sublayers?.filter() { $0.name == Constants.ExternalBorderName }.forEach() {
            $0.removeFromSuperlayer()
        }
    }

    func removeExternalBorder(externalBorder: CALayer) {
        guard externalBorder.name == Constants.ExternalBorderName else { return }
        externalBorder.removeFromSuperlayer()
    }

}
