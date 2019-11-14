//
//  PlayerInputState.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 13/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

public class PlayerInputState: GameState {
    
    public private(set) var isComplete = false
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameBoardView: GameboardView?
    public let player: Player
    private let observer = Observer()
    
    init(player: Player,
         gameViewController: GameViewController,
         gameboard: Gameboard,
         gameBoardView: GameboardView){
            self.player = player
            self.gameViewController = gameViewController
            self.gameboard = gameboard
            self.gameBoardView = gameBoardView
            Game.shared.game.currentPlayer.value = player
    }
    
    public func begin() {
        switch self.player {
        case .first:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = false
            self.gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second, .ai:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = true
            self.gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        self.gameViewController?.winnerLabel.isHidden = true
    }
    
    public func addMark(at Position: GameboardPosition) {
        guard let gameBoardView = self.gameBoardView,
            gameBoardView.canPlaceMarkView(at: Position) else { return}
        let markView: MarkView
        switch self.player {
        case .first:
            markView = XView()
        case .second, .ai:
            markView = OView()
        }
        
        self.gameboard?.setPlayer(self.player, at: Position)
        self.gameBoardView?.placeMarkView(markView, at: Position)
        self.isComplete = true
        self.gameViewController?.gameStrategyControl.isEnabled = false
            
    }
    
}
