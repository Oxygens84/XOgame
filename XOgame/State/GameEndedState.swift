//
//  GameEndedState.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

class GameEndedState: GameState{
    
    public let isComplete: Bool = false
    public let winner: Player?
    
    private(set) weak var gameViewController: GameViewController?
    
    init(winner: Player?, gameViewController: GameViewController) {
        self.winner = winner
        self.gameViewController = gameViewController
    }
    
    func begin() {
        self.gameViewController?.winnerLabel.isHidden = false
        self.gameViewController?.gameStrategyControl.isEnabled = true
        if let winner = winner {
            self.gameViewController?.winnerLabel.text = self.winnerNamer(from: winner) + " won"
        } else {
            self.gameViewController?.firstPlayerTurnLabel.isHidden = true
            self.gameViewController?.secondPlayerTurnLabel.isHidden = true
        }
    }
    
    func addMark(at position: GameboardPosition) {
    }
    
    private func winnerNamer(from winner: Player) -> String {
        switch winner {
        case .first:
            return "1st player"
        case .second, .ai:
            return Game.shared.game.gameStrategy.getOpponentName()
        }
    }
    
}
