//
//  UILabel.swift
//  
//
//  Created by gwonii on 2020/10/18.
//

import UIKit

extension UILabel {
    static func makeTitleLabel(text: String?) -> UILabel {
        self.make(text: text, font: .systemFont(ofSize: 20, weight: .light), textColor: .blackPrimary, textAlignment: .center)
    }
    
    static func make(text: String?, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment = .left) -> UILabel {
        let label: UILabel = .init(frame: .zero)
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        return label
    }
}
