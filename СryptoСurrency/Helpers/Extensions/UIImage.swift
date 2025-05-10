//
//  UIImage.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import UIKit

extension UIImage {
    static var randomCurrencyIcon: UIImage {
        let images: [UIImage] = [.achain, .bitcoin, .neo]
        
        return images.randomElement() ?? UIImage(resource: .achain)
    }
}
