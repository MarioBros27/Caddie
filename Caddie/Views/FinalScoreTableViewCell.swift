//
//  FinalScoreTableViewCell.swift
//  Caddie
//
//  Created by Andres on 11/20/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class FinalScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team2Label: UILabel!
    
    @IBOutlet weak var scoreTeam1Label: UILabel!
    
    @IBOutlet weak var scoreTeam2Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
