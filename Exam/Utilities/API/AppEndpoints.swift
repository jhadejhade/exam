//
//  AppEndpoints.swift
//  Exam
//
//  Created by Jade Lapuz on 6/09/21.
//

import Foundation

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

enum AppEndpoints {
    
    case getTeams
    case getTeamDetails(id: Int)
    case getTeamMatches(id: Int)
    
    var path: String {
        switch self {
        case .getTeams:
            return "/v2/teams"
        case .getTeamDetails(let id):
            return String(format: "/v2/teams/%@", id.description)
        case .getTeamMatches(let id):
            return String(format: "/v2/teams/%@/matches", id.description)
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
}
