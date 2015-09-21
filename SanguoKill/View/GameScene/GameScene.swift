//
//  GameScene.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/9/16.
//  Copyright (c) 2015年 MaulynTang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        let backgroundNode = SKSpriteNode(color: UIColor.purpleColor(), size:self.size)
        backgroundNode.position = CGPointMake(self.size.width / 2, self.size.height / 2)
        
//        let bottomConstraint = SKConstraint.positionY(SKRange(constantValue: 0))
//        let bottomNode = self.childNodeWithName("SKSpriteNode_0") as! SKSpriteNode
//        bottomNode.size = CGSizeMake(self.size.width, bottomNode.size.height)

//        bottomNode.constraints = [bottomConstraint]
        
        self.insertChild(backgroundNode, atIndex: 0)
        self.insertChild(myLabel, atIndex: 1)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"card0_2-hd")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
