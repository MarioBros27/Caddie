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
    var teamsResultsForHole = [TeamPlaying]()
    var gameResults = [Game]()
    var currentHole = 1

    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        //Pass teams resultsfor hole from past selectteams view
        //needs ids and name of the team and name of the players
        //Don't forget they are needed to fill the cells and headers
//Initialize gameResults
        initializeGames()
        
    }

    // MARK: - Table view data source
    
   
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return teamsNumber ?? 5
        return teamsResultsForHole.count
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
        myLabel.text = "\(teamsResultsForHole[section].name)"
        
        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        return headerView
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return teamsSize ?? 5
        return teamsResultsForHole[0].players.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PlayGameTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayGameTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
//        let tryan = indexPath.section
        cell.selectionStyle = .none
        cell.playerNameLabel.text = teamsResultsForHole[indexPath.section].players[indexPath.row].nombre
        if(teamsResultsForHole.count == 2){
            cell.hoyEs2Button.isHidden = true
            cell.hoyEs3Button.isHidden = true
            cell.hoyEs2Label.isHidden = true
            cell.hoyEs3Label.isHidden = true

        }
        if(teamsResultsForHole.count == 3){
            cell.hoyEs3Button.isHidden = true
            cell.hoyEs3Label.isHidden = true
        }
        return cell
    }
    
    //MARK: Actions
    @IBAction func nextButtonPressed(_ sender: UIBarButtonItem) {
        tryingTOgetData()
        
        //Calcular puntajes con scoringCalculator
        //Agregar puntajes obtenidos por el scoringCalculator al game para poder ver live score
        //if currentHole == 18 change next to finish
        //Mostrar live score con nuevos puntajes
        currentHole = currentHole + 1
    
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
    func initializeGames(){
        for i in 0..<(teamsResultsForHole.count - 1){
            for j in (i + 1)..<(teamsResultsForHole.count){
                gameResults.append(Game(team1: teamsResultsForHole[i], team2: teamsResultsForHole[j]))
                
            }
        }
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
