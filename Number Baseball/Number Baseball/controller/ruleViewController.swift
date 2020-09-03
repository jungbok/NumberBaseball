//
//  ruleViewController.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 5/6/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import UIKit
import CoreText

class ruleViewController: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context:CGContext = UIGraphicsGetCurrentContext() else { return }
        
        context.textMatrix = CGAffineTransform.identity
        context.translateBy(x: 0, y: self.bounds.size.height)
        
        let path = CGMutablePath()
        path.addRect(self.bounds)
        
        let str = NSMutableAttributedString(string: " The numerical version of the game is usually played with 4 digits, but can also be played with 3 or any other number of digits. On a sheet of paper, the players each write a 4-digit secret number. The digits must be all different. Then, in turn, the players try to guess their opponent's number who gives the number of matches. If the matching digits are in their right positions, they are STRIKES, if in different positions, they are BALLS. Example: Secret number: 4271 Opponent's try: 1234 Answer: 1 Strike and 2 Balls. (The Strike is 2, the Balls are 4 and 1.)The first one to reveal the other's secret number in the least number of guesses wins the game.")
        //str.addAttribute(NSAttributedS, value: <#T##Any#>, range: <#T##NSRange#>)
        let frameSetter = CTFramesetterCreateWithAttributedString(str)
        
        let ctFrame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, str.length), path, nil)
        
        CTFrameDraw(ctFrame, context)
        
    
    }

}
