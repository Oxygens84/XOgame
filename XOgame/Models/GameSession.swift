//
//  GameSession.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

class GameSession {
    
    var gameStrategy: GameStrategy
    var currentPlayer: Observable<Player>
    var aiMoveVariants: [[Int]] = []
    
    init() {
        self.gameStrategy = .withFriend
        self.currentPlayer = Observable(.first)
        self.aiMoveVariants = fillMatrix()
        print("\(self.aiMoveVariants)")
    }
    
    private func fillMatrix() -> [[Int]]{
        var res: [[Int]] = []
        for i in 0..<GameboardSize.columns {
            for j in 0..<GameboardSize.rows {
                res.append([i,j])
            }
        }
        return res
    }
    
}
