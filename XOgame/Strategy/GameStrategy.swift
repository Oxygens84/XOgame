//
//  GameStrategy.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

enum GameStrategy: Int {
    
    case withFriend = 0
    case withAI = 1
    case withAIBlindly = 2
    
    func index() -> Int {
        return self.rawValue
    }
    
    func getOpponentName() -> String {
        switch self {
        case .withFriend:
            return "My friend"
        case .withAI, .withAIBlindly:
            return "AI"
        }
    }
}
