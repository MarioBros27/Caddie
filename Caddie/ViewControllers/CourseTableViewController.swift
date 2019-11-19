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
    
    @IBOutlet var tableViewConn: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConn.tableFooterView = UIView(frame: CGRect.zero)
        if(playing ?? false){
            navigationItem.title = "Seleccione campo"
        }
        let coursedao = CourseDAO()
        courses = coursedao.getAllCoursesOrderedByName()
        
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
        print("course \(String(describing: course.nombre)) id = \(course.id)")
        cell.nameLabel.text = course.nombre
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let id = courses[indexPath.row].id
            let coursedao = CourseDAO()
            courses.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            coursedao.deleteCourse(id: id)
            tableView.endUpdates()
        }
        
    }    //MARK: Actions
    @IBAction func unwindToCoursesList(sender: UIStoryboardSegue) {
        let coursedao = CourseDAO()
        courses = coursedao.getAllCoursesOrderedByName()
        tableViewConn.reloadData()
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
//    func loadSampleCourses(){
//        let holes1 = [2,3,4,4,3,2,4,2]
//        let holes2 = [4,3,3,2,2,3,4,3]
//        let holes3 = [4,3,2,3,2,2,3,4]
//
//        guard let course1 = Course(name: "Buena bola", holes: holes1) else{
//            fatalError("unable to instantiate Course")
//        }
//        guard let course2 = Course(name: "Campo sagrado", holes: holes2) else{
//            fatalError("unable to instantiate Course")
//        }
//        guard let course3 = Course(name: "What", holes: holes3) else{
//            fatalError("unable to instantiate Course")
//        }
//
//        courses += [course1, course2, course3]
//    }
    
    
}
