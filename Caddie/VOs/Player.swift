//
//  Player.swift
//  Caddie
//
//  Created by Andres on 10/29/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class Player{
    //MARK: Properties
    var nombre: String?
    var photo: UIImage?
    
    var id: Int
    var albatros: Int
    var birdies: Int
    var chipIns: Int
    var eagles: Int
    var handycap: Int
    var hoyEs: Int
    var sandyPars: Int
    
    
    //MARK: Initialization
    init(nombre: String,id: Int, albatros: Int, birdies: Int, chipIns: Int, eagles: Int, handycap: Int, hoyEs: Int, sandyPars: Int ){
        
        self.nombre = nombre
        self.id = id
        self.albatros = albatros
        self.birdies = birdies
        self.chipIns = chipIns
        self.eagles = eagles
        self.handycap = handycap
        self.hoyEs = hoyEs
        self.sandyPars = sandyPars
        
    }
}
