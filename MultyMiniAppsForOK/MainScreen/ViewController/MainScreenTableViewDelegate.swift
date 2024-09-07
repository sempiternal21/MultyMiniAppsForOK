//
//  TableViewDelegate.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import Foundation
import UIKit

class MainScreenTableViewDelegate: NSObject, UITableViewDelegate {
    var didTapOnCell: ((Int) -> Void)?
    var heightRowCoeff = 8.0
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let deviceHeight = UIScreen.main.bounds.height
        
        return deviceHeight / heightRowCoeff
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}
