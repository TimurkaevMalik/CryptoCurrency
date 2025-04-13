//
//  NumFormatter.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import Foundation

struct NumFormatter {
    static let shared = NumFormatter()
    
    private let formatter = NumberFormatter()
    
    private init(){
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
    }
    
    func currency(_ value: Double,
                  symbol: String,
                  position: SymbolPosition = .left) -> String {
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = symbol
        
        if position == .left {
            formatter.positiveFormat = symbol + "#,##0.00"
        } else {
            formatter.positiveFormat = "#,##0.00" + " " + symbol
        }
        
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    func percent(_ value: Double) -> String {
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1
        formatter.positiveFormat = "#,##0.0%"
        formatter.currencySymbol = "%"
        
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    enum SymbolPosition {
        case right
        case left
    }
}
