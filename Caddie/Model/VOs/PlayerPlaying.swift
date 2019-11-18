//
//  PlayerPlaying.swift
//  Caddie
//
//  Created by Andres on 11/18/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation
import UIKit

class PlayerPlaying{
    var hit: Int
    var chipIn: Bool
    var sandyPar: Bool
    var hoyEs: [Bool]
    
    init (hit: Int, chipIn: Bool, sandyPar: Bool, hoyEs: [Bool]){
        self.hit = hit
        self.chipIn = chipIn
        self.sandyPar = sandyPar
        self.hoyEs = hoyEs
    }
    
}
