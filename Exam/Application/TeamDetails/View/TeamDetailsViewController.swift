//
//  TeamDetailsViewController.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import UIKit

class TeamDetailsViewController: BaseViewController {

    private struct K {
        static let storyboardId = "TeamDetailsViewController"
        static let matchesCell = "MatchTableViewCell"
        static let squalCell = "SquadTableViewCell"
    }
    
    @IBOutlet private var teamContainerView: UIView!
    @IBOutlet private var teamAliasLabel: UILabel!
    @IBOutlet private var teamNameLabel: UILabel!
    @IBOutlet private var teamCrestImage: UIImageView!
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: TeamDetailsViewModelProtocol! {
        didSet {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(filterTapped))
        }
    }
    
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
    
    @objc private func filterTapped() {
        let actionSheet = UIAlertController(title: "Filter matches by", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Upcoming", style: .default, handler: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.getMatches(status: .scheduled)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancelled", style: .default, handler: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.getMatches(status: .canceled)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Postponed", style: .default, handler: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.getMatches(status: .postponed)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Suspended", style: .default, handler: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.getMatches(status: .suspened)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Finished", style: .default, handler: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.getMatches(status: .finished)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Paused", style: .default, handler: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.getMatches(status: .paused)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "In Play", style: .default, handler: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.getMatches(status: .inplay)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    private func setUpViewsAndDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.matchesCell, bundle: nil), forCellReuseIdentifier: TeamElementType.matchesCell.rawValue)
        tableView.register(UINib(nibName: K.squalCell, bundle: nil), forCellReuseIdentifier: TeamElementType.squadCell.rawValue)
        
        self.title = "Team Details"
        
        teamContainerView.makeElevation(elevation: 10)
        teamNameLabel.text = viewModel.team.name
        teamAliasLabel.text = viewModel.team.tla
        
        guard let imageUrlString = viewModel.team.crestUrl, let imageUrl = URL(string: imageUrlString)  else {
            return
        }
        
        teamCrestImage.downloadedSvg(from: imageUrl)
    }

    private func getData() {
        activityIndicator.startAnimating()
        
        viewModel.getTeamDetails { [weak self] in
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
    
    private func getMatches(status: Status) {
        guard let id = viewModel.team.id else {
            return
        }
        
        activityIndicator.startAnimating()
        
        viewModel.getMatches(filterBy: status, id) { [weak self] in
            guard let self = self else {
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.tableView.reloadSections([0], with: .automatic)
        } failure: { [weak self] (errorMessage) in
            guard let self = self else {
                return
            }
            
            self.activityIndicator.stopAnimating()
        }
    }
}

extension TeamDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 1:
            return viewModel.filteredSquad.count
        default:
            return viewModel.teamMatches.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.section {
        case 1:
            let player = viewModel.filteredSquad[indexPath.row]
            let cellIdentifier = player.cellType.rawValue
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamElementCell, let tableCell = cell as?  UITableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(model: player)
            
            return tableCell
        default:
            let match = viewModel.teamMatches[indexPath.row]
            let cellIdentifier = match.cellType.rawValue
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamElementCell, let tableCell = cell as?  UITableViewCell else {
                return UITableViewCell()
            }
            
            cell.setTeam(model: viewModel.team)
            cell.configure(model: match)
            
            return tableCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Squad Members"
        default:
            let matchType = viewModel.currentFilter.rawValue.lowercased() == "scheduled" ? "Upcoming" : viewModel.currentFilter.rawValue
            return "This team has \(viewModel.teamMatches.count) \(matchType.replacingOccurrences(of: "_", with: " ")) Matches"
        }
    }
}
