//
//  PlayerDAO.swift
//  Caddie
//
//  Created by Andres on 11/17/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PlayerDAO{
    
    func addPlayer(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let playerEntity = NSEntityDescription.entity(forEntityName: "Player", in: managedContext)
        
        let player = NSManagedObject(entity: playerEntity!, insertInto: managedContext)
        player.setValue("Juan", forKey: "nombre")
        player.setValue(1, forKey: "birdies")
        
        //Save the player into the database
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save. \(error) \(error.userInfo)")
        }
    }
    
    func getPlayer(id: Int){
        
        //Returns a player
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        //Configuration of the fetch request
        
        fetchRequest.fetchLimit = 1
//        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
//        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: false)]
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "name") as! String)
            }
        }catch{
            print("Failed get Player request")
        }
        
        
        
    }
    
    func getPlayers(){
        //returns a list of players
        
        
        
    }
    func updatePlayer(id: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue("newvalue**nah", forKey: "birdies")
            //ETC...
            do{
                try managedContext.save()
            }catch{
                print("error updating the player \(id)")
            }
        }catch{
            print("error trying to update Player \(id)")
        }
    }
    func deletePlayer(id: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        do{
            let fetchedRow = try managedContext.fetch(fetchRequest)
            
            
            let objectToDelete = fetchedRow[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            do{
                try managedContext.save()
            }catch{
                print("error delete the player \(id)")
            }
        }catch{
            print("error trying to delete Player \(id)")
        }
    }
}
