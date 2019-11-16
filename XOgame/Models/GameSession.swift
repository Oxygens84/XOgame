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
    var blindVariantsPlayer: [[Int]] = []
    var blindVariantsAi: [[Int]] = []
    
    init() {
        self.gameStrategy = .withFriend
        self.currentPlayer = Observable(.first)
        self.aiMoveVariants = fillMatrix()
        self.blindVariantsPlayer = []
        self.blindVariantsAi = fillBlindVariantsAi()
        print("\(blindVariantsAi)")
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
    
    private func fillBlindVariantsAi() -> [[Int]]{
        var source = fillMatrix()
        var res: [[Int]] = []
        for _ in 0..<6 {
            let randomId = Int.random(in: 0..<source.count)
            res.append(source[randomId])
            source.remove(at: randomId)
        }
        return res
    }
    
}
