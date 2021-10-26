//
//  NetworkErrorLogger.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//
import Foundation


public protocol NetworkErrorLogger {
    var  logEnabled: Bool {get set}
    func log(request: URLRequest)
    func log(responseData data: Data?, response: URLResponse?)
    func log(error: Error)
}

public final class DefaultNetworkErrorLogger: NetworkErrorLogger {
    public var logEnabled: Bool = true
    
    public init() { }
    
    public func log(request: URLRequest) {
        if !logEnabled {return}
        printIfDebug("######################################### request ############################################")
        printIfDebug(request.curlCommand)
        printIfDebug("######################################################################")
    }
    
    public func log(responseData data: Data?, response: URLResponse?) {
        if !logEnabled {return}
        guard let data = data else { return }
        if let jSONString = String(data: data, encoding: String.Encoding.utf8) {
            printIfDebug("######################################### responseData ############################################")
            printIfDebug("\(jSONString)")
            printIfDebug("######################################################################")
        }
    }
    
    public func log(error: Error) {
        if !logEnabled {return}
        printIfDebug("\(error)")
    }
}

func printIfDebug(_ string: String) {
    #if DEBUG
    print(string)
    #endif
}
