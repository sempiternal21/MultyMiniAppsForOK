//
//  TikTakToeGame.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 06.09.2024.
//

import Foundation

class TikTakToeGame {
    // o - -1
    // x - 1
    private(set) var gameField: [Int] = [0,0,0,0,0,0,0,0,0]
    private(set) var nowGoZero = true
    
    func doHod(index: Int) {
        if gameField[index] != 0 {
            return
        }
        gameField[index] = self.nowGoZero ? -1 : 1
        nowGoZero = self.nowGoZero == true ? false : true
    }
    
    func checkIsWin() -> Bool {
        if(abs(gameField[0] + gameField[1] + gameField[2]) == 3
           || abs(gameField[0] + gameField[3] + gameField[6]) == 3
           || abs(gameField[6] + gameField[7] + gameField[8]) == 3
           || abs(gameField[2] + gameField[5] + gameField[8]) == 3
           || abs(gameField[0] + gameField[4] + gameField[8]) == 3
           || abs(gameField[2] + gameField[4] + gameField[6]) == 3
           || abs(gameField[3] + gameField[4] + gameField[5]) == 3
           || abs(gameField[1] + gameField[4] + gameField[7]) == 3){
            return true
        }
        return false
    }
    
    func resetGameState() {
        gameField = [0,0,0,0,0,0,0,0,0]
        nowGoZero = true
    }
    
    func getState() -> GameState {
        if self.gameField.filter({ $0 == 0}).count == 0 {
            return GameState.non
        }
        
        if checkIsWin() == true {
            if nowGoZero == true {
                return GameState.winCross
            } else {
                return GameState.winZero
            }
        }
        
        return GameState.inProgress
    }
}

enum GameState {
    case winZero, winCross, non, inProgress
}
