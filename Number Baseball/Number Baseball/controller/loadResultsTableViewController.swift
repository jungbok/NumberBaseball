//
//  loadResultsTableViewController.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 5/5/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import UIKit

class loadResultsTableViewController: UITableViewController {
    
    @IBOutlet var gameResultTableView: UITableView!
    private var dataModel = numberBaseballModel.sharedInstance
    private var gameResult:[(String, Numbers)] = []

    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    // UIbarbuttonItem pressed, send alarm to remove all - and then remove
    @IBOutlet weak var trashButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameResult = dataModel.getGameResults()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameResult = dataModel.getGameResults()
        
        gameResultTableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gameResult.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameResultCell", for: indexPath)

        // Configure the cell...
        if gameResult.count > 0{
            //print("game Result count > 0")
            let (winner, number) = gameResult[indexPath.row]
            let numberToString = number.numbersToString()
            cell.detailTextLabel?.text = numberToString
            cell.textLabel?.text = winner
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func trashButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Are you sure to erase everything?", message: "erased record will not be restored", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title:"Yes", style: .destructive, handler: {action in self.dataModel.eraseGameResults()}))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        gameResultTableView.reloadData()
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
