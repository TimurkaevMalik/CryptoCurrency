//
//  CurrencyCell.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import UIKit

final class CurrencyCell: UITableViewCell {
    static let identifier = "CurrencyCell"
    private let formatter = CustomNumberFormatter.shared
    
    private let iconImageView = UIImageView()
    private let nameLabel = UILabel()
    private let symbolLabel = UILabel()
    private let priceLabel = UILabel()
    private let percentChangeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureWith(_ data: CryptoData,
                               image: UIImage) {
        
        iconImageView.image = image
        nameLabel.text = data.name
        symbolLabel.text = data.symbol
       
        let currencyUSD = formatter.currency(data.marketData.priceUSD, symbol: "$")
        
        let percent = formatter.percent(data.marketData.percentChangeUSDLast24Hours)
        
        priceLabel.text = currencyUSD
        percentChangeLabel.text = percent
    }
    
    private func setupUI() {
        backgroundColor = .clear
        setAutoresizingMask()
        setupIconImageView()
        setupNameLabel()
        setupSymbolLabel()
        setupPriceLabel()
        setupPercentChangeLabel()
    }

    private func setAutoresizingMask() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        percentChangeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupIconImageView() {
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
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
    
    ///TODO: add image
    private func setupPercentChangeLabel() {
        percentChangeLabel.font = .currencySymbol
        percentChangeLabel.textColor = .ypGray
        
        addSubview(percentChangeLabel)

        NSLayoutConstraint.activate([
            percentChangeLabel.heightAnchor.constraint(equalToConstant: 21),
            percentChangeLabel.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            percentChangeLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
