//
//  CustomTabBar.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class CustomTabBar: UITabBar {
    
    private let tabBarHeight: CGFloat = 82
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = tabBarHeight
        return sizeThatFits
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        centerIcon()
    }
    
    private func centerIcon() {
        let buttonHeight: CGFloat = 48
        let yOffset = (tabBarHeight - buttonHeight) / 2
        
        for subview in subviews {
            if NSStringFromClass(type(of: subview)) == "UITabBarButton" {
                
                subview.frame = CGRect(
                    x: subview.frame.origin.x,
                    y: yOffset,
                    width: subview.frame.width,
                    height: buttonHeight
                )
                
                if let imageView = subview.subviews.compactMap({ $0 as? UIImageView }).first {
                    
                    let totalHeight = imageView.frame.height
                    
                    let imageYOffset = (buttonHeight - totalHeight) / 2
                    
                    imageView.frame.origin.y = imageYOffset
                }
            }
        }
    }
}
