//
//  APIClient.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import Foundation

final class StubAPIClient {
    // static data
    func getList() async -> ModelResponse {
        return ModelResponse(results: [
            Model(id: 0, title: NSLocalizedString("cryptoApp", comment: "")),
            Model(id: 1, title: NSLocalizedString("jokeApp", comment: "")),
            Model(id: 2, title: NSLocalizedString("feedbackApp", comment: "")),
            Model(id: 3, title: NSLocalizedString("currenciesApp", comment: "")),
            Model(id: 4, title: NSLocalizedString("zeroCrossApp", comment: "")),
            Model(id: 5, title: NSLocalizedString("musicApp", comment: "")),
            Model(id: 5, title: NSLocalizedString("musicApp", comment: "")),
            Model(id: 5, title: NSLocalizedString("musicApp", comment: "")),
            Model(id: 5, title: NSLocalizedString("musicApp", comment: "")),
            Model(id: 5, title: NSLocalizedString("musicApp", comment: "")),
            Model(id: 5, title: NSLocalizedString("musicApp", comment: "")),
        ])
    }
}
