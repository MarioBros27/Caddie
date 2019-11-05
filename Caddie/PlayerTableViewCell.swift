//
//  PlayerCellTableViewCell.swift
//  Caddie
//
//  Created by Andres on 10/28/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    var players = [Player]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: Private Methods
    
    private func loadSamplePlayers() {
        
    }

}
