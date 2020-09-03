//
//  numberBaseballModel.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 4/27/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import Foundation

class numberBaseballModel{
    private var userSecretNumber: Numbers?
    private var computerSecretNumber: Numbers?
    private var userGuessResults: [Int: SBResult]?
    private var matched: Bool
    private var userSecretNumberSet: Bool
    private var gameResult:  [(name: String, numbers: Numbers)] = []
    private var cpuGuessResultByRound:[ (numbers: Numbers,result: SBResult)] = []
    private var userGuessResultByRound:[ (numbers: Numbers,result: SBResult)] = []
    private var userTurn: Int
    private var rounds: Int
    
    
    static let sharedInstance = numberBaseballModel()
    
    init(){
        //super.init()
        matched = false
        userSecretNumberSet = false
        // is it only gonna be 0 or 1
        userTurn = Int.random(in: 0..<2)
        rounds = 0
        
        //just checking for the result
        // eliminate later
        gameResult.append((name:"JungBok", numbers: Numbers(digit1: 3, digit2: 1, digit3: 5, digit4: 7)))
        //print(gameResult[0])
        userGuessResultByRound.append((Numbers(digit1: 1, digit2: 2, digit3: 3, digit4: 4 ), SBResult(strikes: 2, balls: 1)))
        
        cpuGuessResultByRound.append((Numbers(digit1: 9, digit2: 8, digit3: 7, digit4: 6 ), SBResult(strikes: 1, balls: 1)))
        
        userGuessResultByRound.append((Numbers(digit1: 7, digit2: 1, digit3: 5, digit4: 0 ), SBResult(strikes: 0, balls: 0)))
        
        cpuGuessResultByRound.append((Numbers(digit1: 1, digit2: 3, digit3: 4, digit4: 7 ), SBResult(strikes: 2, balls: 1)))
        
        //print((userGuessResultByRound[0]))
        
    }
    //required init(from decoder:Decoder) throws {
           
    //}
    /*
    private func load(){
        do{
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: questionFileLocation)
            numberBaseball = try decoder.decode([(name: String, number:Numbers)].self, from: data)
        }catch{
            print("load error")
        }
    
    }
    private func save(){
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(Numbers)
            let ResultData = try encoder.encode(SBResult)
            let jsonString = String(data: data, encoding: .utf8)!
            try jsonString.write(to: numberBaseballFileLocation, atomically: true, encoding: .utf8)
        }catch  {
            print("saving Error")
        }
        
    }
  */
    
    func getUserNumbers() -> Numbers? {
        return userSecretNumber
    }
    
    func setUserNumbers(digit1:Int, digit2:Int, digit3: Int, digit4: Int) {
        userSecretNumber = Numbers(digit1:digit1, digit2:digit2, digit3:digit3, digit4:digit4)
        userSecretNumberSet = true
    }

    func setCPURandomNumbers() {
        let firstNum = Int.random(in: 1..<10)
        var secondNum = Int.random(in: 0..<10)
        var thridNum = Int.random(in:0..<10)
        var forthNum = Int.random(in:0..<10)
        var sameNumber = true
        // setting a unique second digit num randomly
        while sameNumber{
            secondNum = Int.random(in: 0 ..< 10)
            if (firstNum != secondNum){
                sameNumber = false
            }
        }
        // setting a unique thrid digit num randomly
        sameNumber = true
        while sameNumber{
            thridNum = Int.random(in: 0 ..< 10)
            if (firstNum != thridNum) && (secondNum != thridNum){
                sameNumber = false
            }
        }
        
        sameNumber = true
        while sameNumber{
            forthNum = Int.random(in: 0 ..< 10)
            if (firstNum != forthNum) && (secondNum != forthNum) && (thridNum != forthNum){
                sameNumber = false
            }
        }
        
        computerSecretNumber = Numbers(digit1:firstNum, digit2:secondNum, digit3:thridNum, digit4:forthNum)
        
        print(computerSecretNumber!)
        
    }
    
    func getRandomNumbers() -> Numbers{
        let firstNum = Int.random(in: 1..<10)
        var secondNum = Int.random(in: 0..<10)
        var thridNum = Int.random(in:0..<10)
        var forthNum = Int.random(in:0..<10)
        var sameNumber = true
        // setting a unique second digit num randomly
        while sameNumber{
            if (firstNum != secondNum){
                sameNumber = false
            }
            secondNum = Int.random(in: 0 ..< 10)
        }
        // setting a unique thrid digit num randomly
        sameNumber = true
        while sameNumber{
            if (firstNum != thridNum) && (secondNum != thridNum){
                sameNumber = false
            }
            thridNum = Int.random(in: 0 ..< 10)
        }
        
        sameNumber = true
        while sameNumber{
            if (firstNum != forthNum) && (secondNum != forthNum) && (thridNum != forthNum){
                sameNumber = false
            }
            forthNum = Int.random(in: 0 ..< 10)
        }
        
        let numbers = Numbers(digit1: firstNum, digit2: secondNum, digit3: thridNum, digit4: forthNum)
        
        //print(numbers)
        return numbers
    }
    
    func compareGuesses(guessedNumber:Numbers, userDidGuess: Bool) -> SBResult {
        var guess_result = SBResult(strikes: 0, balls: 0)
        //var secretNumber: Numbers?
        let guessNumberDict = guessedNumber.getNumberDict()
        
        // two cases:
        // case 1: if userGuessed and comparing the number with computer's secretNum
        // userDidGuess is true
        if userDidGuess{
            // if the Computer's secrete number is not null, set secretNumber to be computer's secretNumber
            if let secretNumber = computerSecretNumber{
                // getDictionary of numbers
                let secretNumberDict = secretNumber.getNumberDict()
                // brute force compare n
                var secretNumberDigit = 1
                while (secretNumberDigit <= 4){
                    // get the number of secret digit #
                    let secretNum = secretNumberDict[secretNumberDigit]
                    // iterate through guessed number dictionary
                    for (key, guessedNumber) in guessNumberDict{
                        if (guessedNumber == secretNum){
                            if (key == secretNumberDigit){
                                guess_result.increseStrikes()
                                print("user check1 " + String(key) + " : " + String(secretNumberDigit))
                            }
                            else{
                                print("user check2 " + String(key) + " : " + String(secretNumberDigit))
                                guess_result.increseBalls()
                            }
                        }
                    }
                    secretNumberDigit += 1
                }
            }
            
        }
        // case 2: computer's turn to guess
        else{
            if let secretNumber = userSecretNumber{
                // getDictionary of numbers
                let secretNumberDict = secretNumber.getNumberDict()
                // brute force compare n
                var secretNumberDigit = 1
                while (secretNumberDigit <= 4){
                    // get the number of secret digit #
                    let secretNum = secretNumberDict[secretNumberDigit]
                    // iterate through guessed number dictionary
                    for (digit, guessedNumber) in guessNumberDict{
                        if (guessedNumber == secretNum){
                                if (digit == secretNumberDigit){
                                    //print("check")
                                    guess_result.increseStrikes()
                                }else{
                                    //print("check2")
                                    guess_result.increseBalls()
                                }
                        }
                        
                    }
                    secretNumberDigit += 1
                }
            }
            
        }
        return guess_result
    }
    
    func setUserGuessNumber(numbers:Numbers){
        let userGuessResult = compareGuesses(guessedNumber: numbers, userDidGuess: true)
        userGuessResultByRound.append((numbers, userGuessResult))
        //print(userGuessResult)
    }
    
    func getRoundResult() -> SBResult{
        var temp = SBResult(strikes: 0,
                            balls: 0)
        if (userGuessResultByRound.count > 0){
            let lastIndex = userGuessResultByRound.count - 1
            let (number, result) = userGuessResultByRound[lastIndex]
            temp = result
        }
        return temp
    }
    
    // play the game
    /*
    func play() -> String{
        // check if each secrete numbers are saved
        var winner = ""
        if (computerSecretNumber == nil) || (userSecretNumber == nil){
            print("error" )
            return winner
        }
        
        // until victor comes out
        while !matched{
            // if it is user's turn
            if userTurn == 0{
                
                
                
            }else{
                
            }
            
            
            
            
            
            
            
            
        }
    }
     */
    // fucntion to check if the game ended due to player/cpu making 4 strkies
    // return true if there is a victor
    func checkVictor(guessed_number: SBResult) -> Bool{
        if guessed_number.getNumberofStrikes() == 4{
            matched = true
        }
        return matched
    }
    
    func updateVictor(name: String, number: Numbers){
        gameResult.append((name: name, numbers: number))
    }
       
    // Returns who's turn is it
    // 1 for user's turn to attack
    // 0 for cpu's turn to attack
    func getTurns() -> Int{
        return userTurn
    }
       
    //play a round of the game
    //func playComputerRound(){
    //    let computer_guess_number = computerMakeGuess()
    //}
    func getComputerGuessResult(numbers:Numbers) -> SBResult{
        let result = compareGuesses(guessedNumber: numbers, userDidGuess: false)
        cpuGuessResultByRound.append((numbers: numbers, result: result))
        
        return result
    }
    
    
    func makeGuess() -> Numbers{
        //var computer_guess: Numbers?
        //var numbersArray = [0,1,2,3,4,5,6,7,8,9]
        var tempNumbers = Numbers(digit1: -1, digit2: -1, digit3: -1, digit4: -1)
        
        var max = 0
        
        for (numbers, results) in cpuGuessResultByRound{
            let count = results.returnTotalCount()
            if (count > max) {
                max = count
                tempNumbers = numbers
            }
        }
        
        let d1 = tempNumbers.getDigit1()
        let d2 = tempNumbers.getDigit2()
        let d3 = tempNumbers.getDigit3()
        let d4 = tempNumbers.getDigit4()
        //for
        //return computer_guess
        if (d1 < 0) || (d2 < 0) || (d3 < 0) || (d4 < 0){
            tempNumbers = getRandomNumbers()
        }
        else{
            var numbersArray = [d1, d2, d3, d4]
            var newNumberArray:[Int] = []
            var digits = 4
            while  digits > 0{
                if max > 0 {
                    let digit =  numbersArray.remove(at: Int.random(in: 0..<numbersArray.count))
                    //print(digit)
                    newNumberArray.append(digit)
                    max = max - 1
                    digits = digits - 1
                }
                else{
                    let digit = Int.random(in: 0..<10)
                    var accept = true
                    for num in newNumberArray{
                        print(num)
                        if num == digit{
                            accept = false
                        }
                    }
                    if accept{
                        newNumberArray.append(digit)
                        digits = digits - 1
                    }
                }
                
            }
            tempNumbers = Numbers(digit1: newNumberArray[0], digit2: newNumberArray[1], digit3: newNumberArray[2], digit4: newNumberArray[3])
        }
        //print(tempNumbers)
        
        return tempNumbers
    }
       
    //returns all the results of each round's cpu guess in one game
    func getCPUGuessResultsbyRound() -> [(Numbers,SBResult)]{
        return cpuGuessResultByRound
    }
       
    //returns all the results of each round's user guess in one game
    func getUserGuessResultsbyRound() -> [(Numbers,SBResult)]{
        return userGuessResultByRound
    }
    
    
    func getGameResults() -> [(name:String, numbers:Numbers)]{
        return gameResult
        
    }
    
    func eraseGameResults(){
        gameResult.removeAll()
    }
    
       
    // add later
    // func getGameResultDictionary()
    // save Button
    //func Save()
    
}
