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
    var name: String?
    
    //MARK: Initialization
    init?(name: String){
        
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        
    }
}
