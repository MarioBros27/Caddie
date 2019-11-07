//
//  CourseTableViewCell.swift
//  Caddie
//
//  Created by Andres on 11/5/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
