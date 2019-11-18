//
//  Game.swift
//  Caddie
//
//  Created by Andres on 11/18/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation
import UIKit

class Game{
    
    var team1 = [Player]()
    var team2 = [Player]()
    var scoreTeam1: Int
    var scoreTeam2: Int
    
    init(team1: [Player], team2: [Player]){
        self.team1 = team1
        self.team2 = team2
        self.scoreTeam1 = 0
        self.scoreTeam2 = 0
    }
    
}
