//
//  HomeViewModel.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    var crypts: [CryptoData] = []
    
    var onFetchSuccess: (() -> Void)?
    var onFetchFailure: ((ErrorNetworkClient) -> Void)?
    
    private let cryptoService: CryptoServiceProtocol
    private let symbols = CryptoSymbol.allCases
    
    init(cryptoService: CryptoServiceProtocol) {
        self.cryptoService = cryptoService
    }
    
    func fetchCrypts() {
        symbols.forEach { symbol in
        
            cryptoService.fetchCrypt(symbol) { [weak self] result in
                
                guard let self else { return }
                
                switch result {
                    
                case .success(let crypt):
                    self.crypts.append(crypt)
                    self.onFetchSuccess?()
                    
                case .failure(let error):
                    self.onFetchFailure?(error)
                }
            }
        }
    }
}
