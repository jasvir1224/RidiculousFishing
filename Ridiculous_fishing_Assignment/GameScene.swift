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
    var hook: SKSpriteNode!
    var rope: SKSpriteNode!
    var smallplants:SKSpriteNode!
    var bush:SKSpriteNode!
    

    
    
    var mouseX:CGFloat = 0
    var mouseY:CGFloat = 0
    
    
    override func didMove(to view: SKView) {
        
        water = SKSpriteNode(imageNamed: "water")
       
        mud = SKSpriteNode(imageNamed: "mud")
        
        
        hook = SKSpriteNode(imageNamed: "hook")
        addChild(hook)
        rope = SKSpriteNode(imageNamed: "rope")
        addChild(rope)
        
    let move1 = SKAction.moveBy(x: 0, y: 10, duration: 1)
     let move2 = SKAction.moveBy(x: 0, y: -20, duration: 1)
     //small plants are moving
    self.enumerateChildNodes(withName: "smallplants")
                 
                    {
                     (node, stop) in
                     self.smallplants = node as! SKSpriteNode
                     let Animation = SKAction.sequence([move1,move2,move1])
                     
                     let foreverMove = SKAction.repeatForever(Animation)
                     self.smallplants.run(foreverMove)
                    }
    
        self.enumerateChildNodes(withName: "bush")
        
           {
            (node, stop) in
            self.bush = node as! SKSpriteNode
            let Animation = SKAction.sequence([move1,move2,move1])
            
            let foreverMove = SKAction.repeatForever(Animation)
            self.bush.run(foreverMove)
           }
        
        
    }
    var fish:[SKSpriteNode] = []
    
    func spawnfish() {
        // Add a cat to a static location
        let fish = SKSpriteNode(imageNamed: "fish")
        
        // generate a random x position

  
      
    
     var fishes:[SKSpriteNode] = []
       
       func spawnFish() {
           // Add a cat to a static location
           let fish = SKSpriteNode(imageNamed: "fish-1")
           
           // generate a random x position
           
        let randomXPos = CGFloat.random(in: 0 ... size.width)
           let randomYPos = CGFloat.random(in: 0 ... size.height)
           fish.position = CGPoint(x:randomYPos, y:randomXPos)
           
           // add the cat to the screen
           addChild(fish)
           
           // add the cat to the array
        self.fishes.append(fish)
           
       }
    
    
    
    
    var numLoops = 0
    
    override func update(_ currentTime: TimeInterval) {
        

        // OPTION 1 for generating 1 cat every 2 seconds
        // -- Tie the cat spawn rate to the frame rate
        // -- The game loops 60 times per second (fps = 60)
        // -- Therefore, it will loop 120 times in 2 seconds
        // -- Detect when the the loop has run 120 times
        // -- When count = 120, spawn a cat
        numLoops = numLoops + 1
        if (numLoops % 120 == 0) {
            // make a cat
            self.spawnFish()

        }
}
}

