//
//  CurrencyViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import UIKit

final class CurrencyViewController: UIViewController {
    
    private let currency: CryptoData
    
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
    }
    
    private func setupTileView() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "\(currency.name) (\(currency.symbol))"
    }
}
