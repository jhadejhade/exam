//
//  TeamDetailsResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on June 9, 2021

import Foundation

class TeamDetailsResponse: Codable {
    
    let activeCompetitions: [ActiveCompetition]?
    let address: String?
    let area: Area?
    let clubColors: String?
    let crestUrl: String?
    let email: String?
    let founded: Int?
    let id: Int?
    let lastUpdated: String?
    let name: String?
    let phone: String?
    let shortName: String?
    let squad: [Squad]
    let tla: String?
    let venue: String?
    let website: String?
}
