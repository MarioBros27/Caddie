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
    var name: String?
    var holes = [Int]()
    
    //MARK: Initialization
    init?(name: String, holes: [Int]){
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.holes = holes
    }
}
