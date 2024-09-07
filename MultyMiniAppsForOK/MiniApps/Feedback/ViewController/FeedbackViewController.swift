//
//  FeedbackViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

class FeedbackViewController: UIViewController {
    var mainView: FeedbackView { self.view as! FeedbackView }
    let apiClient = NetworkManager()
    var model: FeedbackModel!
    
    override func loadView() {
        view = FeedbackView()
        title = NSLocalizedString("feedbackApp", comment: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.sendButton.addTarget(self, action: #selector(tapOnSendButton), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.textView.becomeFirstResponder()
    }
    
    @objc func tapOnSendButton() {
        Task {
            let fullUrl = DomenDanantUrl().getFullUrl(path: DomenDanantPath.feedback)
            let text = mainView.textView.text
            if text != nil && text != "" {
                do {
                    model = try await NetworkManager().execute(from: fullUrl, type: HttpRequestType.post, params: ["text":text!])
                    showAlert(title: NSLocalizedString("thanks", comment: ""))
                } catch {
                    showAlert(title: NSLocalizedString("networkError", comment: ""))
                }
            }
        }
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) {_ in
            self.dismiss(animated: true)
        }
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
