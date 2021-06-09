//
//  TeamsRequestManager.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation
import Combine

class TeamsRequestManager: TeamsRequestManagerProtocol {
    
    static let shared = TeamsRequestManager()
    
    private var requestManager: RequestManagerProtocol
    
    private init() {
        self.requestManager = RequestManager()
    }
    
    func getTeams() -> AnyPublisher<TeamResponse, ApiError> {
        let api = API(path: .getTeams)
        
        return requestManager.request(type: TeamResponse.self, api: api)
    }
    
    func getTeamDetails(id: Int) -> AnyPublisher<TeamDetailsResponse, ApiError> {
        let api = API(path: .getTeamDetails(id: id))
        
        return requestManager.request(type: TeamDetailsResponse.self, api: api)
    }
    
    func getTeamMatches(id: Int, limit: Int, status: Status = .finished) -> AnyPublisher<TeamMatchesResponse, ApiError> {
        let api = API(path: .getTeamMatches(id: id), queryParams: ["limit": limit, "status": status.rawValue])
        
        return requestManager.request(type: TeamMatchesResponse.self, api: api)
    }
}
