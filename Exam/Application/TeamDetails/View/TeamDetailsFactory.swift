//
//  TeamDetailsFactory.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation

struct TeamDetailsFactory {
    
    static func makeTeamDetailsViewController(team: Team) -> TeamDetailsViewController {
        let teamDetails = TeamDetailsViewController.instantiateFromStoryboard()
        teamDetails.viewModel = TeamDetailsViewModel(requestManager: TeamsRequestManager.shared, team: team)
        return teamDetails
    }
}
