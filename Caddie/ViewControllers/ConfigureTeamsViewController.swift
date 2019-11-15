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
    var tempPlayers = [Player]()
    var teams = [Team]()
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
        textFields.append(player1TextField)
        textFields.append(player2TextField)
        textFields.append(player3TextField)
        textFields.append(player4TextField)
        
        teamNameTextField.delegate = self
        
//        currentTeamN = 1
        
        hideUnusedTextFields()
        createDummyPlayers()
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
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ConfigureTeamsViewController.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        player1TextField.inputAccessoryView = toolBar
        player2TextField.inputAccessoryView = toolBar
        player3TextField.inputAccessoryView = toolBar
        player4TextField.inputAccessoryView = toolBar
        

    }
    @objc func dismissKeyboard(){
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
        return players[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        textFields[pickerView.tag].text = players[row].name
        tempPlayers[pickerView.tag] = players[row]

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
        var actualTeam = [Player]()
        actualTeam.append(contentsOf: tempPlayers[..<teamsSize!])
        teams.append(Team(name: teamName ?? "Equipo \(currentTeamN)", size: teamsSize!, players: actualTeam))
        
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
        let destinationPlayGame = segue.destination as! PlayGameTableViewController
        destinationPlayGame.course = course
        destinationPlayGame.teamsSize = teamsSize
        destinationPlayGame.teamsNumber = teamsNumber
        destinationPlayGame.teams = teams
        
    }
    


    func createDummyPlayers(){
        for i in 0..<10{
            players.append(Player(name: "Pedro \(i)", photo: UIImage.init(named: "defaultPhoto")!)!)
        }
        for i in 0..<teamsSize!{
            tempPlayers.append(players[i])
        }
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