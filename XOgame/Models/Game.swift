//
//  Game.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

final class Game {
    
    var game: GameSession = GameSession()
    
    var isAiTurn: Bool {
        get {
            if game.currentPlayer.value == .ai {
                return true
            }
            return false
        }
    }
    
    static let shared = Game()
    
}
