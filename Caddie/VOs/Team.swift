//
//  Team.swift
//  Caddie
//
//  Created by Andres on 11/10/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit
class Team{
    
    var players = [Player]()
    var size: Int
    var name: String
    
    init(name: String, size: Int, players: [Player]){
        self.name = name
        self.size = size
        self.players = players
    }
}
