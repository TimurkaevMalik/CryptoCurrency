//
//  RequestHeaders.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

struct RequestHeaders {
    let fieldName: String
    let value: String
    
    static let apiKey = RequestHeaders(
        fieldName: "x-messari-api-key",
        value: RequestConstants.apiKey)
    
    static let accept = RequestHeaders(
        fieldName: "Accept",
        value: "application/json")
}
