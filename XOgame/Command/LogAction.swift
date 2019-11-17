//
//  LogAction.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 17/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

public enum LogAction {
    case playerInput(player: Player, position: GameboardPosition)
    case gameFinished(winner: Player?)
    case restartGame
}

public func Log(_ action: LogAction){
    let command = LogCommand(action: action)
    LogInvoker.shared.addLogCommand(command)
}
