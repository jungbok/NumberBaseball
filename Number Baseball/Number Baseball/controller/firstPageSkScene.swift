//
//  firstPageSKScene.swift
//  Number Baseball
//
//  Created by Jung Bok Lee on 5/5/20.
//  Copyright © 2020 Jung Bok Lee. All rights reserved.
//

import SpriteKit

class firstPageSkScene:SKScene{
    var baseball: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        if let baseballNode = childNode(withName: "baseBall") as? SKSpriteNode{
            baseball = baseballNode
        }
    }
}
