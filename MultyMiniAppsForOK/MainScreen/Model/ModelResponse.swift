//
//  ModelResponse.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import Foundation

struct ModelResponse: Decodable {
    let results: [Model]
}

struct Model: Decodable {
    let id: Int32
    let title: String
}
