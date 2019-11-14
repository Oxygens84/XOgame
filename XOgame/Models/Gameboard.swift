//
//  Gameboard.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 13/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

public final class Gameboard {
    
    private lazy var positions: [[Player?]] = initialPositions()
    
    public func setPlayer(_ player: Player, at position: GameboardPosition){
        positions[position.column][position.row] = player
    }
    
    public func clear(){
        self.positions = initialPositions()
    }
    
    public func contains(player: Player, at positions: [GameboardPosition]) -> Bool {
        for position in positions {
            guard contains (player: player, at: position) else {
                return false
            }
        }
        return true
    }
    
    public func contains(player: Player, at position: GameboardPosition) -> Bool {
        let (column, row) = (position.column, position.row)
        return positions[column][row] == player
    }
    
    private func initialPositions() -> [[Player?]] {
        var positions: [[Player?]] = []
        for _ in 0 ..< GameboardSize.columns {
            let rows = Array<Player?>(repeating: nil, count: GameboardSize.rows)
            positions.append(rows)
        }
        return positions
    }
}
