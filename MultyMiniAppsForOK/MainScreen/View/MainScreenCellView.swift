//
//  ListCellView.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import Foundation
import UIKit
import Kingfisher

class MainScreenCellView: UITableViewCell {
    let mainLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    let cellBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    let mainLabelBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    var containerViewController: UIViewController!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
    }
    
    func configureCell(vc: UIViewController) {
        containerViewController = vc

        let bounds = UIScreen.main.bounds
        self.containerViewController.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/8, width: bounds.width, height: bounds.height)
        self.contentView.addSubview(containerViewController.view)
        self.containerViewController.didMove(toParent: MainScreenViewController())
        self.containerViewController.view.addSubview(cellBackground)
        self.cellBackground.addSubview(mainLabelBackground)
        self.mainLabelBackground.addSubview(mainLabelView)
        
        NSLayoutConstraint.activate([
            mainLabelView.leadingAnchor.constraint(equalTo: mainLabelBackground.leadingAnchor, constant: 20),
            mainLabelView.centerYAnchor.constraint(equalTo: mainLabelBackground.centerYAnchor),
            
            cellBackground.topAnchor.constraint(equalTo: topAnchor),
            cellBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellBackground.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/8),
            
            mainLabelBackground.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainLabelBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainLabelBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            mainLabelBackground.bottomAnchor.constraint(equalTo: cellBackground.bottomAnchor, constant: -20),
        ])
        containerViewController.view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
