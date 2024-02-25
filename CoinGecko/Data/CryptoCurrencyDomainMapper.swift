//
//  CryptoCurrencyDomainMapper.swift
//  CoinGecko
//
//  Created by Antonio Flores on 23/02/24.
//

import Foundation

class CryptoCurrencyDomainMapper {
    func getCryptoCurrencyBuilderList(symbolList: [String], cryptoList: [CryptoCurrencyBasicDTO]) -> [CryptoCurrencyBuilder] {
        var symbolListDic = [String: Bool]()
        symbolList.forEach { symbol in
            symbolListDic[symbol] = true
        }
        
        let globalCryptoList = cryptoList.filter { symbolListDic[$0.symbol] ?? false }
        let cryptoCurrencyBuilderList = globalCryptoList.map { CryptoCurrencyBuilder(id: $0.id, name: $0.name, symbol: $0.symbol) }
        
        return cryptoCurrencyBuilderList
    }
    
    func map(cryptoCurrencyBuilderList: [CryptoCurrencyBuilder], priceInfo: [String: CryptoCurrencyPriceInfoDTO]) -> [CryptoCurrency] {
        cryptoCurrencyBuilderList.forEach { cryptoCurrencyBuilder in
            if let priceInfo = priceInfo[cryptoCurrencyBuilder.id] {
                cryptoCurrencyBuilder.price = priceInfo.price
                cryptoCurrencyBuilder.price24 = priceInfo.price24h
                cryptoCurrencyBuilder.volume24 = priceInfo.volume24h
                cryptoCurrencyBuilder.marketCap = priceInfo.marketCap
            }
        }
        return cryptoCurrencyBuilderList.compactMap { $0.build() }
    }
}
