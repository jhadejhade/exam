//
//  TeamDetailsViewModelProtocol.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation

protocol TeamDetailsViewModelProtocol {
    var currentFilter: Status { get }
    var teamDetails: TeamDetailsResponse? { get }
    var team: Team { get }
    var teamMatches: [Match] { get }
    var filteredSquad: [Squad] { get }
    func getMatches(filterBy: Status, _ id: Int, completion: @escaping () -> (), failure: @escaping (String) -> ())
    func getTeamDetails(completion: @escaping () -> (), failure: @escaping (String) -> ())
}
