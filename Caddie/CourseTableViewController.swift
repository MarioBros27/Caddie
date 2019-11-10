//
//  CourseTableViewController.swift
//  Caddie
//
//  Created by Andres on 11/5/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class CourseTableViewController: UITableViewController {
    //MARK: Properties
    var courses = [Course]()
    var playing: Bool?
    var selectedCourse: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(playing ?? false){
            navigationItem.title = "Seleccione equipo"
        }
        //Load the sample data
        loadSampleCourses()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCourse = courses[indexPath.row]
        if(playing ?? false){
            performSegue(withIdentifier: "teamsKindIdentifier", sender: self)
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "teamsKindIdentifier"){
        let destinationTeamsKind = segue.destination as! TeamsKindTableViewController
        destinationTeamsKind.course = selectedCourse
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CourseTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CourseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        
        // Configure the cell...
        let course = courses[indexPath.row]
        cell.nameLabel.text = course.name
        
        return cell
    }
    //MARK: Actions
    @IBAction func unwindToCoursesList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? EditCourseViewController, let course = sourceViewController.course {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: courses.count, section: 0)
            
            courses.append(course)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: Private methods
    func loadSampleCourses(){
        let holes1 = [2,3,4,4,3,2,4,2]
        let holes2 = [4,3,3,2,2,3,4,3]
        let holes3 = [4,3,2,3,2,2,3,4]
        
        guard let course1 = Course(name: "Buena bola", holes: holes1) else{
            fatalError("unable to instantiate Course")
        }
        guard let course2 = Course(name: "Campo sagrado", holes: holes2) else{
            fatalError("unable to instantiate Course")
        }
        guard let course3 = Course(name: "What", holes: holes3) else{
            fatalError("unable to instantiate Course")
        }
        
        courses += [course1, course2, course3]
    }
    
    
}
