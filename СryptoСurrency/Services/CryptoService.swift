//
//  FetchCryptoService.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import Foundation

final class CryptoService: CryptoServiceProtocol {
    
    func fetchCrypt(_ symbol: CryptoSymbol,
                    completion: @escaping (CryptoResponse) -> Void) {
        
        guard let request = makeRequest(.get, endpoint: .assetMetrics(symbol: symbol)) else {
            
            completion(.failure(.operation(.urlRequestError)))
            return
        }
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                if let error = error as? NSError {
                    completion(.failure(.operation(.urlSessionError, code: "\(error.code)")))
                    
                    return
                }
                
                if let response = response as? HTTPURLResponse,
                   response.statusCode < 200 ||
                    response.statusCode >= 300 {
                    
                    completion(.failure(.operation(.urlSessionError,
                                                   code: "\(response.statusCode)")))
                    return
                }
                
                if let data {
                    do {
                        let cryptDataResponse = try JSONDecoder().decode(
                            CryptoDataResponse.self,
                            from: data)
                        
                        completion(.success(cryptDataResponse.data))
                        
                    } catch let error as NSError {
                        completion(.failure(.operation(.parsingError,
                                                       code: "\(error.code)")))
                    }
                }
            }
        }
        
        session.resume()
    }
    
    private func makeRequest(
        _ method: HttpMethod,
        endpoint: Endpoint,
        headers: [RequestHeaders] = [.accept]
    ) -> URLRequest? {
        
        guard let url = endpoint.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        headers.forEach { header in
            request.setValue(header.value,
                             forHTTPHeaderField: header.fieldName)
        }
        
        return request
    }
}
