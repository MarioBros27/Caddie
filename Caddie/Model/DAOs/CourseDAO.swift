//
//  PlayerDAO.swift
//  Caddie
//
//  Created by Andres on 11/18/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CourseDAO{
    
    func addCourse(nombre: String, holes: [Int]){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let courseEntity = NSEntityDescription.entity(forEntityName: "Course", in: managedContext)
        var id = getAllCoursesOrderedById().last?.id ?? 0
        id = id + 1
        let course = NSManagedObject(entity: courseEntity!, insertInto: managedContext)
        course.setValue(nombre, forKey: "nombre")
        course.setValue(id, forKey: "id")
        for i in 0..<holes.count{
            course.setValue(holes[i], forKey:"par\(i + 1)")
        }
        
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save. \(error) \(error.userInfo)")
        }
    }
    
    func getCourse(id: Int){
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        //Configuration of the fetch request
        
        fetchRequest.fetchLimit = 1
        //        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: false)]
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "nombre") as! String)
            }
        }catch{
            print("Failed get Course request")
        }
        
        
        
    }
    
    
    func getAllCoursesOrderedById() -> [Course]{
        var courses = [Course]()
        //Returns a player
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        //Configuration of the fetch request
        
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: true)]
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
//                data.value(forKey: "nombre") as! String
                var holes = [Int]()
                for i in 0..<18{
                    holes.append(data.value(forKey: "par\(i + 1)") as! Int)
                }
                let course = Course(id: data.value(forKey: "id") as! Int,nombre: data.value(forKey: "nombre") as! String, holes: holes)
                courses.append(course)
            }
        }catch{
            print("Failed get Course request")
        }
        return courses
        
        
    }
    func getAllCoursesOrderedByName() -> [Course]{
        var courses = [Course]()
        //Returns a player
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        //Configuration of the fetch request
        
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "nombre", ascending: true)]
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                //                data.value(forKey: "nombre") as! String
                var holes = [Int]()
                for i in 0..<18{
                    holes.append(data.value(forKey: "par\(i + 1)") as! Int)
                }
                let course = Course(id: data.value(forKey: "id") as! Int,nombre: data.value(forKey: "nombre") as! String, holes: holes)
                courses.append(course)
            }
        }catch{
            print("Failed get Course request")
        }
        return courses
        
        
    }
//    func updatePlayer(id: Int){
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
//        do{
//            let test = try managedContext.fetch(fetchRequest)
//
//            let objectUpdate = test[0] as! NSManagedObject
//            objectUpdate.setValue("newvalue**nah", forKey: "birdies")
//            //ETC...
//            do{
//                try managedContext.save()
//            }catch{
//                print("error updating the course \(id)")
//            }
//        }catch{
//            print("error trying to update course \(id)")
//        }
//    }
    func deleteCourse(id: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        fetchRequest.predicate = NSPredicate(format: "id == %i", id)
        do{
            let fetchedRow = try managedContext.fetch(fetchRequest)
            
            
            let objectToDelete = fetchedRow[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            do{
                try managedContext.save()
            }catch{
                print("error delete the course \(id)")
            }
        }catch{
            print("error trying to delete course \(id)")
        }
    }
}
