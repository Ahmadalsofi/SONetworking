//
//  ResponseRequestable.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//

import Foundation
public protocol ResponseRequestable: Requestable {
    associatedtype Response
    
    var responseDecoder: ResponseDecoder { get }
}
