//
//  StatisticView.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import UIKit

final class StatisticView: UIView {
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    init(title: String, value: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        valueLabel.text = value
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        valueLabel.textColor = .ypBlackEclipse
        valueLabel.font = .learnMoreButton
        
        titleLabel.font = .currencySymbol
        titleLabel.textColor = .ypGray
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
}
