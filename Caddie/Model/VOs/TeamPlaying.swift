//
//  TeamPlaying.swift
//  Caddie
//
//  Created by Andres on 11/18/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation
import UIKit

class TeamPlaying{
    
    var players = [PlayerPlaying]()
    var size: Int
    var name: String
    
    init(name: String, size: Int, players: [PlayerPlaying]){
        self.name = name
        self.size = size
        self.players = players
    }
}
