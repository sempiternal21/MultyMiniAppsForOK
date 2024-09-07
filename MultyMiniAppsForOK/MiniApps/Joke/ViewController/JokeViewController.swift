//
//  JokeViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

class JokeViewController: UIViewController {
    var mainView: JokeView { self.view as! JokeView }
    var jokeModel: JokeModel!
    let apiClient = NetworkManager()
    
    override func loadView() {
        view = JokeView()
        title = NSLocalizedString("jokeApp", comment: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                let fullUrl = DomenJokeUrl().getFullUrl(path: DomenJokePath.anyJoke)
                jokeModel = try await NetworkManager().execute(from: fullUrl)
                if jokeModel.joke != nil {
                    mainView.configure(title: jokeModel.joke!)
                } else if jokeModel.setup != nil {
                    mainView.configure(title: jokeModel.setup!)
                } else {
                    throw NetworkError.someError
                }
                
            } catch {
                mainView.errorLabel.text = NSLocalizedString("networkError", comment: "")
            }
        }
    }
}
