//
//  Player.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 13/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

public enum Player: CaseIterable {
    
    case first
    case second
    case ai
    
    var markViewPrototype: MarkView {
        switch self {
            case .first:
                return XView()
            case .second, .ai:
                return OView()
        }
    }
    
    var next: Player {
        switch (self,Game.shared.game.gameStrategy) {
            case (.first, .withFriend):
                return .second
            case (.second, .withFriend):
                return .first
            case (.first, .withAI):
                return .ai
            case (.ai, .withAI):
                return .first
            default:
                return .first
        }
        
    }
}
