//
//  userGuessResultViewController.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 5/6/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import UIKit

class UserGuessResultViewController:UIViewController{
    
    private var dataModel = numberBaseballModel.sharedInstance
    private var ResultString:String = ""
    private var cpuTurn = true
    
    
    @IBOutlet weak var guessResultViewTitleLabel: UILabel!
    @IBOutlet weak var guessResultLabel: UILabel!
    
    @IBOutlet weak var resultCommentLabel: UILabel!
    @IBOutlet weak var cpuGuessResultLabel: UILabel!
    
    @IBOutlet weak var cpuGuessNumberLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGuessResultLabel()
        setGuessResultComment()
        setCPUGuessandResult()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setGuessResultLabel(){
        var currentResult = dataModel.getRoundResult()

        guessResultLabel.text = currentResult.resultString()
        
    }
    func setGuessResultComment(){
        var currentResult = dataModel.getRoundResult()
        let count = currentResult.returnTotalCount()
        
        if count == 0{
            resultCommentLabel.text = "OH! This can be helpful!"
        }
        else if count == 1 {
            resultCommentLabel.text =
            "Not Bad! You got one!"
        }else if count == 2 {
            resultCommentLabel.text = "Got 2! That's a half!"
        }
        else if count == 3{
            resultCommentLabel.text = "What's the last number?!"
        }else if count == 4{
            if dataModel.checkVictor(guessed_number: currentResult){
                    resultCommentLabel.text =
                "Congratulations! You got it!"
                cpuTurn = false
            }
            else{
                resultCommentLabel.text = "Almost! Maybe next Round?"
            }
        }else{
            resultCommentLabel.text = "something went wrong..."
        }
        
    }
    
    func setCPUGuessandResult(){
        let cpuGuessNumber =  dataModel.makeGuess()
        let cpuGuessResult = dataModel.getComputerGuessResult(numbers: cpuGuessNumber)
        
        if cpuTurn{
            cpuGuessNumberLabel.text = "Computer's Guess Number:  " + cpuGuessNumber.numbersToString()
            if let nums = dataModel.getUserNumbers(){
            cpuGuessResultLabel.text =
                "Your number: " + nums.numbersToString() + " Result: " + cpuGuessResult.resultString()
            }
        }
        else {
            cpuGuessResultLabel.text = "End of the Game! see you nextTime"
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if (cpuTurn){
            dismiss(animated: true, completion: nil)
        }
        else{
            performSegue(withIdentifier: "unwindToHomeSegue", sender: self)
        }
    }
    
    
}

