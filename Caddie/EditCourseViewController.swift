//
//  EditCourseViewController.swift
//  Caddie
//
//  Created by Andres on 11/5/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit
import os.log

class EditCourseViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var par1TextField: UITextField!
    
    @IBOutlet weak var par2TextField: UITextField!
    
    @IBOutlet weak var par3TextField: UITextField!
    
    @IBOutlet weak var par4TextField: UITextField!
    
    @IBOutlet weak var par5TextField: UITextField!

    @IBOutlet weak var par6TextField: UITextField!
    
    @IBOutlet weak var par7TextField: UITextField!
    
    @IBOutlet weak var par8TextField: UITextField!
    
    @IBOutlet weak var par9TextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        // Do any additional setup after loading the view.
        updateSaveButtonState()
    }
    //MARK: Actions

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameTextField.text ?? ""
        var holes = [Int]()
        holes.append(Int(par1TextField.text ?? "4") ?? 4)
        holes.append(Int(par2TextField.text ?? "4") ?? 4)
        holes.append(Int(par3TextField.text ?? "4") ?? 4)
        holes.append(Int(par4TextField.text ?? "4") ?? 4)
        holes.append(Int(par5TextField.text ?? "4") ?? 4)
        holes.append(Int(par6TextField.text ?? "4") ?? 4)
        holes.append(Int(par7TextField.text ?? "4") ?? 4)
        holes.append(Int(par8TextField.text ?? "4") ?? 4)
        holes.append(Int(par9TextField.text ?? "4") ?? 4)
        
        course = Course(name: name, holes: holes)
    }
    
    //MARK: Private methods
    func updateSaveButtonState(){
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}
