//
//  ExchangeRatesViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

class ExchangeRatesViewController: UIViewController {
    var mainView: ExchangeRatesView { self.view as! ExchangeRatesView }
    var exchangeRatesModel: ExchangeRatesModel!
    let apiClient = NetworkManager()
    private var tableViewDataSource: ExchangeRatesTableViewDataSource?
    
    override func loadView() {
        view = ExchangeRatesView()
        title = NSLocalizedString("currenciesApp", comment: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDataSource = ExchangeRatesTableViewDataSource(tableView: mainView.tableView)
        mainView.tableView.dataSource = tableViewDataSource
        
        Task {
            do {
                let fullUrl = DomenDanantUrl().getFullUrl(path: DomenDanantPath.exchangeRates)
                exchangeRatesModel = try await NetworkManager().execute(from: fullUrl)
                if exchangeRatesModel != nil {
                    tableViewDataSource?.set(currencies: exchangeRatesModel.orders)
                }
            } catch {
                mainView.errorLabel.text = NSLocalizedString("networkError", comment: "")
            }
        }
    }
}
