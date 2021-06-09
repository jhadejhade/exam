//
//  API.swift
//  Exam
//
//  Created by Jade Lapuz on 6/09/21.
//

import Foundation

enum BaseUrl: String {
    case prod = "api.football-data.org"
}

struct API {

    typealias Parameters = [String: Any]
    var path: String
    var queryItems: [URLQueryItem]
    var urlType: BaseUrl
    var method: HTTPMethod

    init(path: AppEndpoints, queryParams: Parameters = [:], urlType: BaseUrl = .prod) {
        self.path = path.path
        self.queryItems = queryParams.toURLQueryItem()
        self.urlType = urlType
        self.method = path.method
    }
}
