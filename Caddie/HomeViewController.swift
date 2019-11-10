//
//  ViewController.swift
//  Caddie
//
//  Created by Andres on 10/28/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var playing: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playing = false
    }

    @IBAction func showPlayers(_ sender: Any) {
    }
    
    @IBAction func showCoursesList(_ sender: UIButton) {
        playing = false
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func startPlaying(_ sender: UIButton) {
        playing = true
        performSegue(withIdentifier: "identifier", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "identifier"){
            let destinationView = segue.destination as! CourseTableViewController
            destinationView.playing = playing
            
        }
    }
}

