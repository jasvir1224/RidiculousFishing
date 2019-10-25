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
    
    var flag:Bool = false
     var SPEEDLimit: CGFloat = 400
    
    var mouseX:CGFloat = 0
    var mouseY:CGFloat = 0
    var direction: String = ""
    var numLoops = 0
    
    override func didMove(to view: SKView) {
        
        water = SKSpriteNode(imageNamed: "water")
       
        mud = SKSpriteNode(imageNamed: "mud")
       mud.position = CGPoint(x: 365.208, y: 81.018)
addChild(mud)
        
        hook = SKSpriteNode(imageNamed: "hook")
        addChild(hook)
        rope = SKSpriteNode(imageNamed: "rope")
        addChild(rope)
        
        
        
    //    let fishmove1  = SKAction.moveBy(x: GFloat, y: <#T##CGFloat#>, duration: <#T##TimeInterval#>)
        
    let move1 = SKAction.moveBy(x: 0, y: 10, duration: 1)
     let move2 = SKAction.moveBy(x: 0, y: -20, duration: 1)
     //small plants are moving
    self.enumerateChildNodes(withName: "smallplants"){
                     (node, stop) in
        self.smallplants = (node as! SKSpriteNode)
                     let Animation = SKAction.sequence([move1,move2,move1])
                     
                     let foreverMove = SKAction.repeatForever(Animation)
                     self.smallplants.run(foreverMove)
                    }
    
        self.enumerateChildNodes(withName: "bush"){
            (node, stop) in
            self.bush = (node as! SKSpriteNode)
            let Animation = SKAction.sequence([move1,move2,move1])
            
            let foreverMove = SKAction.repeatForever(Animation)
            self.bush.run(foreverMove)
           }
        
}
    
    
     var fishes:[SKSpriteNode] = []
       
       func spawnFish() {
        
        let fishesImages = ["fish","fish-1","fish-2","fish-3","fish-4","fish-6","fish-7","fish-8","fish-9"]
        
        let r = Int(CGFloat.random(in: 1 ... 9))

           // Add a cat to a static location
           let fish = SKSpriteNode(imageNamed: fishesImages[r])
           
           // generate a random x position
           
        let randomXPos = CGFloat.random(in: 0 ... 650 )
           let randomYPos = CGFloat.random(in: -320 ... 320)
           fish.position = CGPoint(x:randomYPos, y:randomXPos)
           
           // add the cat to the screen
           addChild(fish)
           
           // add the cat to the array
        self.fishes.append(fish)
        
//        if(fishes.count <= 10){
//        fish.removeFromParent()
//        }
      for (index, fish) in self.fishes.enumerated() {
        if( self.direction == "right"){
            fish.position.x = fish.position.x + 200
            
            if (fish.position.x >= size.width) {
                // bounce off left wall
               self.direction = "left"
            }
        }else if (fish.position.x <= 0 ){

        fish.position.x = fish.position.x - 200
            
            self.direction = "right"

       }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let mouseTouch = touches.first
                     if( mouseTouch == nil){
                         return
                     }
             let location = mouseTouch!.location(in: self)
             
    //
                self.hook.position.x=location.x
    //         self.rope.position.x = location.x
    //         self.water.position.x = location.x
    //         self.mud.position.x=location.x

             print("location: \(mouseTouch!.location(in: self.view))")
             let nodeTouched = atPoint(location).name
             if(nodeTouched == "rope"){
                 // flag = true

               let moveUp: SKAction
               var moveDown: SKAction
                moveUp = SKAction.moveBy(x: 0, y: self.SPEEDLimit-400, duration: 1)
                 
               
                self.hook.run(moveUp)

                 //5. Time to spawn random fishes

             }
            
        }
    
   
    
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

