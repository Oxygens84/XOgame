//
//  ArtificialIntelligenceStrategy.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import UIKit

final class ArtificialIntelligenceStrategy: SetPlayerStrategy {

    func playerAction(_ gameboard: GameboardView, touches: Set<UITouch>, with event: UIEvent?){
        if Game.shared.game.aiMoveVariants.count > 0 {
            let randomId = Int.random(in: 0..<Game.shared.game.aiMoveVariants.count)
            let move = Game.shared.game.aiMoveVariants[randomId]
            let position = GameboardPosition(column: move[0], row: move[1])
            Game.shared.game.aiMoveVariants.remove(at: randomId)
            gameboard.onSelectPosition?(position)
        }
    }
    
}
