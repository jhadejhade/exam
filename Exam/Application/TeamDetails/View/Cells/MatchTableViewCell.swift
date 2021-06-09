//
//  MatchTableViewCell.swift
//  Exam
//
//  Created by Jade Lapuz on 6/10/21.
//

import UIKit

class MatchTableViewCell: UITableViewCell, TeamElementCell {

    @IBOutlet private var competitionImage: UIImageView!
    @IBOutlet private var leaguNameLabel: UILabel!
    @IBOutlet private var enemyTeamLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    private var team: Team?
    
    func configure(model: TeamElementModel) {
        guard let matchModel = model as? Match else {
            return
        }
        
        leaguNameLabel.text = matchModel.competition?.name
        dateLabel.text = matchModel.utcDate?.toFormattedDate()
        
        if let teamModel = team {
            if matchModel.awayTeam?.id == teamModel.id {
                enemyTeamLabel.text = String(format: "VS. %@", matchModel.homeTeam?.name ?? "NA")
            } else {
                enemyTeamLabel.text = String(format: "VS. %@", matchModel.awayTeam?.name ?? "NA")
            }
        } else {
            leaguNameLabel.text = "NA"
        }
        
        guard let imageUrlString = matchModel.competition?.area?.ensignUrl, let imageUrl = URL(string: imageUrlString)  else {
            return
        }
        
        competitionImage.downloadedSvg(from: imageUrl)
    }
    
    func setTeam(model: TeamElementModel) {
        guard let teamModel = model as? Team else {
            return
        }
        
        team = teamModel
    }
}
