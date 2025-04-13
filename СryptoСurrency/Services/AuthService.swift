//
//  AuthViewModel.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import Foundation

final class AuthService: AuthServiceProtocol {
    static let shared = AuthService()
    
    var isAuthenticated: Bool {
        userDefaults.bool(forKey: authKey)
    }
    
    private let authKey = "isAuthenticated"
    private let userDefaults = UserDefaults.standard
    
    private init(){}
    
    func authenticate(login: String, password: String) -> Bool {
        let isValid = login == "1234" && password == "1234"
        if isValid {
            userDefaults.set(true, forKey: authKey)
        }
        return isValid
    }
    
    func logout() {
        userDefaults.set(false, forKey: authKey)
    }
}
