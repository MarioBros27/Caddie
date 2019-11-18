//
//  PlayerTableViewController.swift
//  Caddie
//
//  Created by Andres on 10/28/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {

    //MARK: Properties
    var players = [Player]()
    
    @IBOutlet var tableViewConn: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConn.tableFooterView = UIView(frame: CGRect.zero)
        // Load the sample data.
        let playerDAO = PlayerDAO()
        players = playerDAO.getAllPlayersOrderedByName()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PlayerTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayerTableViewCell  else {
            fatalError("The dequeued cell is not an instance of PlayerTableViewCell.")
        }
        

        // Configure the cell...
        // Fetches the appropriate meal for the data source layout.
        let player = players[indexPath.row]
        print("player \(player.nombre) id = \(player.id)")
        cell.nameLabel.text = player.nombre
        cell.photoImageView.image = UIImage(named: "defaultPhoto")

        return cell
    }
    
    //MARK: Actions
     @IBAction func unwindToPlayersList(sender: UIStoryboardSegue) {
        let playerDAO = PlayerDAO()
        players = playerDAO.getAllPlayersOrderedByName()
        tableViewConn.reloadData()
//        if let sourceViewController = sender.source as? EditPlayerViewController, let player = sourceViewController.player {
        
//            // Add a new meal.
//            let newIndexPath = IndexPath(row: players.count, section: 0)
//
//            players.append(player)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
        
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "AddItem"){
//            let navigationController = segue.destination as! UINavigationController
//            let destinationAddPlayer = navigationController.topViewController as! EditPlayerViewController
//            if(players.count>0){
//                destinationAddPlayer.newId = players[players.count-1].id + 1
//
//            }else{
//                destinationAddPlayer.newId = 0
//
//            }

//        }
    }
    //MARK: Private methods
//    func loadSamplePlayers(){
//        
//        let photo1 = UIImage(named: "defaultPhoto")
//        let photo2 = UIImage(named: "defaultPhoto")
//        let photo3 = UIImage(named: "defaultPhoto")
//        
//        guard let player1 = Player(name: "Georgie", photo: photo1!) else {
//            fatalError("Unable to instantiate player1")
//        }
//        
//        guard let player2 = Player(name: "What?", photo: photo2!) else {
//            fatalError("Unable to instantiate player2")
//        }
//        
//        guard let player3 = Player(name: "Dafuq?", photo: photo3!) else {
//            fatalError("Unable to instantiate player3")
//        }
//        
//        players += [player1, player2, player3]
//    }

}
