//
//  Match.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on June 9, 2021

import Foundation

class Match: Codable, TeamElementModel {
    
    let awayTeam: AwayTeam?
    let competition: Competition?
    let group: String?
    let homeTeam: HomeTeam?
    let id: Int?
    let lastUpdated: String?
    let matchday: Int?
    let odds: Odd?
    let referees: [Referee]?
    let score: Score?
    let season: Season?
    let stage: String?
    let status: String?
    let utcDate: String?
    
    var cellType: TeamElementType = .matchesCell
    
    enum CodingKeys: String, CodingKey {
        case awayTeam = "awayTeam"
        case competition = "competition"
        case group = "group"
        case homeTeam = "homeTeam"
        case id = "id"
        case lastUpdated = "lastUpdated"
        case matchday = "matchday"
        case odds = "odds"
        case referees = "referees"
        case score = "score"
        case season = "season"
        case stage = "stage"
        case status = "status"
        case utcDate = "utcDate"
    }
}
