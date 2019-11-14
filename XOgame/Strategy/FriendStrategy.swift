//
//  FriendStrategy.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import UIKit

final class FriendStrategy: SetPlayerStrategy {
   
    func playerAction(_ gameboard: GameboardView, touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchLocation = touches.first?.location(in: gameboard) else { return }
        let position = GameboardPosition(column: gameboard.determineColumn(for: touchLocation),
                                         row: gameboard.determineRow(for: touchLocation))
        gameboard.onSelectPosition?(position)
        guard let id = Game.shared.game.aiMoveVariants.firstIndex(of: [position.column,position.row]) else { return }
        Game.shared.game.aiMoveVariants.remove(at: id)
    }

    
}
