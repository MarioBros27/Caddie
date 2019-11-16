//
//  PlayGameTableViewCell.swift
//  Caddie
//
//  Created by Andres on 11/15/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class PlayGameTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var chipInButton: UIButton!
    @IBOutlet weak var sandyParButton: UIButton!
    @IBOutlet weak var hoyEs1Button: UIButton!
    @IBOutlet weak var hoyEs2Button: UIButton!
    @IBOutlet weak var hoyEs3Button: UIButton!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var hitsLabel: UILabel!
    
    
    @IBOutlet weak var hitsStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        hitsLabel.text = Int(sender.value).description
    }
    
    
    @IBAction func chipInSelectionChanged(_ sender: UIButton) {
        switchCheckBox(button: sender)
    }
    
    
    @IBAction func sandyParSelectionChanged(_ sender: UIButton) {
        switchCheckBox(button: sender)
    }
    
    @IBAction func hoyEs1SelectionChanged(_ sender: UIButton) {
        switchCheckBox(button: sender)
    }
    
    @IBAction func hoyEs2SelectionChanged(_ sender: UIButton) {
        switchCheckBox(button: sender)
        
    }
    @IBAction func hoyEs3SelectionChanged(_ sender: UIButton) {
        switchCheckBox(button: sender)
    }
    func switchCheckBox(button: UIButton){
        if(button.isSelected){
            //Uncheck button
            button.isSelected = false
        }else{
            button.isSelected = true
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
