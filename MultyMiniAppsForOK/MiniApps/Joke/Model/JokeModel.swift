//
//  Model.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation

// MARK: - JokeModel
struct JokeModel: Codable {
    let error: Bool?
    let category, type, setup, delivery, joke: String?
    let flags: Flags?
    let safe: Bool?
    let id: Int?
    let lang: String?
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool?
    let sexist, explicit: Bool?
}
