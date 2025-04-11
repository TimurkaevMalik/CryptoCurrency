//
//  CurrencyCell.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import UIKit

final class CurrencyCell: UITableViewCell {
    static let identifier = "CurrencyCell"
//    let data: CryptoData
    
    private let iconImageView = UIImageView()
    private let nameLabel = UILabel()
    private let symbolLabel = UILabel()
    private let priceLabel = UILabel()
    private let percentChangeLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
//    init(data: CryptoData,
//         image: UIImage) {
//        
//        self.data = data
//        iconImageView.image = image
//        super.init(frame: .zero)
//        
//        setupUI()
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setAutoresizingMask()
        setupIconImageView()
        setupNameLabel()
        setupSymbolLabel()
        setupPriceLabel()
        setupPercentChangeLabel()
    }
    
    func configureWith(_ data: CryptoData,
                               image: UIImage) {
        
        iconImageView.image = image
        nameLabel.text = data.name
        symbolLabel.text = data.symbol
        priceLabel.text = "\(data.marketData.priceUSD)"
        percentChangeLabel.text = "\(data.marketData.percentChangeUSDLast24Hours)"
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
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupNameLabel() {
//        nameLabel.text = data.name
        nameLabel.font = .currencyName
        nameLabel.textColor = .ypBlack
        
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 27),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 19)
        ])
    }
    
    private func setupSymbolLabel() {
//        symbolLabel.text = data.symbol
        symbolLabel.font = .currencySymbol
        symbolLabel.textColor = .ypGray
        
        addSubview(symbolLabel)
        
        NSLayoutConstraint.activate([
            symbolLabel.heightAnchor.constraint(equalToConstant: 21),
            symbolLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            symbolLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 19)
        ])
    }
    
    private func setupPriceLabel() {
//        priceLabel.text = data.name
        priceLabel.font = .currencyName
        priceLabel.textColor = .ypBlack
        
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 27),
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    ///TODO: add image
    private func setupPercentChangeLabel() {
//        percentChangeLabel.text = data.symbol
        percentChangeLabel.font = .currencySymbol
        percentChangeLabel.textColor = .ypGray
        
        addSubview(percentChangeLabel)

        NSLayoutConstraint.activate([
            percentChangeLabel.heightAnchor.constraint(equalToConstant: 21),
            percentChangeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            percentChangeLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
