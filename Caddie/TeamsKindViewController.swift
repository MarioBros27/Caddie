//
//  TeamsKindViewController.swift
//  Caddie
//
//  Created by Andres on 11/10/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class TeamsKindViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var combinationTextField: UITextField!
    
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
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = course?.name 
        // Do any additional setup after loading the view.
        createCombinationPicker()
        createToolbar()
    }
    
    //MARK: Toolbar's UIPicker
    
    func createToolbar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(TeamsKindViewController.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        combinationTextField.inputAccessoryView = toolBar
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    //MARK: UIPicker
    func createCombinationPicker(){
        let combPicker = UIPickerView()
        combPicker.delegate = self
        combinationTextField.inputView = combPicker
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return combinationTexts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return combinationTexts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        combinationTextField.text = combinationTexts[row]
        assignValues (combValue: TeamsKindViewController.Combinations(rawValue: combinationTexts[row])!)
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
            teamsNumber = 4
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
