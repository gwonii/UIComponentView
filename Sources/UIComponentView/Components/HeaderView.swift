//
//  HeaderView.swift
//  
//
//  Created by gwonii on 2020/10/18.
//

import UIKit
import SnapKit

open class HeaderView: UIView {
    static let height: CGFloat = 48
    static let buttonSpacing: CGFloat = 8
    
    let titleLabel: UILabel
    let titleStackView: UIStackView = .make(arrangedSubviews: [], axis: .horizontal, alignment: .center, spacing: 2, distribution: .equalSpacing)
    let leadingStack: UIStackView = .init(arrangedSubviews: [])
    let trailingStack: UIStackView = .init(arrangedSubviews: [])
    let leadingButtons: [UIButton]
    let trailingButtons: [UIButton]
    
    public init(titleLabel: UILabel, leadingButtons: [UIButton] = [], trailingButtons: [UIButton] = []) {
        self.titleLabel = titleLabel
        self.leadingButtons = leadingButtons
        self.trailingButtons = trailingButtons
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.initSubviews()
        self.initConstraints()
    }
    
    public convenience init(title: String = "", leadingButtons: [UIButton] = [], trailingButtons: [UIButton] = []) {
        let titleLabel: UILabel = .makeTitleLabel(text: title)
        self.init(titleLabel: titleLabel, leadingButtons: leadingButtons, trailingButtons: trailingButtons)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        self.titleStackView.addArrangedSubview(self.titleLabel)
        self.addSubview(self.titleStackView)
        
        self.leadingButtons.forEach { (button) in
            button.snp.removeConstraints()
            button.snp.makeConstraints { (maker) in
                maker.size.equalTo(40)
            }
            self.leadingStack.addArrangedSubview(button)
        }

        self.trailingButtons.forEach { (button) in
            button.snp.removeConstraints()
            button.snp.makeConstraints { (maker) in
                maker.size.equalTo(40)
            }
            self.trailingStack.addArrangedSubview(button)
        }

        self.leadingStack.axis = .horizontal
        self.leadingStack.spacing = Self.buttonSpacing
        self.leadingStack.distribution = .equalSpacing
        self.addSubview(self.leadingStack)

        self.trailingStack.axis = .horizontal
        self.trailingStack.spacing = Self.buttonSpacing
        self.trailingStack.distribution = .equalSpacing
        self.addSubview(self.trailingStack)
    }
    
    private func initConstraints() {
        self.snp.makeConstraints { (maker) in
            maker.height.equalTo(HeaderView.height)
        }

        self.titleStackView.snp.makeConstraints { (maker) in
            maker.leading.greaterThanOrEqualTo(self.leadingStack.snp.trailing)
            maker.trailing.lessThanOrEqualTo(self.trailingStack.snp.leading)
            maker.center.equalToSuperview()
        }

        self.leadingStack.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().offset(8)
            maker.centerY.equalToSuperview()
        }

        self.trailingStack.snp.makeConstraints { (maker) in
            maker.trailing.equalToSuperview().offset(-8)
            maker.centerY.equalToSuperview()
        }
    }
}
