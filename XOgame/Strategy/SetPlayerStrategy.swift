//
//  SetPlayerStrategy.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 14/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import UIKit

protocol SetPlayerStrategy {
    
    func playerAction(_ gameboard: GameboardView, touches: Set<UITouch>, with event: UIEvent?)
    
}

