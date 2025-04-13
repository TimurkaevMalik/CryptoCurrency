//
//  AuthViewModel.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import Foundation

final class AuthViewModel: AuthViewModelProtocol {
    var onAuthSuccess: (() -> Void)?
    var onAuthFailure: ((String) -> Void)?
    
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    func validateCredentials(login: String?, password: String?) {
        guard let login = login, !login.isEmpty,
              let password = password, !password.isEmpty else {
            onAuthFailure?("Заполните все поля")
            return
        }
        
        if authService.authenticate(login: login, password: password) {
            onAuthSuccess?()
        } else {
            onAuthFailure?("Введены неправильный логин или пароль")
        }
    }
}
