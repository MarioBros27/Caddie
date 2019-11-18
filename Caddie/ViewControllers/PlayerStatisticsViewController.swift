//
//  PlayerStatisticsViewController.swift
//  Caddie
//
//  Created by Andres on 11/18/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class PlayerStatisticsViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handyCapLabel: UILabel!
    @IBOutlet weak var albatrosLabel: UILabel!
    @IBOutlet weak var birdiesLabel: UILabel!
    @IBOutlet weak var chipInsLabel: UILabel!
    @IBOutlet weak var eaglesLabel: UILabel!
    @IBOutlet weak var hoyEsLabel: UILabel!
    @IBOutlet weak var sandyParsLabel: UILabel!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = player?.nombre
        handyCapLabel.text = "\(player!.handycap)"
        albatrosLabel.text = "\(player!.albatros)"
        birdiesLabel.text = "\(player!.birdies)"
        chipInsLabel.text = "\(player!.chipIns)"
        eaglesLabel.text = "\(player!.eagles)"
        hoyEsLabel.text = "\(player!.hoyEs)"
        sandyParsLabel.text = "\(player!.sandyPars)"
        
        // Do any additional setup after loading the view.
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
