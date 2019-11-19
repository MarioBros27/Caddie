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
    
    @IBOutlet weak var par1Label: UILabel!
    
    @IBOutlet weak var par2Label: UILabel!
    
    @IBOutlet weak var par3Label: UILabel!
    
    @IBOutlet weak var par4Label: UILabel!
    
    @IBOutlet weak var par5Label: UILabel!

    @IBOutlet weak var par6Label: UILabel!
    
    @IBOutlet weak var par7Label: UILabel!
    
    @IBOutlet weak var par8Label: UILabel!
    
    @IBOutlet weak var par9Label: UILabel!
    
    @IBOutlet weak var par10Label: UILabel!
    
    @IBOutlet weak var par11Label: UILabel!
    @IBOutlet weak var par12Label: UILabel!
    @IBOutlet weak var par13Label: UILabel!
    @IBOutlet weak var par14Label: UILabel!
    @IBOutlet weak var par15Label: UILabel!
    @IBOutlet weak var par16Label: UILabel!
    @IBOutlet weak var par17Label: UILabel!
    @IBOutlet weak var par18Label: UILabel!
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        // Do any additional setup after loading the view.
        updateSaveButtonState()
    }
    //MARK: Actions

    //MARK: Steppers
    
    @IBAction func stepper1ValueChanged(_ sender: UIStepper) {
        par1Label.text = Int(sender.value).description
    }
    @IBAction func stepper2ValueChanged(_ sender: UIStepper) {
        par2Label.text = Int(sender.value).description
    }
    @IBAction func stepper3ValueChanged(_ sender: UIStepper) {
        par3Label.text = Int(sender.value).description
    }
    @IBAction func stepper4ValueChanged(_ sender: UIStepper) {
        par4Label.text = Int(sender.value).description
    }
    @IBAction func stepper5ValueChanged(_ sender: UIStepper) {
        par5Label.text = Int(sender.value).description
    }
    @IBAction func stepper6ValueChanged(_ sender: UIStepper) {
        par6Label.text = Int(sender.value).description
    }
    @IBAction func stepper7ValueChanged(_ sender: UIStepper) {
        par7Label.text = Int(sender.value).description
    }
    @IBAction func stepper8ValueChanged(_ sender: UIStepper) {
        par8Label.text = Int(sender.value).description
    }
    @IBAction func stepper9ValueChanged(_ sender: UIStepper) {
        par9Label.text = Int(sender.value).description
    }
    @IBAction func stepper10ValueChanged(_ sender: UIStepper) {
        par10Label.text = Int(sender.value).description
    }
    @IBAction func stepper11ValueChanged(_ sender: UIStepper) {
        par11Label.text = Int(sender.value).description
    }
    @IBAction func stepper12ValueChanged(_ sender: UIStepper) {
        par12Label.text = Int(sender.value).description
    }
    @IBAction func stepper13ValueChanged(_ sender: UIStepper) {
        par13Label.text = Int(sender.value).description
    }
    @IBAction func stepper14ValueChanged(_ sender: UIStepper) {
        par14Label.text = Int(sender.value).description
    }
    @IBAction func stepper15ValueChanged(_ sender: UIStepper) {
        par15Label.text = Int(sender.value).description
    }
    @IBAction func stepper16ValueChanged(_ sender: UIStepper) {
        par16Label.text = Int(sender.value).description
    }
    @IBAction func stepper17ValueChanged(_ sender: UIStepper) {
        par17Label.text = Int(sender.value).description
    }
    @IBAction func stepper18ValueChanged(_ sender: UIStepper) {
        par18Label.text = Int(sender.value).description
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameTextField.text ?? ""
        var holes = [Int]()
        holes.append(Int(par1Label.text!)!)
        holes.append(Int(par2Label.text!)!)
        holes.append(Int(par3Label.text!)!)
        holes.append(Int(par4Label.text!)!)
        holes.append(Int(par5Label.text!)!)
        holes.append(Int(par6Label.text!)!)
        holes.append(Int(par7Label.text!)!)
        holes.append(Int(par8Label.text!)!)
        holes.append(Int(par9Label.text!)!)
        holes.append(Int(par10Label.text!)!)
        holes.append( Int(par11Label.text!)!)
        holes.append( Int(par12Label.text!)!)
        holes.append( Int(par13Label.text!)!)
        holes.append( Int(par14Label.text!)!)
        holes.append( Int(par15Label.text!)!)
        holes.append( Int(par16Label.text!)!)
        holes.append( Int(par17Label.text!)!)
        holes.append( Int(par18Label.text!)!)
        let coursedao = CourseDAO()
        coursedao.addCourse(nombre: name, holes: holes)
    }
    
    //MARK: Private methods
    func updateSaveButtonState(){
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}
