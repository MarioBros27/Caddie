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

//        print("Course: "+(course?.name)!)
//        print("team size: \(teamsSize!) and teams number: \(teamsNumber!)")
//        for team in teams{
//            print("team: \(team.name) and count of players :\(team.players.count)")
//        }
    }

    // MARK: - Table view data source
    
   
    
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
        return 40    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 0, width: 320, height: 40)
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myLabel.text = "Equipo N"
        
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
//        let tryan = indexPath.section
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    //MARK: Actions
    @IBAction func nextButtonPressed(_ sender: UIBarButtonItem) {
        tryingTOgetData()
    }
    
    //MARK: BusinessFunctions
    func tryingTOgetData(){
        let indexPath = IndexPath(row: 0, section: 1)
        
        let currentCell = tableView.cellForRow(at: indexPath) as! PlayGameTableViewCell
        let hits = Int(currentCell.hitsLabel.text!)
        print("\(hits!)")
        let yes = currentCell.chipInButton.isSelected
        let no = currentCell.sandyParButton.isSelected
        print("yes == \(yes)")
        print("no == \(no)")

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
