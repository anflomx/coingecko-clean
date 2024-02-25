//
//  GlobalCryptoListRepositoryProtocol.swift
//  CoinGecko
//
//  Created by Antonio Flores on 22/02/24.
//

import Foundation

protocol GlobalCryptoListRepositoryProtocol {
    func getGlobalCryptoList() async -> Result<[CryptoCurrency], CryptoCurrencyDomainError>
}
