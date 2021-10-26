//
//  DataTransferErrorLogger.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//

import Foundation

public protocol DataTransferErrorLogger {
    func log(error: Error)
}

// MARK: - Logger
public final class DefaultDataTransferErrorLogger: DataTransferErrorLogger {
    public init() { }
    
    public func log(error: Error) {
        printIfDebug("-------------")
        printIfDebug("\(error)")
    }
}


