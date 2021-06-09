//
//  SquadTableViewCell.swift
//  Exam
//
//  Created by Jade Lapuz on 6/10/21.
//

import UIKit

class SquadTableViewCell: UITableViewCell, TeamElementCell {
    
    @IBOutlet private var jerseyLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var positionLabel: UILabel!
    @IBOutlet private var nationalityLabel: UILabel!
    
    func configure(model: TeamElementModel) {
        guard let squadModel = model as? Squad else {
            return
        }
        
        jerseyLabel.text = squadModel.shirtNumber?.description
        nameLabel.text = squadModel.name
        positionLabel.text = squadModel.position
        nationalityLabel.text = squadModel.nationality
    }
}
