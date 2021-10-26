//
//  NetworkSessionManager.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//


import Foundation

public protocol NetworkSessionManager {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    func request(_ request: URLRequest,
                 completion: @escaping CompletionHandler) -> NetworkCancellable
}

// MARK: - Default Network Session Manager
// Note: If authorization is needed NetworkSessionManager can be implemented by using,
// for example, Alamofire SessionManager with its RequestAdapter and RequestRetrier.
// And it can be injected into NetworkService instead of default one.

public class DefaultNetworkSessionManager: NetworkSessionManager {
    public init() {}
    public func request(_ request: URLRequest,
                        completion: @escaping CompletionHandler) -> NetworkCancellable {
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
}
