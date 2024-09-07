//
//  MusicPlayer.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    private init() { }
    
    private var audioPlayer: AVPlayer?
    
    var playerStateIsPaused: Bool {
        if audioPlayer?.timeControlStatus.rawValue == 0 {
            return true
        }
        return false
    }
    
    func setMusic(url: URL) {
        audioPlayer = AVPlayer(url: url)
        audioPlayer?.volume = 0.3
        play()
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func pause() {
        audioPlayer?.pause()
    }
    
    func changePlayerState() {
        if playerStateIsPaused {
            play()
        } else {
            pause()
        }
    }
}
