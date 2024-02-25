//
//  CryptoCurrencyBasicDTO.swift
//  CoinGecko
//
//  Created by Antonio Flores on 22/02/24.
//

import Foundation

struct CryptoCurrencyBasicDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}
