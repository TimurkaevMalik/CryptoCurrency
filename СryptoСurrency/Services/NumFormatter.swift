//
//  CustomNumberFormatter.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import Foundation

struct CustomNumberFormatter {
    static let shared = CustomNumberFormatter()
    
    private let formatter = NumberFormatter()
    
    private init(){
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
    }
    
    func currency(_ value: Double,
                  symbol: String) -> String {
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.positiveFormat = symbol + "#,##0.00"
        formatter.currencySymbol = symbol
        
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
}
