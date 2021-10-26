//
//  Requestable.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//

import Foundation
public protocol Requestable {
    var path: String { get }
    var isFullPath: Bool { get }
    var method: HTTPMethodType { get }
    var headerParamaters: [String: String] { get }
    var queryParametersEncodable: Encodable? { get }
    var queryParameters: [String: Any] { get }
    var bodyParamatersEncodable: Encodable? { get }
    var bodyParamaters: [String: Any] { get }
    var bodyEncoding: BodyEncoding { get }
    
    func urlRequest(with networkConfig: NetworkConfigurable) throws -> URLRequest
}

extension Requestable {
    
    func url(with config: NetworkConfigurable) throws -> URL {
        
        let baseURL = config.baseURL.absoluteString.last != "/" ? config.baseURL.absoluteString + "/" : config.baseURL.absoluteString
        let endpoint = isFullPath ? path : baseURL.appending(path)
        
        guard var urlComponents = URLComponents(string: endpoint) else { throw RequestGenerationError.components }
        var urlQueryItems = [URLQueryItem]()
        
        let queryParameters = try queryParametersEncodable?.toDictionary() ?? self.queryParameters
        queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        config.queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
        guard let url = urlComponents.url else { throw RequestGenerationError.components }
        return url
    }
    
    public func urlRequest(with config: NetworkConfigurable) throws -> URLRequest {
        
        let url = try self.url(with: config)
        var urlRequest = URLRequest(url: url)
        var allHeaders: [String: String] = config.headers
        headerParamaters.forEach { allHeaders.updateValue($1, forKey: $0) }
        
        let bodyParamaters = try bodyParamatersEncodable?.toDictionary() ?? self.bodyParamaters
        if !bodyParamaters.isEmpty {
            urlRequest.httpBody = encodeBody(bodyParamaters: bodyParamaters, bodyEncoding: bodyEncoding)
        }
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = allHeaders
        return urlRequest
    }
    
    private func encodeBody(bodyParamaters: [String: Any], bodyEncoding: BodyEncoding) -> Data? {
        switch bodyEncoding {
        case .jsonSerializationData:
            return try? JSONSerialization.data(withJSONObject: bodyParamaters)
        case .stringEncodingAscii:
            return bodyParamaters.queryString.data(using: String.Encoding.ascii, allowLossyConversion: true)
        }
    }
}
