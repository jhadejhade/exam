//
//  CellEnums.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import Foundation

public enum TeamElementType: String {
    case teamsCell
    case squadCell
    case matchesCell
}

protocol TeamElementModel: class {
    var cellType: TeamElementType { get set}
}

protocol TeamElementCell: class {
    func configure(model: TeamElementModel)
    func setTeam(model: TeamElementModel)
}

extension TeamElementCell {
    func setTeam(model: TeamElementModel) {
    }
}

