//
//  ApiDataSourceProtocol.swift
//  CoinGecko
//
//  Created by Antonio Flores on 22/02/24.
//

import Foundation

protocol ApiDataSourceProtocol {
    func getGlobalCryptoSymbolList() async -> Result<[String], HttpClientError>
    func getCryptoList() async -> Result<[CryptoCurrencyBasicDTO], HttpClientError>
    func getPriceInfoForCryptos(id: [String]) async -> Result<[String: CryptoCurrencyPriceInfoDTO], HttpClientError>
}
