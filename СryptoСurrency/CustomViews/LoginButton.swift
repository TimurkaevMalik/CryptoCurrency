//
//  LoginButton.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

final class LoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .ypBlackEclipse
        
        setTitleColor(.ypWhite, for: .normal)
        setTitle("Login", for: .normal)
        titleLabel?.font = .loginButton
        
        layer.cornerRadius = 40
        layer.masksToBounds = true
        
        heightAnchor.constraint(equalToConstant: .loginButtonHeight).isActive = true
    }
}
