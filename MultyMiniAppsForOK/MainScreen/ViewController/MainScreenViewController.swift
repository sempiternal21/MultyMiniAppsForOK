//
//  ViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import UIKit

class MainScreenViewController: UIViewController {
    var mainView: MainScreenView { self.view as! MainScreenView }
    let apiClient = StubAPIClient()
    private var tableViewDataSource: MainScreenTableViewDataSource?
    private var tableViewDelegate: MainScreenTableViewDelegate?
    private var router = Router()
    
    override func loadView() {
        view = MainScreenView()
        title = NSLocalizedString("miniApps", comment: "")
        
        tableViewDataSource = MainScreenTableViewDataSource(tableView: mainView.tableView)
        tableViewDelegate = MainScreenTableViewDelegate()
        mainView.tableView.dataSource = tableViewDataSource
        mainView.tableView.delegate = tableViewDelegate
        
        router.setRootController(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButton()
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            var vc: UIViewController
            switch dataSource.items[index].id {
            case 0:
                vc = CryptoViewController()
            case 1:
                vc = JokeViewController()
            case 2:
                vc = FeedbackViewController()
            case 3:
                vc = ExchangeRatesViewController()
            case 4:
                vc = TikTakToeViewController()
            case 5:
                vc = MusicViewController()
            default:
                return
            }
            
            self?.router.pushNextViewController(vc: vc)
        }
        
        Task {
            let items = await apiClient.getList()
            tableViewDataSource?.set(characters: items.results)
        }
    }
    var currentRowHeight = UIScreen.main.bounds.height / 8
    
    func addBarButton() {
        let menuButton: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("more", comment: ""), style: .plain, target: self, action: #selector(toggleLeftButton))
        self.navigationItem.rightBarButtonItem = menuButton
    }
    
    @objc func toggleLeftButton() {
        if currentRowHeight == UIScreen.main.bounds.height / 2 {
            currentRowHeight = UIScreen.main.bounds.height / 8
            tableViewDelegate?.heightRowCoeff = 8
            let menuButton: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("more", comment: ""), style: .plain, target: self, action: #selector(toggleLeftButton))
            self.navigationItem.rightBarButtonItem = menuButton
        } else {
            currentRowHeight = UIScreen.main.bounds.height / 2
            tableViewDelegate?.heightRowCoeff = 2
            let menuButton: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("less", comment: ""), style: .plain, target: self, action: #selector(toggleLeftButton))
            self.navigationItem.rightBarButtonItem = menuButton
        }
        mainView.tableView.reloadData()
        mainView.layoutIfNeeded()
    }
}
