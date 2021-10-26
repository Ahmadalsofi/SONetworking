//
//  DataTransferErrorResolver.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//

import Foundation

public protocol DataTransferErrorResolver {
    func resolve(error: NetworkError) -> Error
}

// MARK: - Error Resolver
public class DefaultDataTransferErrorResolver: DataTransferErrorResolver {
    public init() { }
    public func resolve(error: NetworkError) -> Error {
        return error
    }
}
