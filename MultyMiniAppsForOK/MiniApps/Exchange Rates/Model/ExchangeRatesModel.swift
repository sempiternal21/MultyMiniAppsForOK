//
//  ExchangeRatesModel.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation

// MARK: - ExchangeRatesModel
struct ExchangeRatesModel: Codable {
    let orders: [Order]
}

// MARK: - Order
struct Order: Codable {
    let currency1, currency2, value: String
}

