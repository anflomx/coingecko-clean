//
//  CryptoCurrencyBuilder.swift
//  CoinGecko
//
//  Created by Antonio Flores on 23/02/24.
//

import Foundation

class CryptoCurrencyBuilder {
    let id: String
    let name: String
    let symbol: String
    var price: Double?
    var price24: Double?
    var volume24: Double?
    var marketCap: Double?
    
    init(id: String, name: String, symbol: String) {
        self.id = id
        self.name = name
        self.symbol = symbol
    }
    
    func build() -> CryptoCurrency? {
        guard let price = price,
              let marketCap = marketCap else { return nil }
        
        return CryptoCurrency(id: id, name: name, symbol: symbol,
                              price: price, price24: price24, volume24: volume24, marketCap: marketCap)
    }
}
