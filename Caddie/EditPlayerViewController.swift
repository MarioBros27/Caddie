//
//  EditPlayerViewController.swift
//  Caddie
//
//  Created by Andres on 10/28/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit
import os.log

class EditPlayerViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{
    
    //MARK: Properties
    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameEditText.delegate = self
        // Do any additional setup after loading the view.
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        updateSaveButtonState()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    // MARK: - Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameEditText.text ?? ""
        player = Player(name: name)

    }
    //MARK: Private Methods

    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameEditText.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}
