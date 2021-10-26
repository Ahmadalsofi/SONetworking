//
//  URLRequest.swift
//  SONetworking
//
//  Created by Ahmad AlSofi on 26/10/2021.
//

import Foundation

// MARK: - URLRequest extension
extension URLRequest {
    /// print curl command for request
    var curlCommand: String {
        var curlCmd = "curl -v "
        curlCmd += "-X \(self.httpMethod ?? "GET") \\\n"
        curlCmd += "    \"\(self.url?.absoluteString ?? "URL")\" \\\n"
        for (header, value) in self.allHTTPHeaderFields ?? [:] {
            curlCmd += "    -H \"\(header): \(value)\" \\\n"
        }
        if (self.httpMethod == "POST" || self.httpMethod == "PUT" || self.httpMethod == "PATCH") &&
            self.httpBody != nil,
           var json = String(data: self.httpBody ?? Data(), encoding: .utf8) {
            json = json.replacingOccurrences(of: " ", with: "")
            curlCmd += "    -d \'\(json)\' \\\n"
        }
        if let lastBackslashRange = curlCmd.range(of: "\\", options: .backwards) {
            curlCmd = curlCmd.replacingCharacters(in: lastBackslashRange, with: "")
        }
        return curlCmd
    }
}
