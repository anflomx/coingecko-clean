//
//  CryptoCurrency.swift
//  CoinGecko
//
//  Created by Antonio Flores on 22/02/24.
//

import Foundation

struct CryptoCurrency {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let price24: Double?
    let volume24: Double?
    let marketCap: Double
}
