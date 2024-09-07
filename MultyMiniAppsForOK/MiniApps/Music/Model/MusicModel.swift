//
//  MusicModel.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation

// MARK: - MusicModel
struct MusicModel: Codable {
    let musics: [Music]?
}

// MARK: - Music
struct Music: Codable {
    let title, author: String
    let urlImage: String
    let urlMusic: String
}
