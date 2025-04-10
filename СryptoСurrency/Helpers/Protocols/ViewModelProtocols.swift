//
//  AuthViewModelProtocol.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import Foundation

protocol AuthViewModelProtocol {
    var onAuthSuccess: (() -> Void)? { get set }
    var onAuthFailure: ((String) -> Void)? { get set }
    func validateCredentials(login: String?, password: String?)
}
