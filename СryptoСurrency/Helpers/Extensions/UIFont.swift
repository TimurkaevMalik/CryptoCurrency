//
//  UIFont.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

extension UIFont {
    static var textField: UIFont {
        UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    
    static var loginButton: UIFont {
        UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    static var title: UIFont {
        UIFont.systemFont(ofSize: 32, weight: .semibold)
    }
}
