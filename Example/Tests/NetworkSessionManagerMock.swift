//
//  NetworkSessionManagerMock.swift
//  SONetworking_Example
//
//  Created by Ahmad AlSofi on 26/10/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SONetworking
struct NetworkSessionManagerMock: NetworkSessionManager {
    let response: HTTPURLResponse?
    let data: Data?
    let error: Error?
    
    func request(_ request: URLRequest,
                 completion: @escaping CompletionHandler) -> NetworkCancellable {
        completion(data, response, error)
        return URLSessionDataTask()
    }
}
