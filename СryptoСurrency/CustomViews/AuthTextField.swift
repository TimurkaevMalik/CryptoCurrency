//
//  AuthTextField.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

final class AuthTextField: UITextField {
    
    enum FieldType {
        case login
        case password
    }
    
    private let type: FieldType
    private let iconView = UIImageView()
    private let iconContainer = UIView()
    private let textPadding = UIEdgeInsets(top: 0,
                                           left: 62,
                                           bottom: 0,
                                           right: 20)
    
    init(type: FieldType) {
        self.type = type
        super.init(frame: .zero)
        configure()
        setupIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        heightAnchor.constraint(equalToConstant: 55).isActive = true
        layer.cornerRadius = 25
        layer.masksToBounds = true
        backgroundColor = .ypWhite
        textColor = .ypBlack
        
        let placeholder: String
        
        switch type {
        case .login:
            placeholder = "Username"
            iconView.image = .userIcon
            tintColor = .ypOrangeSoft
            
        case .password:
            placeholder = "Password"
            isSecureTextEntry = true
            iconView.image = .lock
            tintColor = .ypPurpleSoft
        }
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.ypGray])
    }
    
    private func setupIcon() {
        iconView.contentMode = .scaleAspectFit
        leftView = iconView
        leftViewMode = .always
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 10
        return rect
    }
}
