//
//  MusicTableViewDataSource.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation
import UIKit

final class MusicTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let tableView: UITableView
    
    private(set) var musics: [Music] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, musics: [Music] = []) {
        self.tableView = tableView
        self.musics = musics
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCellView", for: indexPath) as! MusicListCellView
        
        let musicModel = musics[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(musicModel)
        
        
        return cell
    }
    
    func set(musics: [Music]) {
        self.musics = musics
    }
}
