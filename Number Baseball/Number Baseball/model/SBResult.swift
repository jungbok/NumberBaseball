//
//  SBResult.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 5/2/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import Foundation

struct SBResult:Equatable, Codable{
    private var numberOfStrikes: Int
    private var numberOfBalls: Int
    
    init(strikes: Int, balls: Int){
        numberOfBalls = balls
        numberOfStrikes = strikes
    }
    mutating func increseStrikes(){
        numberOfStrikes = numberOfStrikes + 1
    }
    
    mutating func increseBalls(){
        numberOfBalls = numberOfBalls + 1
    }
    
    func getNumberofStrikes() -> Int{
        return numberOfStrikes
    }
    
    func getNUmberofBalls() -> Int{
        return numberOfBalls
    }
    
    func returnTotalCount() -> Int{
        return numberOfStrikes + numberOfBalls
    }
    
    func resultString() -> String{
        let str = String(numberOfStrikes) + " S" + "  " + String(numberOfBalls) + " B"
        
        return str
    }
    
}
