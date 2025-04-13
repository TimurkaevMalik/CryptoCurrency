//
//  Endpoint.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

enum Endpoint {
    case assetMetrics(symbol: CryptoSymbol)
    
    var url: URL? {
        switch self {
        case .assetMetrics(let symbol):
            return URL(string: "\(RequestConstants.baseURL)/assets/\(symbol.rawValue)/metrics")
        }
    }
}
