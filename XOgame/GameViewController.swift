//
//  ViewController.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 13/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    @IBAction func restartButtonTapped(_ sender: UIButton){}
    
    private let gameboard = Gameboard()
    private var currentState: GameState!{
        didSet {
            self.currentState.begin()
        }
    }
    
    private lazy var referee = Referee(gameboard: gameboard)

    private func goToFirstState(){
        self.currentState = PlayerInputState(player: .first,
                                             gameViewController: self,
                                             gameboard: gameboard,
                                             gameBoardView: gameboardView)
    }
    private func goToNextState(){
        if let winner = self.referee.determineWinner(){
            self.currentState = GameEndedState(winner: winner,
                                               gameViewController: self)
        }
        if let playerInputState = currentState as? PlayerInputState {
            self.currentState = PlayerInputState(player: playerInputState.player.next,
                                                 gameViewController: self,
                                                 gameboard: gameboard,
                                                 gameBoardView: gameboardView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goToFirstState()
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            self.currentState.addMark(at: position)
            if self.currentState.isComplete{
                self.goToNextState()
            }
            //self.gameboardView.placeMarkView(XView(), at: position)
        }
    }


}

