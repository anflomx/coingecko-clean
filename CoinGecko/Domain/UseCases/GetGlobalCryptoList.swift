//
//  GetGlobalCryptoList.swift
//  CoinGecko
//
//  Created by Antonio Flores on 22/02/24.
//

import Foundation

class GetGlobalCryptoList {
    private let repository: GlobalCryptoListRepositoryProtocol
    
    init(respository: GlobalCryptoListRepositoryProtocol) {
        self.repository = respository
    }
    
    func execute() async -> Result<[CryptoCurrency], CryptoCurrencyDomainError> {
        let result = await repository.getGlobalCryptoList()
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        return .success(cryptoList.sorted { $0.marketCap > $1.marketCap })
    }
}
