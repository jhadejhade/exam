//
//  Squad.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on June 9, 2021

import Foundation

class Squad: Codable, TeamElementModel {
    
    let countryOfBirth: String?
    let dateOfBirth: String?
    let id: Int?
    let name: String?
    let nationality: String?
    let position: String?
    let role: String?
    let shirtNumber: Int?
    
    var cellType: TeamElementType = .squadCell
    
    enum CodingKeys: String, CodingKey {
        case countryOfBirth = "countryOfBirth"
        case dateOfBirth = "dateOfBirth"
        case id = "id"
        case name = "name"
        case nationality = "nationality"
        case position = "position"
        case role = "role"
        case shirtNumber = "shirtNumber"
    }
}
