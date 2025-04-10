//
//  LoginButton.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

final class LoginButton: UIButton {
    
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
        super.init(frame: .zero)
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
        
        layer.cornerRadius = .loginButtonRadius
        layer.masksToBounds = true
        
        heightAnchor.constraint(equalToConstant: .loginButtonHeight).isActive = true
        
        addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.action()
            },
            for: .touchUpInside)
    }
}
