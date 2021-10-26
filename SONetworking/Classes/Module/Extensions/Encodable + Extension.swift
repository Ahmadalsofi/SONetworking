//
//  Encodable + Extension.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//

import Foundation
extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let josnData = try JSONSerialization.jsonObject(with: data)
        return josnData as? [String : Any]
    }
}
