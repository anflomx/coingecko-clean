//
//  CryptoCurrencyDomainErrorMapper.swift
//  CoinGecko
//
//  Created by Antonio Flores on 23/02/24.
//

import Foundation

class CryptoCurrencyDomainErrorMapper {
    func map(error: HttpClientError?) -> CryptoCurrencyDomainError {
        return .generic
    }
}
