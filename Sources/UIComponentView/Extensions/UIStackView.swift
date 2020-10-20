//
//  UIStackView.swift
//  
//
//  Created by gwonii on 2020/10/18.
//

import UIKit

extension UIStackView {
    static func make(
        arrangedSubviews: [UIView] = [],
        axis: NSLayoutConstraint.Axis = .horizontal,
        alignment: Alignment = .fill,
        spacing: CGFloat = .zero,
        distribution: Distribution = .fill) -> UIStackView
    {
        let stackView: UIStackView = .init(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.spacing = spacing
        stackView.distribution = distribution
        return stackView
    }
}
