//
//  HomeViewModel.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    var crypts: [CryptoData] = []
    
    var onCryptsChange: (() -> Void)?
    var onFetchFailure: ((ErrorNetworkClient) -> Void)?
    
    private let cryptoService: CryptoServiceProtocol
    private let symbols = CryptoSymbol.allCases
    private var currentFilter = Filter.ascending
    private let group = DispatchGroup()
    
    init(cryptoService: CryptoServiceProtocol) {
        self.cryptoService = cryptoService
    }
    
    func updateCrypts() {
        var tempCrypts = [CryptoData]()
        
        symbols.forEach { symbol in
            group.enter()
            cryptoService.fetchCrypt(symbol) { [weak self] result in
                
                guard let self else { return }
                
                switch result {
                    
                case .success(let crypt):
                    tempCrypts.append(crypt)
                    
                case .failure(let error):
                    self.onFetchFailure?(error)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.crypts = tempCrypts
            self.sortByCurrentFilter()
            self.onCryptsChange?()
        }
    }
    
    func sortAscending() {
        currentFilter = .ascending
        sortByCurrentFilter()
    }
    
    func sortDescending() {
        currentFilter = .descending
        sortByCurrentFilter()
    }
    
    private func sortByCurrentFilter() {
        if currentFilter == .ascending {
            crypts.sort(by: { $0.marketData.priceUSD > $1.marketData.priceUSD})
        } else {
            crypts.sort(by: { $0.marketData.priceUSD < $1.marketData.priceUSD})
        }
        onCryptsChange?()
    }
}

private extension HomeViewModel {
    enum Filter {
        case ascending
        case descending
    }
}
