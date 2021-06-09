//
//  TeamsFactory.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation

struct TeamsFactory {
    
    static func makeTeamsViewController() -> TeamsViewController {
        let teamsController = TeamsViewController.instantiateFromStoryboard()
        teamsController.viewModel = TeamsViewModel(requestManager: TeamsRequestManager.shared)
        return teamsController
    }
}
