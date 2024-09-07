//
//  MusicViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

class MusicViewController: UIViewController {
    var mainView: MusicView { self.view as! MusicView }
    var musicModel: MusicModel!
    let apiClient = NetworkManager()
    private var tableViewDataSource: MusicTableViewDataSource?
    private var tableViewDelegate: MusicTableViewDelegate?
    
    override func loadView() {
        view = MusicView()
        title = NSLocalizedString("musicApp", comment: "")
        
        tableViewDataSource = MusicTableViewDataSource(tableView: mainView.tableView)
        tableViewDelegate = MusicTableViewDelegate()
        mainView.tableView.dataSource = tableViewDataSource
        mainView.tableView.delegate = tableViewDelegate
        
        self.addPlayPauseButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            let mucisUrl = URL(string: dataSource.musics[index].urlMusic)
            if let mucisUrl = mucisUrl {
                MusicPlayer.shared.setMusic(url: mucisUrl)
                self?.changeBarButton()
            }
        }
        
        Task {
            do {
                let fullUrl = DomenDanantUrl().getFullUrl(path: DomenDanantPath.musics)
                musicModel = try await NetworkManager().execute(from: fullUrl)
                if musicModel != nil {
                    tableViewDataSource?.set(musics: musicModel.musics!)
                }
            } catch {
                mainView.errorLabel.text = NSLocalizedString("networkError", comment: "")
            }
        }
    }
    
    func addPlayPauseButton() {
        let menuButton: UIBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "pause"), target: self, action: #selector(playPauseButtonTapped))
        menuButton.isEnabled = false
        self.navigationItem.rightBarButtonItem = menuButton
    }
    
    @objc func playPauseButtonTapped() {
        MusicPlayer.shared.changePlayerState()
        changeBarButton()
    }
    
    func changeBarButton() {
        let menuButton: UIBarButtonItem
        if MusicPlayer.shared.playerStateIsPaused {
            menuButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "play"), target: self, action: #selector(playPauseButtonTapped))
        } else {
            menuButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "pause"), target: self, action: #selector(playPauseButtonTapped))
        }
        menuButton.isEnabled = true
        self.navigationItem.rightBarButtonItem = menuButton
    }
}
