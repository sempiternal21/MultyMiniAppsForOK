//
//  TikTakToeCollectionViewDelegate.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation
import UIKit

class TikTakToeCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    var didTapOnCell: ((Int) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}

