//
//  TeamsKindViewController.swift
//  Caddie
//
//  Created by Andres on 11/10/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class TeamsKindViewController: UIViewController {
    var course: Course?
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = course?.name 
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
