//
//  TeamsViewModel.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation
import Combine

class TeamsViewModel: TeamsViewModelProtocol {
 
    private(set) var teams: [Team] = []
    private var requestManager: TeamsRequestManagerProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(requestManager: TeamsRequestManager) {
        self.requestManager = requestManager
    }
    
    func getTeams(completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        
        requestManager.getTeams().sink(receiveCompletion: { (completion) in
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
            
            self.teams = result.teams
            completion()
        }).store(in: &cancellables)
    }
}
