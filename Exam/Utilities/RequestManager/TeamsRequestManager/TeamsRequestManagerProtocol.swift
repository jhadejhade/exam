//
//  TeamsRequestManagerProtocol.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation
import Combine

protocol TeamsRequestManagerProtocol {
    func getTeams() -> AnyPublisher<TeamResponse, ApiError>
    func getTeamDetails(id: Int) -> AnyPublisher<TeamDetailsResponse, ApiError>
    func getTeamMatches(id: Int, limit: Int, status: Status) -> AnyPublisher<TeamMatchesResponse, ApiError>
}
