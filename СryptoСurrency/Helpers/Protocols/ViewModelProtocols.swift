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

protocol HomeViewModelProtocol {
    ///TODO: do I need optional?
    var onFetchSuccess: ((CryptoData) -> Void)? { get set }
    var onFetchFailure: ((ErrorNetworkClient) -> Void)? { get set }
    func fetchCrypts()
}
