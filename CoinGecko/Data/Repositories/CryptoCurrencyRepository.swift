//
//  CryptoCurrencyRepository.swift
//  CoinGecko
//
//  Created by Antonio Flores on 22/02/24.
//

import Foundation

class CryptoCurrencyRepository: GlobalCryptoListRepositoryProtocol {
    private let apiDataSource: ApiDataSourceProtocol
    private let errorMapper: CryptoCurrencyDomainErrorMapper
    private let domainMapper: CryptoCurrencyDomainMapper
    
    init(apiDataSource: ApiDataSourceProtocol, errorMapper: CryptoCurrencyDomainErrorMapper, domainMapper: CryptoCurrencyDomainMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getGlobalCryptoList() async -> Result<[CryptoCurrency], CryptoCurrencyDomainError> {
        let symbolListResult = await apiDataSource.getGlobalCryptoSymbolList()
        let cryptoListResult = await apiDataSource.getCryptoList()
        
        guard case .success(let symbolList) = symbolListResult else {
            return .failure(errorMapper.map(error: symbolListResult.failureValue as? HttpClientError))
        }

        guard case .success(let cryptoList) = cryptoListResult else {
            return .failure(errorMapper.map(error: cryptoListResult.failureValue as? HttpClientError))
        }
        
        let cryptoCurrencyBuilderList = domainMapper.getCryptoCurrencyBuilderList(symbolList: symbolList, cryptoList: cryptoList)

        let priceInfoResult = await apiDataSource.getPriceInfoForCryptos(id: cryptoCurrencyBuilderList.map { $0.id })

        guard case .success(let priceInfo) = priceInfoResult else {
            return .failure(errorMapper.map(error: priceInfoResult.failureValue as? HttpClientError))
        }

        let cryptoCurrency = domainMapper.map(cryptoCurrencyBuilderList: cryptoCurrencyBuilderList, priceInfo: priceInfo)
        
        return .success(cryptoCurrency)
    }
}
