//
//  HomeViewModel.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    var onFetchSuccess: ((CryptoData) -> Void)?
    var onFetchFailure: ((ErrorNetworkClient) -> Void)?
    
    private let cryptoService: CryptoServiceProtocol
    private let symbols = CryptoSymbol.allCases
    
    init(cryptoService: CryptoServiceProtocol) {
        self.cryptoService = cryptoService
    }
    
    func fetchCrypts() {
        cryptoService.fetchCrypt(symbols[0]) { [weak self] result in
            
            guard let self else { return }
            
            switch result {
                
            case .success(let crypt):
                self.onFetchSuccess?(crypt)
            case .failure(let error):
                self.onFetchFailure?(error)
            }
        }
    }
}
