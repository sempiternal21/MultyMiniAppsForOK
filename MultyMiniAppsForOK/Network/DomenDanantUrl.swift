//
//  BaseApi.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation

class DomenDanantUrl {
    let url = "http://www.danant.ru"
    
    func getFullUrl(path: DomenDanantPath) -> String {
        switch path {
        case .exchangeRates:
            return url + "/exchangeRates"
        case .musics:
            return url + "/musics"
        case .feedback:
            return url + "/feedback"
        }
    }
}

enum DomenDanantPath {
    case exchangeRates, musics, feedback
}
