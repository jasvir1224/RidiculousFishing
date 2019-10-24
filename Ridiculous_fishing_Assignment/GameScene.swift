//
//  GameScene.swift
//  Ridiculous_fishing_Assignment
//
//  Created by Jasvir Kaur on 2019-10-23.
//  Copyright © 2019 Lampton. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var water: SKSpriteNode!
    var mud: SKSpriteNode!
    
    
    var mouseX:CGFloat = 0
    var mouseY:CGFloat = 0
    
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)
    }
    
    
    var fish:[SKSpriteNode] = []
    
    func spawnfish() {
        // Add a cat to a static location
        let fish = SKSpriteNode(imageNamed: "fish")
        
        // generate a random x position
        
        let randomXPos = CGFloat.random(in: 0 ... size.width)
        let randomYPos = CGFloat.random(in: 300 ... -320)
        fish.position = CGPoint(x:randomXPos, y:randomYPos)
        
        // add the cat to the screen
        addChild(fish)
        
        // add the cat to the array
        self.fish.append(fish)
        
    }
}
