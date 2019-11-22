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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
