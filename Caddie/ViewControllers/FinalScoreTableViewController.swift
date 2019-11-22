//
//  FinalScoreTableViewController.swift
//  Caddie
//
//  Created by Andres on 11/20/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class FinalScoreTableViewController: UITableViewController {

    
    @IBOutlet var mainTableView: UITableView!
    var gameResults = [Game]()
    
    override func viewDidLoad() {
        mainTableView.tableFooterView = UIView(frame: CGRect.zero)

        super.viewDidLoad()

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
        let identifier = "FinalScoreTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FinalScoreTableViewCell
        cell.team1Label.text = gameResults[indexPath.row].team1.name
        cell.team2Label.text = gameResults[indexPath.row].team2.name
        cell.scoreTeam1Label.text = "\( gameResults[indexPath.row].scoreTeam1)"
        cell.scoreTeam2Label.text = "\( gameResults[indexPath.row].scoreTeam2)"
        

        // Configure the cell...

        return cell
    }
    
    //MARK: Actions
    
    @IBAction func okayHasBeenPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "HomeIdentifier", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
