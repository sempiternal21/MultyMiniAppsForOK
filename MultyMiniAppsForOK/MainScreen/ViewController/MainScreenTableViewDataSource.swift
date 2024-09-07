//
//  TableViewDataSource.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import Foundation
import UIKit

final class MainScreenTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let tableView: UITableView
    
    private(set) var items: [Model] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, characters: [Model] = []) {
        self.tableView = tableView
        self.items = characters
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainScreenCellView()
        
        let item = items[indexPath.row]
        let vc: UIViewController
        switch indexPath.row {
        case 0:
            vc = CryptoViewController()
            cell.mainLabelView.text = item.title
            cell.mainLabelBackground.backgroundColor = UIColor(red: 136/255, green: 65/255, blue: 239/255, alpha: 1)
        case 1:
            vc = JokeViewController()
            cell.mainLabelView.text = item.title
            cell.mainLabelBackground.backgroundColor = UIColor(red: 173/255, green: 117/255, blue: 255/255, alpha: 1)
        case 2:
            vc = FeedbackViewController()
            cell.mainLabelView.text = item.title
            cell.mainLabelBackground.backgroundColor = UIColor(red: 219/255, green: 177/255, blue: 255/255, alpha: 1)
        case 3:
            vc = ExchangeRatesViewController()
            cell.mainLabelView.text = item.title
            cell.mainLabelBackground.backgroundColor = UIColor(red: 183/255, green: 255/255, blue: 104/255, alpha: 1)
        case 4:
            vc = TikTakToeViewController()
            cell.mainLabelView.text = item.title
            cell.mainLabelBackground.backgroundColor = UIColor(red: 136/255, green: 196/255, blue: 255/255, alpha: 1)
        case 5, 6, 7, 8, 9, 10:
            vc = MusicViewController()
            cell.mainLabelView.text = item.title
            cell.mainLabelBackground.backgroundColor = UIColor(red: 255/255, green: 246/255, blue: 123/255, alpha: 1)
        default:
            vc = UIViewController()
        }
        cell.configureCell(vc: vc)
        cell.clipsToBounds = true
        cell.accessoryType = .disclosureIndicator
        cell.mainLabelView.bringSubviewToFront(vc.view)
        
        return cell
    }
    
    func set(characters: [Model]) {
        self.items = characters
    }
}
