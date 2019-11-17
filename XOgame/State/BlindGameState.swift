//
//  BlindGameState.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

public class BlindGameState: GameState {
    
    public private(set) var isComplete = false
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameBoardView: GameboardView?
    public let player: Player
    private let observer = Observer()
    private let markViewPrototype: MarkView
    
    init(player: Player,
         gameViewController: GameViewController,
         gameboard: Gameboard,
         gameBoardView: GameboardView,
         markViewPrototype: MarkView){
        self.player = player
        self.gameViewController = gameViewController
        self.gameboard = gameboard
        self.gameBoardView = gameBoardView
        self.markViewPrototype = markViewPrototype
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
        if Game.shared.game.blindVariantsPlayer.count < GameboardSize.blindLimit {
            //let markView: MarkView
            //markView = XView()
            self.gameboard?.setPlayer(self.player, at: Position)
            self.gameBoardView?.placeMarkView(self.markViewPrototype.copy(), at: Position)
            self.gameViewController?.gameStrategyControl.isEnabled = false
            Game.shared.game.blindVariantsPlayer.append([Position.column, Position.row])
            if Game.shared.game.blindVariantsPlayer.count == GameboardSize.blindLimit {
                self.isComplete = true
            }            
        }
    }
    
}
