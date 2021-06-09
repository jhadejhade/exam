//
//  TeamsViewModel.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation

protocol TeamsViewModelProtocol {
    var teams: [Team] { get }
    func getTeams(completion: @escaping () -> (), failure: @escaping (String) -> ())
}
