//
//  playGameViewController.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 5/6/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import UIKit
import SwiftUI

class playGameViewController:UIViewController, UITextFieldDelegate{
    private var datamodel = numberBaseballModel.sharedInstance
    
    @IBOutlet weak var digit1TextField: UITextField!
    
    @IBOutlet weak var digit2TextField: UITextField!
    @IBOutlet weak var digit3TextField: UITextField!
    @IBOutlet weak var digit4TextField: UITextField!
    
    @IBOutlet weak var guessButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //perform(#selector(presentCurrentController), with: nil, afterDelay: 0)
        digit1TextField.delegate = self
        digit2TextField.delegate = self
        digit3TextField.delegate = self
        digit4TextField.delegate = self
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //let setUpGameVC = self.storyboard?.instantiateViewController(identifier:"secondvc") as! SetUpGameViewController
        //self.present(setUpGameVC, animated: true, completion: nil)
    }
    
    /*
    @objc private func presentCurrentController(){
        let sb = UIStoryboard(name: "Main.storyboard", bundle: nil)
        let view = sb.instantiateViewController(identifier: "secondvc") as SetUpGameViewController
        present(view,animated: true)
    }
     */
    
     @IBAction func tapRecognized(_ sender: UITapGestureRecognizer) {
        digit1TextField.resignFirstResponder()
            digit2TextField.resignFirstResponder()
            digit3TextField.resignFirstResponder()
            digit4TextField.resignFirstResponder()
            
                enableGuessButton()
            
        }
    @IBAction func guessButtonDidTapped(_ sender: UIButton) {
        

    
            var digit1 = -1
            var digit2 = -1
            var digit3 = -1
            var digit4 = -1
            
            if let one = digit1TextField?.text{
                digit1 = Int(one) ?? -2
            }
            if let two = digit2TextField?.text{
                digit2 = Int(two) ?? -2
            }
            if let three = digit3TextField?.text{
                digit3 = Int(three) ?? -2
            }
            if let four = digit4TextField?.text{
                digit4 = Int(four) ?? -2
            }
            
            
            let guessNumber = Numbers(digit1: digit1, digit2: digit2, digit3: digit3, digit4: digit4)
        
        datamodel.setUserGuessNumber(numbers: guessNumber)
            //print(datamodel.getUserNumbers()?.numbersToString())
            
        DispatchQueue.main.async {
            [weak self] in self?.performSegue(withIdentifier: "guessSegue", sender: self)
        }
        
        
        }
      /*
        // if button is tapped, check what is next empty textfield and plug the number
        @IBAction func button0Tapped(_ sender: UIButton) {
            
            plugNumberInTextField(number:0)
            number0Button.isEnabled = false
        }
    */
        
        func plugNumberInTextField(number:Int){
            if digit1TextField?.text == nil{
                digit1TextField?.text = String(number)
                return
            }
            
            if digit2TextField?.text == nil{
                digit2TextField?.text = String(number)
                return
            }
            
            if digit3TextField?.text == nil{
                digit3TextField?.text = String(number)
                return
            }
            
            if digit4TextField?.text == nil{
                digit4TextField?.text = String(number)
                return
            }
            return
            
        }
        
        func enableGuessButton() {
            
           // print("enable button check")
            
            var digit1 = -1
            var digit2 = -1
            var digit3 = -1
            var digit4 = -1
            
            if let one = digit1TextField?.text{
                digit1 = Int(one) ?? -2
            }
            if let two = digit2TextField?.text{
                digit2 = Int(two) ?? -2
            }
            if let three = digit3TextField?.text{
                digit3 = Int(three) ?? -2
            }
            if let four = digit4TextField?.text{
                digit4 = Int(four) ?? -2
            }
            //print(digit1)
            //print(digit2)
            //print(digit3)
            //print(digit4)
            if(digit1 >= 0 && digit2 >= 0 && digit3 >= 0 && digit4 >= 0){
                if (digit1 != digit2) && (digit1 != digit3) && (digit1 != digit4){
                    if (digit2 != digit3) && digit2 != digit4{
                        if(digit3 != digit4){
                            guessButton.isEnabled = true
                            
                            print("Guess  button enabled")
                        }
                    }
                }
            }
        }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC: UserGuessResultViewController = segue.destination as! UserGuessResultViewController
        
        destVC.ResultString =
    }
 */
    
    /*
    @IBAction func onCloseButton(_ sender: UIButton) {
        
        print("closed button tapped")
        let alert = UIAlertController(title: "Are you sure to leave?", message: "Game will not be saved", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title:"Yes", style: .destructive, handler: {action in self.dismiss(animated: true, completion: nil)}))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
 */
 
    
}
