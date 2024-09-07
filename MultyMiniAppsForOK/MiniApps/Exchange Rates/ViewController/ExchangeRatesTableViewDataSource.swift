//
//  ExchangeRatesTableViewDataSOurce.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

final class ExchangeRatesTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let tableView: UITableView
    
    private(set) var currencies: [Order] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, currencies: [Order] = []) {
        self.tableView = tableView
        self.currencies = currencies
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

        cell.textLabel?.text = currencies[indexPath.row].currency1
        let rightText = currencies[indexPath.row].value + " " + currencies[indexPath.row].currency2
        cell.detailTextLabel?.text = rightText
        cell.selectionStyle = .none 

        return cell
    }
    
    func set(currencies: [Order]) {
        self.currencies = currencies
    }
}
