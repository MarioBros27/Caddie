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
    
    
    @IBOutlet var tableViewConn: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("holes: \(course!.holes.count)")

        tableViewConn.tableFooterView = UIView(frame: CGRect.zero)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        assignValues (combValue: TeamsKindTableViewController.Combinations(rawValue: combinationTexts[indexPath.row])!)
         performSegue(withIdentifier: "configureTeamsIdentifier", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Prepare for segue that shows configureTeamsTableViewController
        let destinationConfigureTeams = segue.destination as! ConfigureTeamsViewController
        destinationConfigureTeams.teamsNumber = teamsNumber
        destinationConfigureTeams.teamsSize = teamsSize
        destinationConfigureTeams.course = course
        destinationConfigureTeams.currentTeamN = 1
        
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
            teamsNumber = 2
        }
    }
    
}
