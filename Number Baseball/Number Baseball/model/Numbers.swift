//
//  numbers.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 4/27/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import Foundation

struct Numbers:Equatable, Codable{
    private var digit1: Int
    private var digit2: Int
    private var digit3: Int
    private var digit4: Int
    private var numDictionary = [Int:Int]()
    
    
    init(digit1: Int, digit2: Int, digit3: Int, digit4: Int){
        self.digit1 = digit1
        self.digit2 = digit2
        self.digit3 = digit3
        self.digit4 = digit4
        numDictionary = [1:digit1, 2:digit2, 3:digit3, 4:digit4]
    }
    
    func getNumberDict() -> [Int:Int]{
        return self.numDictionary
    }
    
    func getDigit1() -> Int{
        return digit1
    }
    func getDigit2() -> Int{
        return digit2
    }
    func getDigit3() -> Int{
        return digit3
    }
    func getDigit4() -> Int{
        return digit4
    }
    
    func numbersToString() -> String{
        var toString = ""
        toString = String(digit1) + " " + String(digit2) + " " + String(digit3) + " " + String(digit4)
        
        
        return toString
    }
}
