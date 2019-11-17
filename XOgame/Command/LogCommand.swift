//
//  LogCommand.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 17/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

class LogCommand {
    
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        switch self.action {
        case .playerInput(let player, let position):
            return "\(player) placed mark at \(position)"
        case .gameFinished(let winner):
            if let winner = winner {
                return "\(winner) won game"
            } else {
                return "no winner"
            }
        case .restartGame:
            return "game restarted"
        }
    }
}
