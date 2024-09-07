//
//  TikTakToeViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

class TikTakToeViewController: UIViewController {
    var mainView: TikTakToeView { self.view as! TikTakToeView }
    let game = TikTakToeGame()

    private var collectionViewDataSource: TikTakToeCollectionViewDataSource?
    private var collectionViewDelegate: TikTakToeCollectionViewDelegate?
    
    override func loadView() {
        view = TikTakToeView()
        title = NSLocalizedString("zeroCrossApp", comment: "")
        
        collectionViewDataSource = TikTakToeCollectionViewDataSource(collectionView: mainView.gameCollectionView)
        collectionViewDelegate = TikTakToeCollectionViewDelegate()
        mainView.gameCollectionView.dataSource = collectionViewDataSource
        mainView.gameCollectionView.delegate = collectionViewDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.button.addTarget(self, action: #selector(tapOnHelp), for: .touchUpInside)
        
        collectionViewDataSource?.set(gameField: game.gameField)
        collectionViewDelegate?.didTapOnCell = { [self] index in
            guard let dataSource = self.collectionViewDataSource else {
                return
            }
            
            self.game.doHod(index: index)
            dataSource.set(gameField: game.gameField)
            
            let state = self.game.getState()
            switch state {
                case .winZero:
                    self.showAlert(title: NSLocalizedString("winZero", comment: ""))
                case .winCross:
                    self.showAlert(title: NSLocalizedString("winCross", comment: ""))
                case .non:
                    self.showAlert(title: NSLocalizedString("draw", comment: ""))
                case .inProgress:
                    break
            }
        }
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: NSLocalizedString("startAgain", comment: ""), style: .default) {_ in
            self.game.resetGameState()
            self.collectionViewDataSource?.set(gameField: self.game.gameField)
        }
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    @objc func tapOnHelp(tapGestureRecognizer: UITapGestureRecognizer){
        let vc = RulesViewController()
        
        vc.modalPresentationStyle = .pageSheet
        if let sheet = vc.sheetPresentationController {
            let smallDetentId = UISheetPresentationController.Detent.Identifier("small")
            let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallDetentId) { context in
                return 200
            }
            sheet.detents = [smallDetent]
            sheet.prefersGrabberVisible = true
            present(vc, animated: true, completion: nil)
        }
    }
}
