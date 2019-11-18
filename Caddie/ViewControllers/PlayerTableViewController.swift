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
        print("player \(String(describing: player.nombre)) id = \(player.id)")
        cell.nameLabel.text = player.nombre
        cell.photoImageView.image = UIImage(named: "defaultPhoto")

        return cell
    }
    
    //MARK: Actions
     @IBAction func unwindToPlayersList(sender: UIStoryboardSegue) {
        let playerDAO = PlayerDAO()
        players = playerDAO.getAllPlayersOrderedByName()
        tableViewConn.reloadData()
//        }
        
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    //MARK: Private methods

}
