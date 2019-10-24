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
    var ground = SKSpriteNode()
    
    
    
    var mouseX:CGFloat = 0
    var mouseY:CGFloat = 0
    
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        createGround()
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveGround()
    }
    
    func createGround(){
        for i in 0...3{
            let ground = SKSpriteNode(imageNamed: "Images")
            ground.name = "Ground"
            ground.size = CGSize(width: (self.scene?.size.width)!, height: 250)
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 2))
            
            self.addChild(ground)
        }
    }
      
    func moveGround() {
        self.enumerateChildNodes(withName: "ground") { (node, error) in
            node.position.x -= 2
            
            if node.position.x < -((self.scene?.size.width)!){
                node.position.x += (self.scene?.size.width)! * 3
            }
        }
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
