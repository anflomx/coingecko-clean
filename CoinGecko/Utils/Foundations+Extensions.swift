//
//  Foundations+Extensions.swift
//  CoinGecko
//
//  Created by Antonio Flores on 23/02/24.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
