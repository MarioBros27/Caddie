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
    var id: Int
    var nombre: String
    var hit: Int
    var chipIn: Bool
    var sandyPar: Bool
    var hoyEs: [Bool]
    
    init (id: Int, nombre: String){
        self.nombre = nombre
        self.id = id
        self.hit = 0
        self.chipIn = false
        self.sandyPar = false
        self.hoyEs = [false, false, false]
    }
    
}
