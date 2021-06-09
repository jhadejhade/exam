//
//  TeamDetailsViewModel.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation
import Combine

class TeamDetailsViewModel: TeamDetailsViewModelProtocol {
    
    private(set) var currentFilter: Status = .scheduled
    private(set) var team: Team
    private(set) var teamDetails: TeamDetailsResponse?
    private(set) var filteredSquad: [Squad] = []
    private(set) var teamMatches: [Match] = []
    private var requestManager: TeamsRequestManagerProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(requestManager: TeamsRequestManagerProtocol, team: Team) {
        self.requestManager = requestManager
        self.team = team
    }
    
    func getTeamDetails(completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        guard let id = team.id else {
            return
        }
        
        requestManager.getTeamDetails(id: id).sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                failure("Something went wrong. Please try again.")
            case .finished:
                break
            }
        }, receiveValue: { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.teamDetails = result
            self.filteredSquad = result.squad.filter({ $0.role?.lowercased() == "player" })
            self.getMatches(filterBy: .scheduled, id, completion: completion, failure: failure)
        }).store(in: &cancellables)
    }
    
    func getMatches(filterBy: Status, _ id: Int, completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        
        currentFilter = filterBy
        requestManager.getTeamMatches(id: id, limit: 10, status: filterBy).sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                failure("Something went wrong. Please try again.")
            case .finished:
                break
            }
        }, receiveValue: { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.teamMatches = result.matches
            completion()
        }).store(in: &cancellables)
    }
}
