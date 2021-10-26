//
//  NetworkConfigurableMock.swift
//  SONetworking_Example
//
//  Created by Ahmad AlSofi on 26/10/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SONetworking
class NetworkConfigurableMock: NetworkConfigurable {
    var baseURL: URL = URL(string: "https://mock.test.com")!
    var headers: [String: String] = [:]
    var queryParameters: [String: String] = [:]
}
