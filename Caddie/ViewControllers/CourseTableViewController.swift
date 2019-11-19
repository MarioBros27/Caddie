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
    var nineHoles = false
    
    @IBOutlet weak var play9HolesStackView: UIStackView!
    
    
    @IBOutlet var tableViewConn: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConn.tableFooterView = UIView(frame: CGRect.zero)
        if(playing!){
            navigationItem.title = "Seleccione campo"
        }else{
            play9HolesStackView.isHidden = true
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
            if(nineHoles){
                selectedCourse!.holes.removeSubrange(9..<18)
            }
            
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
        
    @IBAction func switchChanged(_ sender: UISwitch!) {
        
        if(sender.isOn){
            nineHoles = true
        }else{
            nineHoles = false
        }
    }
    
    
}
