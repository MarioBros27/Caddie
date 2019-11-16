//
//  PlayGameTableViewController.swift
//  Caddie
//
//  Created by Andres on 11/11/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class PlayGameTableViewController: UITableViewController {
    var course: Course?
    var teamsSize: Int?
    var teamsNumber: Int?
    var teams = [Team]()

    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
//        mainTableView.tableFooterView = UIView(frame: CGRect.zero)

        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        print("Course: "+(course?.name)!)
//        print("team size: \(teamsSize!) and teams number: \(teamsNumber!)")
//        for team in teams{
//            print("team: \(team.name) and count of players :\(team.players.count)")
//        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        assignValues (combValue: TeamsKindTableViewController.Combinations(rawValue: combinationTexts[indexPath.row])!)
//        performSegue(withIdentifier: "configureTeamsIdentifier", sender: self)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //Prepare for segue that shows configureTeamsTableViewController
//        let destinationConfigureTeams = segue.destination as! ConfigureTeamsViewController
//        destinationConfigureTeams.teamsNumber = teamsNumber
//        destinationConfigureTeams.teamsSize = teamsSize
//        destinationConfigureTeams.course = course
//        destinationConfigureTeams.currentTeamN = 1
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return teamsNumber ?? 5
        return 4
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return teams[section].name
        return "test"
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 14, width: 320, height: 20)
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myLabel.text = "Test 2"
        
        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        return headerView
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return teamsSize ?? 5
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PlayGameTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayGameTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        
        // Configure the cell...
//        let tempTeamSize = 3
//        if(teamsSize == 2){
//            tableView.rowHeight = 430
//        }
//        if(teamsSize == 3){
//            tableView.rowHeight = 630
//        }
        cell.selectionStyle = .none
        
        
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
