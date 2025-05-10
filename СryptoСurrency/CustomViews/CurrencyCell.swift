//
//  CurrencyCell.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import UIKit

final class CurrencyCell: UITableViewCell {
    
    static let identifier = "CurrencyCell"
    private let formatter = NumFormatter.shared
    
    private let iconImageView = UIImageView()
    private let percentImageView = UIImageView()
    private let nameLabel = UILabel()
    private let symbolLabel = UILabel()
    private let priceLabel = UILabel()
    private let percentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureWith(_ data: CryptoData) {
        
        nameLabel.text = data.name
        symbolLabel.text = data.symbol
        iconImageView.image = .randomCurrencyIcon
        
        let percent = data.marketData.percentChangeUSDLast24Hours
        let percentString = formatter.percent(abs(percent))
        let currencyString = formatter.currency(data.marketData.priceUSD, symbol: "$")
        
        percentLabel.text = percentString
        priceLabel.text = currencyString
        percentImageView.image = percent.isLess(than: 0) ? .chevronDown : .chevronUp
    }
    
    private func setupUI() {
        backgroundColor = .clear
        setAutoresizingMask()
        setupIconImageView()
        setupNameLabel()
        setupSymbolLabel()
        setupPriceLabel()
        setupPercentLabel()
        setupPercentImageView()
    }

    private func setAutoresizingMask() {
        percentImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupIconImageView() {
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupPercentImageView() {
        addSubview(percentImageView)
        
        NSLayoutConstraint.activate([
            percentImageView.heightAnchor.constraint(equalToConstant: 12),
            percentImageView.widthAnchor.constraint(equalToConstant: 12),
            percentImageView.centerYAnchor.constraint(equalTo: percentLabel.centerYAnchor),
            percentImageView.trailingAnchor.constraint(equalTo: percentLabel.leadingAnchor, constant: -5)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.font = .currencyName
        nameLabel.textColor = .ypBlack
        
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 27),
            nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 19)
        ])
    }
    
    private func setupSymbolLabel() {
        symbolLabel.font = .currencySymbol
        symbolLabel.textColor = .ypGray
        
        addSubview(symbolLabel)
        
        NSLayoutConstraint.activate([
            symbolLabel.heightAnchor.constraint(equalToConstant: 21),
            symbolLabel.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            symbolLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 19)
        ])
    }
    
    private func setupPriceLabel() {
        priceLabel.font = .currencyName
        priceLabel.textColor = .ypBlack
        
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 27),
            priceLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupPercentLabel() {
        percentLabel.font = .currencySymbol
        percentLabel.textColor = .ypGray
        
        addSubview(percentLabel)

        NSLayoutConstraint.activate([
            percentLabel.heightAnchor.constraint(equalToConstant: 21),
            percentLabel.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
