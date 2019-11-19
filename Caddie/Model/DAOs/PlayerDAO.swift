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
    
    func addPlayer(nombre: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let playerEntity = NSEntityDescription.entity(forEntityName: "Player", in: managedContext)
        var id = getAllPlayersOrderedById().last?.id ?? 0
        id = id + 1
        let player = NSManagedObject(entity: playerEntity!, insertInto: managedContext)
        player.setValue(nombre, forKey: "nombre")
        player.setValue(id, forKey: "id")

        player.setValue(0, forKey: "birdies")
        player.setValue(0, forKey: "albatros")
        player.setValue(0, forKey: "chipIns")
        player.setValue(0, forKey: "eagles")

        player.setValue(0, forKey: "handycap")

        player.setValue(0, forKey: "hoyEs")

        player.setValue(0, forKey: "sandyPars")

        
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

    
    func getAllPlayersOrderedById() -> [Player]{
        var players = [Player]()
        //Returns a player
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        //Configuration of the fetch request
        
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: true)]
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                let player = Player(nombre: data.value(forKey: "nombre") as! String, id: data.value(forKey: "id") as! Int, albatros: data.value(forKey: "albatros") as! Int, birdies: data.value(forKey: "birdies") as! Int, chipIns: data.value(forKey: "chipIns") as! Int, eagles: data.value(forKey: "eagles") as! Int, handycap: data.value(forKey: "handycap") as! Int, hoyEs: data.value(forKey: "hoyEs") as! Int, sandyPars: data.value(forKey: "sandyPars") as! Int)
                players.append(player)
            }
        }catch{
            print("Failed get Player request")
        }
        return players
        
        
    }
    func getAllPlayersOrderedByName() -> [Player]{
        var players = [Player]()
        //Returns a player
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        //Configuration of the fetch request
        
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "nombre", ascending: true)]
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                
                    let player = Player(nombre: data.value(forKey: "nombre") as! String, id: data.value(forKey: "id") as! Int, albatros: data.value(forKey: "albatros") as! Int, birdies: data.value(forKey: "birdies") as! Int, chipIns: data.value(forKey: "chipIns") as! Int, eagles: data.value(forKey: "eagles") as! Int, handycap: data.value(forKey: "handycap") as! Int, hoyEs: data.value(forKey: "hoyEs") as! Int, sandyPars: data.value(forKey: "sandyPars") as! Int)
                    players.append(player)
                
            }
        }catch{
            print("Failed get Player request")
        }
        return players
        
        
    }
    func updatePlayer(id: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
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
        fetchRequest.predicate = NSPredicate(format: "id == %i", id)
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
