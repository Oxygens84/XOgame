//
//  GameState.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 13/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

public protocol GameState {
    
    var isComplete: Bool { get }
    
    func begin()
    
    func addMark(at position: GameboardPosition)
}
