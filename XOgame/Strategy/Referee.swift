//
//  Referee.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 13/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

class Referee {
    
    public let gameboard: Gameboard
    
    public private(set) lazy var winningCombinations: [[GameboardPosition]] = {
        var winningCombinations: [[GameboardPosition]] = []
        generateWinsByColumn(result: &winningCombinations)
        generateWinsByRow(result: &winningCombinations)
        generateWinLeftDiagonal(result: &winningCombinations)
        generateWinRightDiagonal(result:  &winningCombinations)
        return winningCombinations
    }()
    
    
    public init(gameboard: Gameboard){
        self.gameboard = gameboard
    }
    
    public func determineWinner() -> Player? {
        for player in Player.allCases {
            if doesPlayerHaveWinningCombination(player) {
                return player
            }
        }
        return nil
    }
    
    public func generateWinsByColumn(result: inout [[GameboardPosition]]) {
        var array: [GameboardPosition] = []
        for column in 0 ..< GameboardSize.columns {
            for row in 0 ..< GameboardSize.rows {
                array.append(GameboardPosition(column: column, row: row))
            }
            result.append(array)
            array = []
        }
    }
    
    public func generateWinsByRow(result: inout [[GameboardPosition]]) {
        var array: [GameboardPosition] = []
        for row in 0 ..< GameboardSize.rows {
            for column in 0 ..< GameboardSize.columns {
                array.append(GameboardPosition(column: column, row: row))
            }
            result.append(array)
            array = []
        }
    }
    
    private func generateWinLeftDiagonal(result: inout [[GameboardPosition]]) {
        guard GameboardSize.columns == GameboardSize.rows else { return }
        var array: [GameboardPosition] = []
        for i in 0 ..< GameboardSize.columns {
            array.append(GameboardPosition(column: i, row: i))
        }
        result.append(array)
    }
    
    private func generateWinRightDiagonal(result: inout [[GameboardPosition]]) {
        guard GameboardSize.columns == GameboardSize.rows else { return }
        var array: [GameboardPosition] = []
        for i in 0 ..< GameboardSize.rows {
            array.append(GameboardPosition(column: i, row: GameboardSize.rows - 1 - i))
        }
        result.append(array)
    }
    
    private func doesPlayerHaveWinningCombination(_ player: Player) -> Bool {
        for winningPositions in winningCombinations {
            if gameboard.contains(player: player, at: winningPositions) {
                return true
            }
        }
        return false
    }

}
