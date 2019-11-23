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
        currentHole = 1
        super.viewDidLoad()
        //Pass teams resultsfor hole from past selectteams view
        //needs ids and name of the team and name of the players
        //Don't forget they are needed to fill the cells and headers
//Initialize gameResults
        navigationItem.title = "\(currentHole)"
        initializeGames()
        
    }

    // MARK: - Table view data source
    
   
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return teamsNumber ?? 5
        return teamsResultsForHole.count
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("I'm heree nigga")
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
        cell.selectionStyle = .none
        cell.playerNameLabel.text = teamsResultsForHole[indexPath.section].players[indexPath.row].nombre
        cell.hitsLabel.text = "\(teamsResultsForHole[indexPath.section].players[indexPath.row].hit)"
        cell.hitsStepper.value = Double(teamsResultsForHole[indexPath.section].players[indexPath.row].hit)
        cell.chipInButton.isSelected = teamsResultsForHole[indexPath.section].players[indexPath.row].chipIn
        cell.sandyParButton.isSelected = teamsResultsForHole[indexPath.section].players[indexPath.row].sandyPar
        cell.hoyEs1Button.isSelected = teamsResultsForHole[indexPath.section].players[indexPath.row].hoyEs[0]
        cell.hoyEs2Button.isSelected = teamsResultsForHole[indexPath.section].players[indexPath.row].hoyEs[1]
        cell.hoyEs3Button.isSelected = teamsResultsForHole[indexPath.section].players[indexPath.row].hoyEs[2]
//        cell.hoyEs1Button.isSelected = false
//        cell.hoyEs2Button.isSelected = false
//        cell.hoyEs3Button.isSelected = false
//        cell.chipInButton.isSelected = false
//        cell.sandyParButton.isSelected = false
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
//        cell.hitsLabel.text = "1"
//        cell.hitsStepper.value = 1
        
        return cell
    }
    
    //MARK: Actions
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let cell = sender.superview!.superview as! UITableViewCell
        let indexpath = mainTableView.indexPath(for: cell)
        
        teamsResultsForHole[indexpath!.section].players[indexpath!.row].hit = Int(sender.value)
        print("section: \(indexpath!.section) row:\(indexpath!.row) value: \(sender.value)")
        
    }
    
    
    @IBAction func chipInValueChanged(_ sender: UIButton) {
        let cell = sender.superview!.superview as! UITableViewCell
        let indexpath = mainTableView.indexPath(for: cell)
        teamsResultsForHole[indexpath!.section].players[indexpath!.row].chipIn = sender.isSelected
        print("section: \(indexpath!.section) row:\(indexpath!.row) value: \(sender.isSelected)")
        
    }
    
    
    @IBAction func sandyParValueChanged(_ sender: UIButton) {
        let cell = sender.superview!.superview as! UITableViewCell
        let indexpath = mainTableView.indexPath(for: cell)
        teamsResultsForHole[indexpath!.section].players[indexpath!.row].sandyPar = sender.isSelected
        print("section: \(indexpath!.section) row:\(indexpath!.row) value: \(sender.isSelected)")
    }
    
    @IBAction func hoyEs1ValueChanged(_ sender: UIButton) {
        
        let cell = sender.superview!.superview as! UITableViewCell
        let indexpath = mainTableView.indexPath(for: cell)
        teamsResultsForHole[indexpath!.section].players[indexpath!.row].hoyEs[0] = sender.isSelected
        print("section: \(indexpath!.section) row:\(indexpath!.row) value: \(sender.isSelected)")
    }
    
    @IBAction func hoyEs2ValueChanged(_ sender: UIButton) {
        let cell = sender.superview!.superview as! UITableViewCell
        let indexpath = mainTableView.indexPath(for: cell)
        teamsResultsForHole[indexpath!.section].players[indexpath!.row].hoyEs[1] = sender.isSelected
        print("section: \(indexpath!.section) row:\(indexpath!.row) value: \(sender.isSelected)")
    }
    
    @IBAction func hoyEs3ValueChanged(_ sender: UIButton) {
        let cell = sender.superview!.superview as! UITableViewCell
        let indexpath = mainTableView.indexPath(for: cell)
        teamsResultsForHole[indexpath!.section].players[indexpath!.row].hoyEs[2] = sender.isSelected
        print("section: \(indexpath!.section) row:\(indexpath!.row) value: \(sender.isSelected)")
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIBarButtonItem) {
        
        //Check if it's time to finish or to move to the next hole, change button title and activate
        //seque option

        
        if(currentHole == course!.holes.count - 1 ){
            sender.title = "Terminar"
        }
        //Read data from views
        
//        readDataFromViews()
        
        //Get gameResults by calling scoring calculator don't forget to +=
        let scoringCalculator = ScoringCalculator(course: course!)
        let gameResultsForHole = scoringCalculator.calculateScoresForHole(teamsResultsForHole: teamsResultsForHole, currentHole: currentHole)
        
        
        addPointsFromHoleToTotalGameResults(gameResultsForHole: gameResultsForHole)
        
        //Go to final score view if it was the last hole
        if(currentHole == course!.holes.count){
            performSegue(withIdentifier: "FinalScoreIdentifier", sender: self)
            return
        }
        //Now reset data for teamsResultsForTheHole
        resetData()
        
        //Move to the next hole by reseting views
        resetViews()
        
        //Change title to the next hole and increment currenHole
        
        currentHole = currentHole + 1
        navigationItem.title = "\(currentHole)"
        print("currenthole = \(currentHole)")
    }
    

    @IBAction func seeLiveScorePressed(_ sender: Any) {
        //Segue to see live score
        performSegue(withIdentifier: "LiveScoreIdentifier", sender: self)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "ClosePlayGameIdentifier", sender: self)
    }
    //MARK: BusinessFunctions
    func addPointsFromHoleToTotalGameResults(gameResultsForHole: [Game]){
        for i in 0..<gameResultsForHole.count{
            gameResults[i].scoreTeam1 = gameResults[i].scoreTeam1 + gameResultsForHole[i].scoreTeam1
            gameResults[i].scoreTeam2 = gameResults[i].scoreTeam2 + gameResultsForHole[i].scoreTeam2
        }
    }
    

    func resetViews(){
        mainTableView.reloadData()

        for i in 0..<teamsResultsForHole.count{
            for k in 0..<teamsResultsForHole[i].players.count{
                let indexPath = IndexPath(row: k, section: i)
                mainTableView.reloadRows(at: [indexPath], with: .right)
            }
        }
        
      
    }
    func resetData(){
        for i in 0..<teamsResultsForHole.count{
            for k in 0..<teamsResultsForHole[0].players.count{
                
                teamsResultsForHole[i].players[k].hit = 1
                teamsResultsForHole[i].players[k].chipIn = false
                teamsResultsForHole[i].players[k].sandyPar = false
                teamsResultsForHole[i].players[k].hoyEs[0] = false
                teamsResultsForHole[i].players[k].hoyEs[1] = false
                teamsResultsForHole[i].players[k].hoyEs[2] = false

            }
        }
    }
    func readDataFromViews(){
        
        for i in 0..<teamsResultsForHole.count{
            for k in 0..<teamsResultsForHole[0].players.count{
                let indexPath = IndexPath(row: k, section: i)
                print("k = \(k), i = \(i)")
                let currentCell = tableView.cellForRow(at: indexPath) as! PlayGameTableViewCell
                teamsResultsForHole[i].players[k].hit = Int(currentCell.hitsLabel.text!)!
                teamsResultsForHole[i].players[k].chipIn = currentCell.chipInButton.isSelected
                teamsResultsForHole[i].players[k].sandyPar = currentCell.sandyParButton.isSelected
                teamsResultsForHole[i].players[k].hoyEs[0] = currentCell.hoyEs1Button.isSelected
                teamsResultsForHole[i].players[k].hoyEs[1] = currentCell.hoyEs2Button.isSelected
                teamsResultsForHole[i].players[k].hoyEs[2] = currentCell.hoyEs3Button.isSelected
                print(teamsResultsForHole[i].players[k].hit)
                print(teamsResultsForHole[i].players[k].chipIn)
                print(teamsResultsForHole[i].players[k].sandyPar)
                print(teamsResultsForHole[i].players[k].hoyEs[0])
                print(teamsResultsForHole[i].players[k].hoyEs[1])
                print(teamsResultsForHole[i].players[k].hoyEs[2])

            }
        }

    }
    func initializeGames(){
        for i in 0..<(teamsResultsForHole.count - 1){
            for j in (i + 1)..<(teamsResultsForHole.count){
                gameResults.append(Game(team1: teamsResultsForHole[i], team2: teamsResultsForHole[j]))
                
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "LiveScoreIdentifier"){
            let destinationLiveScore = segue.destination as! LiveScoreTableViewController
            destinationLiveScore.gameResults = gameResults
        }
        if(segue.identifier == "FinalScoreIdentifier"){
            let navigationController = segue.destination as? UINavigationController
            let destinationFinalScore = navigationController?.topViewController as! FinalScoreTableViewController
            destinationFinalScore.gameResults = gameResults
        }
        
    }
 

}
