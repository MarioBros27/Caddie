//
//  LiveScoreTableViewController.swift
//  Caddie
//
//  Created by Andres on 11/19/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class LiveScoreTableViewController: UITableViewController {

    @IBOutlet var tableViewConn: UITableView!
    var gameResults = [Game]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableViewConn.tableFooterView = UIView(frame: CGRect.zero)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gameResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "LiveScoreTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LiveScoreTableViewCell
        cell.team1Label.text = gameResults[indexPath.row].team1.name
        cell.team2Label.text = gameResults[indexPath.row].team2.name
        cell.scoreTeam1Label.text = "\( gameResults[indexPath.row].scoreTeam1)"
        cell.scoreTeam2Label.text = "\( gameResults[indexPath.row].scoreTeam2)"

        // Configure the cell...

        return cell
    }
 
}
