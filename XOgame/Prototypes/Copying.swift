//
//  Copying.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 17/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    
    func copy() -> Self {
        return type(of: self).init(self)
    }
    
}
