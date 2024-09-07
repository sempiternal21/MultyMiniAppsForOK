//
//  TikTakToeView.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation
import UIKit

class TikTakToeView: UIView {
    let gameCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TikTakToeViewCell.self, forCellWithReuseIdentifier: "TikTakToeViewCell")
        return collectionView
    }()
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Как играть?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor(red: 145/255, green: 193/255, blue: 245/255, alpha: 1)
        addSubview(gameCollectionView)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            gameCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            gameCollectionView.heightAnchor.constraint(equalToConstant: 300),
            gameCollectionView.widthAnchor.constraint(equalToConstant: 300),
            gameCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button.topAnchor.constraint(equalTo: gameCollectionView.bottomAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
