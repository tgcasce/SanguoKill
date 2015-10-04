//
//  GameScene.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/9/16.
//  Copyright (c) 2015年 MaulynTang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let backgroundNode = SKSpriteNode(texture: SKTexture(imageNamed: ""), size: CGSizeMake(screenWidth, screenHeight))
    let myControlNode = TGCMyControlPlaceNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundNode.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(backgroundNode)
        
        self.addChild(myControlNode)
        print(myControlNode)
        NSLog("%@", myControlNode.children)

        
//        cropNode.maskNode?.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.moveByX(0, y: 80, duration: 2), SKAction.moveByX(0, y: -80, duration: 2), SKAction.moveByX(-300, y: 0, duration: 2), SKAction.moveByX(300, y: 0, duration: 2)])))
        
//        let bottomConstraint = SKConstraint.positionY(SKRange(constantValue: 0))
//        let bottomNode = self.childNodeWithName("SKSpriteNode_0") as! SKSpriteNode
//        bottomNode.size = CGSizeMake(self.size.width, bottomNode.size.height)
        //        bottomNode.constraints = [bottomConstraint]
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
   
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(myControlNode)
            let previousLocation = touch.previousLocationInNode(myControlNode)
            
            let deltaX = (location.x - previousLocation.x) / xGameScale
            let deltaY = (location.y - previousLocation.y) / yGameScale
            myControlNode.moveTo(position: CGPoint(x: myControlNode.movePosition().x + deltaX, y: myControlNode.movePosition().y + deltaY))
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
