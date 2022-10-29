//
//  EKFloatingBarView.swift
//  EKTabBarController
//
//  Created by Emil Karimov on 14.07.2022.
//  Copyright © 2022 Emil Karimov. All rights reserved.
//

import UIKit
import SnapKit

protocol EKFloatingBarViewDelegate: AnyObject {
    
    func did(selectindex: Int)
    
}

class EKFloatingBarView: UIView {

    weak var delegate: EKFloatingBarViewDelegate?
    
    private let cornerRadius: CGFloat
    private let borderWidth: CGFloat
    private let borderColor: UIColor

    private var buttons: [UIButton] = []

    init(_ items: [UITabBarItem], cornerRadius: CGFloat = 20, backgroundColor: UIColor = .white, borderWidth: CGFloat,
         borderColor: UIColor) {
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        setupStackView(items)
        updateUI(selectedIndex: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth

    }

    func setupStackView(_ items: [UITabBarItem]) {

        let stackView = UIStackView()
        var spacers = [UIView]()

        for (index, item) in items.enumerated() {
            guard let normalImage = item.image, let selectedImage = item.selectedImage else { continue }
            let button = createButton(normalImage: normalImage, selectedImage: selectedImage, index: index)
            buttons.append(button)
            stackView.addArrangedSubview(button)
            if index < (items.count - 1) {
                let spacer = UIView()
                spacers.append(spacer)
                stackView.addArrangedSubview(spacer)
            }

        }

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            guard let spacer1 = spacers.first else { return }
            let spacerWidth = spacer1.bounds.width / CGFloat(spacers.count)
            spacers.forEach { spacer in
                spacer.snp.makeConstraints { make in
                    make.width.greaterThanOrEqualTo(1)
                    make.width.lessThanOrEqualTo(spacerWidth)
                }
            }
        }

    }

    func createButton(normalImage: UIImage, selectedImage: UIImage, index: Int) -> UIButton {
        let button = UIButton()
        button.snp.makeConstraints { make in
            make.width.equalTo(78)
            make.height.equalTo(60)
        }
        button.setImage(normalImage, for: .normal)
        button.setImage(selectedImage, for: .selected)
        button.tag = index
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(changeTab(_:)), for: .touchUpInside)
        return button
    }

    @objc
    func changeTab(_ sender: UIButton) {
        sender.pulsar()
        delegate?.did(selectindex: sender.tag)
        updateUI(selectedIndex: sender.tag)
    }

    func updateUI(selectedIndex: Int) {
        for (index, button) in buttons.enumerated() {
            if index == selectedIndex {
                button.isSelected = true
                if index == 0 {
                    button.tintColor = .red
                } else {
                    button.tintColor = .black
                }
            } else {
                button.isSelected = false
                button.tintColor = .gray
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func visibility(isHidden: Bool) {
        if !isHidden {
            self.isHidden = isHidden
        }

        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.alpha = isHidden ? 0 : 1
            self.transform = isHidden ? CGAffineTransform(translationX: 0, y: 10) : .identity
        }) { (_) in
            if isHidden {
                self.isHidden = isHidden
            }
        }
    }
}

extension UIButton {

    func pulsar() {
        let pulsar = CASpringAnimation(keyPath: "transform.scale")
        pulsar.duration = 0.15
        pulsar.fromValue = 0.95
        pulsar.toValue = 1.0
        layer.add(pulsar, forKey: "pulsar")
    }
}
