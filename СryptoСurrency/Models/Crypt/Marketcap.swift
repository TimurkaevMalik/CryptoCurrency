//
//  Marketcap.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import Foundation

struct Marketcap: Decodable {
    let currentMarketcapUSD: Double
    
    enum CodingKeys: String, CodingKey {
        case currentMarketcapUSD = "current_marketcap_usd"
    }
}
