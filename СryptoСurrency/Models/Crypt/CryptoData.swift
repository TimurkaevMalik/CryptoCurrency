//
//  CryptoData.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import Foundation

struct CryptoData: Decodable {
    let id: String
    let name: String
    let symbol: String
    let marketData: MarketData
    let marketcap: Marketcap
    let supply: Supply
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, marketcap, supply
        case marketData = "market_data"
    }
}
