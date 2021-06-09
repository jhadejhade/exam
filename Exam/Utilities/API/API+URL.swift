//
//  API+URL.swift
//  Exam
//
//  Created by Jade Lapuz on 6/09/21.
//

import Foundation

extension API {

    private struct K {
        static let scheme = "https"
        static let invalidURL = "Invalid URL Components: %@"
    }

    var url: URL {
        var components = URLComponents()
        components.scheme = K.scheme
        components.host = urlType.rawValue
        components.path = path
        components.queryItems = queryItems.count == 0 ? [] : queryItems

        guard let url = components.url else {
            preconditionFailure(String(format: K.invalidURL, components.description))
        }

        return url
    }

    var headers: [String: Any] {
        // Add Common Headers here
        return [
            "Content-Type": "application/json",
            "X-Auth-Token": "fd0f2b18e89a45d481f1ce20e35e4ebb"]
    }
}
