//
//  CircleButton.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import UIKit

///Нету final потому-что есть наследник MenuButton
class CircleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .ypWhite.withAlphaComponent(0.8)
        layer.cornerRadius = 24
        layer.masksToBounds = true
        
        tintColor = .ypBlackEclipse
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 48),
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
