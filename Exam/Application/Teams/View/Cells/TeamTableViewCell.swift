//
//  TeamTableViewCell.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import UIKit

class TeamTableViewCell: UITableViewCell, TeamElementCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var teamEmailLabel: UILabel!
    @IBOutlet var teamPhoneLabel: UILabel!
    @IBOutlet var teamVenueLabel: UILabel!
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var teamCrestImage: UIImageView!
   
    func configure(model: TeamElementModel) {
        guard let teamModel = model as? Team else {
            return
        }
        
        containerView.makeElevation(elevation: 5)
        teamEmailLabel.text = teamModel.email
        teamPhoneLabel.text = teamModel.phone
        teamVenueLabel.text = teamModel.venue
        teamNameLabel.text = String(format: "%@ (%@)", teamModel.name ?? "", teamModel.tla ?? "")
        
        guard let imageUrlString = teamModel.crestUrl, let imageUrl = URL(string: imageUrlString)  else {
            return
        }
        
        teamCrestImage.downloadedSvg(from: imageUrl)
    }
}
