//
//  Course.swift
//  Caddie
//
//  Created by Andres on 11/5/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class Course{
    //MARK: Properties
    var nombre: String?
    var holes = [Int]()
    var id: Int
//    var parCampo = Int
    
    //MARK: Initialization
    init(id: Int, nombre: String, holes: [Int]){
        
        self.nombre = nombre
        self.holes = holes
        self.id = id
    }
}
