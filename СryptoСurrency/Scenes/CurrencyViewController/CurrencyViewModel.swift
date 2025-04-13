//
//  CurrencyViewModel.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import Foundation

final class CurrencyViewModel: CurrencyViewModelProtocol {
    let currency: CryptoData
    
    init(currency: CryptoData) {
        self.currency = currency
    }
}
