//
//  ViewController.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 4/22/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import UIKit
import SpriteKit
//import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var firstPageSKview: SKView!
    //@IBOutlet weak var googleButton: GIDSignInButton!
    
    @IBOutlet weak var firstSceneTitleLabel: UILabel!
    @IBOutlet weak var firstPagePlayButton: UIButton!
    
    @IBOutlet weak var firstPageLoadButton: UIButton!
    
    @IBOutlet weak var firstPageRulesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let view = firstPageSKview as SKView?{
            if let scene = SKScene(fileNamed: "firstPageSkScene"){
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
                //print("check1")
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
        
       // GIDSignIn.sharedInstance()?.presentingViewController = self

        
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue){
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "setUpGameSegue", sender: self)
    }
    
    
    @IBAction func loadButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func rulesButtonTapped(_ sender: UIButton) {
    }
    

}

