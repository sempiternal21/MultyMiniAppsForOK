//
//  MusicView.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation
import UIKit

class MusicView: BaseView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MusicListCellView.self, forCellReuseIdentifier: "MusicListCellView")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        addSubview(tableView)
        addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
