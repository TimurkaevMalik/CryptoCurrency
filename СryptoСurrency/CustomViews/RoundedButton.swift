//
//  LearnMoreButton.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import UIKit

final class RoundedButton: UIButton {
    
    private let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.baseBackgroundColor = .ypWhiteCloud
        config.baseForegroundColor = .ypBlack
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 23,
            bottom: 0,
            trailing: 23
        )

        layer.cornerRadius = 16
        layer.masksToBounds = true
        configuration = config
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
