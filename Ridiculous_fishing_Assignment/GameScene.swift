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
    var play:SKSpriteNode!
         var SPEEDLimit: CGFloat = 200
    var scoreLabel:SKLabelNode!

    var mouseX:CGFloat = 0
    var mouseY:CGFloat = 0
    var direction: String = ""
    var numLoops = 0
     var score = 0
    
    override func didMove(to view: SKView) {
        
        water = SKSpriteNode(imageNamed: "water")
       
        mud = SKSpriteNode(imageNamed: "mud")
   
         play = SKSpriteNode(imageNamed: "play")
        hook = SKSpriteNode(imageNamed: "hook")
       hook.position = CGPoint(x: 589.175, y: 640)

        addChild(hook)
        rope = SKSpriteNode(imageNamed: "rope")
        addChild(rope)
        
        
        self.scoreLabel = SKLabelNode(text: "Score: \(self.score)")
        self.scoreLabel.position = CGPoint(x:500, y:1100)
        self.scoreLabel.fontColor = UIColor.black
        self.scoreLabel.fontSize = 40
        self.scoreLabel.fontName = "Avenir"
        addChild(self.scoreLabel)
        
        
        
        
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
    var badfishes:[SKSpriteNode] = []
    
    func spawnbadfishes() {
        let badImages = ["badfish","badfish-1","badfish-2"]
         let r1 = Int(CGFloat.random(in: 1 ... 3))
 let badfish = SKSpriteNode(imageNamed: badImages[r1])
        let randomXPos = CGFloat.random(in: 100 ... 550 )
        let randomYPos = CGFloat.random(in: 0 ... 320)
        badfish.position = CGPoint(x:randomYPos, y:randomXPos)
        addChild(badfish)
        self.badfishes.append(badfish)
        
        for (_, badfish) in self.badfishes.enumerated() {
            if( self.direction == "right"){
                badfish.position.x = badfish.position.x + 200
                
                if (badfish.position.x >= size.width) {
                    self.direction = "left"
                }
            }else if (badfish.position.x <= 0 ){
                
                badfish.position.x = badfish.position.x - 200
                
                self.direction = "right"
            }
            
        }
    }
    
    
func spawnFish() {
        
        let fishesImages = ["fish","fish-1","fish-2","fish-3","fish-4","fish-6"]
        
        let r = Int(CGFloat.random(in: 1 ... 6))
           let fish = SKSpriteNode(imageNamed: fishesImages[r])
           
           // generate a random x position
           
        let randomXPos = CGFloat.random(in: 100 ... 550 )
           let randomYPos = CGFloat.random(in: 0 ... 320)
           fish.position = CGPoint(x:randomYPos, y:randomXPos)
           
           // add the cat to the screen
           addChild(fish)
           
           // add the cat to the array
          self.fishes.append(fish)
        
//        if(fishes.count <= 10){
//        fish.removeFromParent()
//        }
      for (_, fish) in self.fishes.enumerated() {
        if( self.direction == "right"){
           
        
 fish.position.x = fish.position.x + 200
            
            if (fish.position.x >= size.width) {
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
                
                self.hook.position.x=location.x
               // self.hook.position.y=loctaion.y
            //        self.rope.position.x = location.x
            //        self.water.position.x = location.x
            //        self.mud.position.x=location.x
        
        self.mouseX = location.x
        self.mouseY = location.y

//                     print("location: \(mouseTouch!.location(in: self.view))")
//                     let nodeTouched = atPoint(location).name
//                     if(nodeTouched == "play"){
//
//        let  moveUp = SKAction.moveBy(x: 0, y:self.SPEEDLimit, duration: 1)
//                         self.hook.run(moveUp)

        
        }
    
    func movehook(mouseXPosition:CGFloat, mouseYPostion:CGFloat) {
        
       
        let a = (self.mouseX - self.hook.position.x);
        let b = (self.mouseY - self.hook.position.y);
        let distance = sqrt((a * a) + (b * b))
        
        // 2. calculate the "rate" to move
        let xn = (a / distance)
        let yn = (b / distance)
        
        // 3. move the bullet
        self.hook.position.x = self.hook.position.x + (xn * 5);
        self.hook.position.y = self.hook.position.y + (yn * 5);
        
    }
   

    
    
    override func update(_ currentTime: TimeInterval){
        movehook(mouseXPosition: self.mouseX, mouseYPostion: self.mouseY)
        
    numLoops = numLoops + 1
        if (numLoops % 80 == 0) {
            self.spawnFish()
            self.spawnbadfishes()
        }
        
        for (index , fish) in self.fishes.enumerated() {
            if (self.hook.frame.intersects(fish.frame) == true) {
                // increase teh score & update the label
                self.score = self.score + 1
                self.scoreLabel.text = "Score: \(self.score)"
                fish.removeFromParent()
                // remove cat from array
                self.fishes.remove(at:index)
                
//
                
                
                for (index , badfish) in self.badfishes.enumerated() {
                    if (self.hook.frame.intersects(badfish.frame) == true) {
                        // increase teh score & update the label
                        self.score = self.score - 1
                        self.scoreLabel.text = "Score: \(self.score)"
                        badfish.removeFromParent()
                        // remove cat from array
                        self.badfishes.remove(at:index)
                
            }
        }
                
              
    }


}


}
}
