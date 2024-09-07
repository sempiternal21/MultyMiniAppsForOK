//
//  DomentJokeUrl.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 07.09.2024.
//

import Foundation

class DomenJokeUrl {
    let url = "https://v2.jokeapi.dev"
    
    func getFullUrl(path: DomenJokePath) -> String {
        switch path {
        case .anyJoke:
            return url + "/joke/Any"
        }
    }
}

enum DomenJokePath {
    case anyJoke
}
