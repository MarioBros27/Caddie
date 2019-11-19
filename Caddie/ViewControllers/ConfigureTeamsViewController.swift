//
//  ConfigureTeamsTableViewController.swift
//  Caddie
//
//  Created by Andres on 11/10/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class ConfigureTeamsViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //MARK: Properties
    
    var course: Course?
    var teamsSize: Int?
    var teamsNumber: Int?
    var players = [Player]()
    var teamsToPlay = [TeamPlaying]()
    var playerNames = [String]()
    var playerIds = [Int]()
    var teamName: String?
    var currentTeamN: Int = 1
    var textFields = [UITextField]()
    
    @IBOutlet weak var teamNameTextField: UITextField!
    
    @IBOutlet weak var player1TextField: UITextField!
    
    @IBOutlet weak var player2TextField: UITextField!
    
    @IBOutlet weak var player3TextField: UITextField!
    
    @IBOutlet weak var player4TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let playerDAO = PlayerDAO()
        players = playerDAO.getAllPlayersOrderedByName()
        textFields.append(player1TextField)
        textFields.append(player2TextField)
        textFields.append(player3TextField)
        textFields.append(player4TextField)
        
        teamNameTextField.delegate = self
        for _ in 0..<teamsSize!{
            playerNames.append("fake name")
            playerIds.append(-1)
        }
        
        hideUnusedTextFields()
//        createDummyPlayers()
        createPlayersPicker()
        createToolbar()
    }
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if(textField != self.teamNameTextField){
//            textField.resignFirstResponder()
//        }
        // Disable the Save button while editing.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        updateSaveButtonState()
        navigationItem.title = textField.text
        teamName = teamNameTextField.text
    }
    
    
    //MARK: UI Picker
    
    func createToolbar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Listo", style: .plain, target: self, action: #selector(ConfigureTeamsViewController.doneButtonClicked))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        player1TextField.inputAccessoryView = toolBar
        player2TextField.inputAccessoryView = toolBar
        player3TextField.inputAccessoryView = toolBar
        player4TextField.inputAccessoryView = toolBar
        

    }
    @objc func doneButtonClicked(){
        view.endEditing(true)
    }
    //MARK: UIPicker
    func createPlayersPicker(){
        var c = 0
        for textField in textFields{
            let combPicker = UIPickerView()
            combPicker.tag = c
            print("Tag\(combPicker.tag)")
            combPicker.delegate = self
            textField.inputView = combPicker
            c += 1
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return players.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return players[row].nombre
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        textFields[pickerView.tag].text = players[row].nombre
//        tempPlayers[pickerView.tag] = players[row]
        playerNames[pickerView.tag] = players[row].nombre!
        playerIds[pickerView.tag] = players[row].id

    }
    //MARK: Actions
    
    @IBAction func next(_ sender: UIBarButtonItem) {
        /*
         increment currentTeamN
         if the currentTeamN > teamN -> segue to the next view and send all the data to the view
         and if currentTeamN == tesmN -1 rightbutton to comenzar
         if not then delete everything and update title
         */
        teamName = teamNameTextField.text
        var playersToPlay = [PlayerPlaying]()
        for i in 0..<teamsSize!{
            playersToPlay.append(PlayerPlaying(id: playerIds[i], nombre: playerNames[i]))
        }
        if(teamName == "" || teamName == nil){
            teamsToPlay.append(TeamPlaying(name: "Equipo \(currentTeamN)", players: playersToPlay))
        }else{
            teamsToPlay.append(TeamPlaying(name: teamName ?? "error" , players: playersToPlay))
        }
        
        
        if (currentTeamN == teamsNumber! - 1){
            //Change right button
            navigationItem.rightBarButtonItem?.title = "Comenzar"
        }
        if(currentTeamN == teamsNumber!){
            //Segue
            performSegue(withIdentifier: "playGameIdentifier", sender: self)

        }else{
            //Store values, and delete and update title
            
            currentTeamN += 1
            navigationItem.title = "Equipo \(currentTeamN)"
            resetTextFields()
        }
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Prepare for segue that shows PlayGameTableViewController
        let navigationController = segue.destination as? UINavigationController
        let destinationPlayGame = navigationController?.topViewController as! PlayGameTableViewController
        destinationPlayGame.course = course
        destinationPlayGame.teamsResultsForHole = teamsToPlay
    }

    func resetTextFields(){
        teamNameTextField.text = ""
        player1TextField.text = ""
        player2TextField.text = ""
        player3TextField.text = ""
        player4TextField.text = ""
    }
    func hideUnusedTextFields(){
        if(teamsSize == 2){
            player3TextField.isHidden = true
            player4TextField.isHidden = true
        }
        if(teamsSize == 3){
            player4TextField.isHidden = true
        }
    }
}
