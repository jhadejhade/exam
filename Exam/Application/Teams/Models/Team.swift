//
//  Team.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on June 9, 2021

import Foundation

class Team: Codable, TeamElementModel {
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
    let tla: String?
    let venue: String?
    let website: String?
    
    var cellType: TeamElementType = .teamsCell
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case area = "area"
        case clubColors = "clubColors"
        case crestUrl = "crestUrl"
        case email = "email"
        case founded = "founded"
        case id = "id"
        case lastUpdated = "lastUpdated"
        case name = "name"
        case phone = "phone"
        case shortName = "shortName"
        case tla = "tla"
        case venue = "venue"
        case website = "website"
    }
}
