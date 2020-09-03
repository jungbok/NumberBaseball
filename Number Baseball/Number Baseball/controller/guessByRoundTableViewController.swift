//
//  guessByRoundTableViewController.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 5/5/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import UIKit

class guessByRoundTableViewController: UITableViewController {
    
    @IBOutlet weak var guessByRoundTableView: UITableView!
    
    private var dataModel = numberBaseballModel.sharedInstance
    private var cpuGuessResult: [(Numbers, SBResult)] = []
    private var userGuessResult: [(Numbers, SBResult)] = []
    private var combinedResult: [[(Numbers, SBResult)]] = [[]]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cpuGuessResult = dataModel.getCPUGuessResultsbyRound()
        userGuessResult = dataModel.getUserGuessResultsbyRound()
        
        combinedResult.append(userGuessResult)
        combinedResult.append(cpuGuessResult)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        cpuGuessResult = dataModel.getCPUGuessResultsbyRound()
        userGuessResult = dataModel.getUserGuessResultsbyRound()
        
        combinedResult.append(userGuessResult)
        combinedResult.append(cpuGuessResult)
        
        guessByRoundTableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userGuessResult.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let guessCell = tableView.dequeueReusableCell(withIdentifier: "guess_cell", for: indexPath)

        // Configure the cell...
        //print("userGuessResult: ")
        //print(userGuessResult)
        
        if userGuessResult.count > 0{
         //print("game Result count > 0")
            let (numbers, result) = userGuessResult[indexPath.row]
            let numberToString = numbers.numbersToString()
            let resultToString = result.resultString()
            
            guessCell.detailTextLabel?.text = resultToString
            guessCell.textLabel?.text = numberToString
        }
        

        return guessCell
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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
