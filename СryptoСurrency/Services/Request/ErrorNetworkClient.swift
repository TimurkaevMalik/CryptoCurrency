//
//  ErrorNetworkClient.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

enum ErrorNetworkClient: Error {
    case operation(_ type: OperationType,
                   code: String = "unknown")
    
    var message: String {
        switch self {
        case .operation(let type, let code):
            return "Network error: \(type.rawValue).\n Code: \(code)"
        }
    }
    
    enum OperationType: String {
        case urlRequestError = "url request error"
        case urlSessionError = "url session error"
        case parsingError = "parsing error"
    }
}
