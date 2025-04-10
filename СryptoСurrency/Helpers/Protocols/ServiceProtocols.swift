//
//  ServiceProtocols.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import Foundation

protocol AuthServiceProtocol {
    var isAuthenticated: Bool { get }
    func authenticate(login: String, password: String) -> Bool
    func logout()
}
