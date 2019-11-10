//
//  TeamsKindTableViewController.swift
//  Caddie
//
//  Created by Andres on 11/10/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class TeamsKindTableViewController: UITableViewController {
    
    var course: Course?
    var teamsSize: Int?
    var teamsNumber: Int?
    enum Combinations: String{
        case _2vs2 = "2vs2"
        case _2vs2vs2 = "2vs2vs2"
        case _2vs2vs2vs2 = "2vs2vs2vs2"
        case _3vs3 = "3vs3"
        case _3vs3vs3 = "3vs3vs3"
        case _4vs4 = "4vs4"
    }
    let combinationTexts = ["2vs2","2vs2vs2","2vs2vs2vs2","3vs3","3vs3vs3","4vs4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = course?.name
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        assignValues (combValue: TeamsKindTableViewController.Combinations(rawValue: combinationTexts[indexPath.row])!)
         performSegue(withIdentifier: "configureTeamsIdentifier", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Prepare for segue that shows configureTeamsTableViewController
        let destinationConfigureTeams = segue.destination as! ConfigureTeamsTableViewController
        destinationConfigureTeams.teamsNumber = teamsNumber
        destinationConfigureTeams.teamsSize = teamsSize
        destinationConfigureTeams.course = course
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return combinationTexts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TeamsKindTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamsKindTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        
        // Configure the cell...
        let option = combinationTexts[indexPath.row]
        cell.teamKindTextField.text = option
        
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
    func assignValues(combValue: Combinations){
        switch combValue{
        case ._2vs2:
            teamsSize = 2
            teamsNumber = 2
        case ._2vs2vs2:
            teamsSize = 2
            teamsNumber = 3
        case ._2vs2vs2vs2:
            teamsSize = 2
            teamsNumber = 4
        case ._3vs3:
            teamsSize = 3
            teamsNumber = 3
        case ._3vs3vs3:
            teamsSize = 3
            teamsNumber = 3
        case ._4vs4:
            teamsSize = 4
            teamsNumber = 4
        }
    }
}
