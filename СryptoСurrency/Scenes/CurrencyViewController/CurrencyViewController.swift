//
//  CurrencyViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import UIKit

final class CurrencyViewController: UIViewController {
    
    private let currency: CryptoData
    private let formatter = NumFormatter.shared
    
    private lazy var statisticContainer = UIView()
    private lazy var statisticTitleLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var percentLabel = UILabel()
    private lazy var percentImageView = UIImageView()
    
    init(currency: CryptoData) {
        self.currency = currency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypWhiteMedium
        
        setupTileView()
        setupPriceLabel()
        setupPercentViews()
        setupStatisticContainer()
        setupTrendingLabel()
    }
    
    private func setupTileView() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "\(currency.name) (\(currency.symbol))"
    }
    
    private func setupPriceLabel() {
        priceLabel.font = .mediumTitle
        priceLabel.textColor = .ypBlackEclipse
        priceLabel.text = formatter.currency(currency.marketData.priceUSD, symbol: "$")
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 42),
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupPercentViews() {
        let percent = currency.marketData.percentChangeUSDLast24Hours
        let percentString = formatter.percent(abs(percent))
        
        percentLabel.font = .currencySymbol
        percentLabel.textColor = .ypGray
        percentLabel.text = percentString
        
        percentImageView.image = percent.isLess(than: 0) ? .chevronDown : .chevronUp
        
        percentImageView.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(percentLabel)
        view.addSubview(percentImageView)

        NSLayoutConstraint.activate([
            percentLabel.heightAnchor.constraint(equalToConstant: 21),
            percentLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            percentLabel.centerXAnchor.constraint(equalTo: priceLabel.centerXAnchor),
            
            percentImageView.trailingAnchor.constraint(equalTo: percentLabel.leadingAnchor, constant: -5),
            percentImageView.centerYAnchor.constraint(equalTo: percentLabel.centerYAnchor)
        ])
    }
    
    private func setupStatisticContainer() {
        statisticContainer.backgroundColor = .ypWhiteCloud

        statisticContainer.layer.cornerRadius = .containerRadius
        statisticContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        statisticContainer.layer.masksToBounds = true
        
        view.addSubview(statisticContainer)
        statisticContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statisticContainer.heightAnchor.constraint(equalToConstant: 242),
            statisticContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            statisticContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statisticContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTrendingLabel() {
        statisticTitleLabel.text = "Market Statistic"
        statisticTitleLabel.font = .affiliateProgram
        statisticTitleLabel.textColor = .ypBlackEclipse
        
        statisticTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statisticTitleLabel)
        
        NSLayoutConstraint.activate([
            statisticTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            statisticTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            statisticTitleLabel.topAnchor.constraint(equalTo: statisticContainer.topAnchor, constant: 25)
        ])
    }
}
