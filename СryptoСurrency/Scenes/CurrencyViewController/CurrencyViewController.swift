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
    
    private lazy var priceLabel = UILabel()
    
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
}
