//
//  PlayerAiState.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

public class PlayerAiState: GameState {
    
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
        self.gameViewController?.firstPlayerTurnLabel.isHidden = true
        self.gameViewController?.secondPlayerTurnLabel.isHidden = false
        self.gameViewController?.winnerLabel.isHidden = true
    }
    
    public func addMark(at Position: GameboardPosition) {
        Log(.playerInput(player: self.player, position: Position))
        guard let gameBoardView = self.gameBoardView,
            gameBoardView.canPlaceMarkView(at: Position) else { return}
        //let markView = OView()
        self.gameboard?.setPlayer(self.player, at: Position)
        self.gameBoardView?.placeMarkView(self.markViewPrototype.copy(), at: Position)
        self.isComplete = true
        self.gameViewController?.gameStrategyControl.isEnabled = false
        
    }
    
}
