//
//  TikTakToeCollectionViewDataSource.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation
import UIKit

final class TikTakToeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private let collectionView: UICollectionView
    
    private(set) var gameField: [Int] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TikTakToeViewCell", for: indexPath) as! TikTakToeViewCell
        if gameField[indexPath.row] == -1 {
            cell.imageView.image = UIImage(named: "makron")
        } else if gameField[indexPath.row] == 1{
            cell.imageView.image = UIImage(named: "durov")
        } else {
            cell.imageView.image = nil
        }
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGray3.cgColor
        
        return cell
    }
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func set(gameField: [Int]) {
        self.gameField = gameField
    }
}
