//
//  LogInvoker.swift
//  XOgame
//
//  Created by Oxana Lobysheva on 17/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

internal final class LogInvoker {
    
    internal static let shared = LogInvoker()
    
    private let logger = Logger()
    private let batchSize = 10
    private var commands: [LogCommand] = []
    
    internal func addLogCommand(_ command: LogCommand) {
        self.commands.append(command)
        self.executeCommandIfNeeded()
    }
    
    private func executeCommandIfNeeded() {
        guard self.commands.count >= batchSize else { return }
        self.commands.forEach {
            self.logger.writeMessageToLog($0.logMessage)
            self.commands = []
        }
    }
}
