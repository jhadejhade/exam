//
//  TeamsViewController.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import UIKit

class TeamsViewController: BaseViewController {
    
    private struct K {
        static let storyboardId = "TeamsViewController"
        static let teamCell = "TeamTableViewCell"
    }
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: TeamsViewModelProtocol!
    
    override class var storyboardID: String? {
        return K.storyboardId
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewsAndDelegates()
        getData()
    }
    
    override func retry() {
        getData()
    }
    
    private func setUpViewsAndDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.teamCell, bundle: nil), forCellReuseIdentifier: TeamElementType.teamsCell.rawValue)
        
        self.title = "Teams"
    }
    
    private func getData() {
        activityIndicator.startAnimating()
        
        viewModel.getTeams { [weak self] in
            guard let self = self else {
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        } failure: { [weak self] (errorMessage) in
            guard let self = self else {
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.showErrorView(message: errorMessage)
        }
    }
}

extension TeamsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = viewModel.teams[indexPath.row]
        
        let cellIdentifier = team.cellType.rawValue
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamElementCell, let tableCell = cell as?  UITableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: team)
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamDetails = TeamDetailsFactory.makeTeamDetailsViewController(team: viewModel.teams[indexPath.row])
        
        navigationController?.pushViewController(teamDetails, animated: true)
    }
}
