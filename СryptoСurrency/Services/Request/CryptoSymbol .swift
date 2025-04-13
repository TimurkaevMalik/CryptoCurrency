//
//  CryptoSymbol .swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

///CaseIterable позволяет получить массив всех кейсов (CryptoSymbol.allCases)
enum CryptoSymbol: String, CaseIterable {
    case btc
    case eth
    case tron
    case luna
    case polkadot
    case dogecoin
    case tether
    case stellar
    case cardano
    case xrp
}
