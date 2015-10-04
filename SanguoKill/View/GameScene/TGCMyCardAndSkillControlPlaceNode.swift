//
//  TGCMyCardAndSkillControlPlaceNode.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/10/2.
//  Copyright © 2015年 MaulynTang. All rights reserved.
//

import SpriteKit

struct TGCScale {
    var xScale: CGFloat
    var yScale: CGFloat
}

class TGCMyCardAndSkillControlPlaceNode: SKNode {

    let moveNode = SKSpriteNode(imageNamed: "card0_4-hd")
    
    init(position: CGPoint, sizeScale scale: TGCScale) {
        super.init()
        let cardControlPlaceNode = SKSpriteNode.init(imageNamed: "zijicaozuolan_1-hd")
        cardControlPlaceNode.anchorPoint = CGPointZero
        cardControlPlaceNode.xScale = scale.xScale
        cardControlPlaceNode.yScale = scale.yScale
        cardControlPlaceNode.position = CGPoint(x: position.x * scale.xScale, y: position.y * scale.yScale)
        
        let maskNode = SKShapeNode(rect: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        maskNode.strokeColor = UIColor.clearColor()
        maskNode.fillColor = UIColor.clearColor()
        
        let childOne = SKShapeNode(rect: CGRect(x: 0, y: cardControlPlaceNode.size.height, width: screenWidth, height: screenHeight - cardControlPlaceNode.size.height))
        childOne.fillColor = UIColor.whiteColor()
        let childTwo = SKShapeNode(rect: CGRect(x: cardControlPlaceNode.position.x, y: 0, width: cardControlPlaceNode.size.width, height: cardControlPlaceNode.size.height))
        childTwo.fillColor = UIColor.whiteColor()
        maskNode.addChild(childOne)
        maskNode.addChild(childTwo)
        
        let cropNode = SKCropNode()
        cropNode.maskNode = maskNode
        cropNode.xScale = 1 / scale.xScale
        cropNode.yScale = 1 / scale.yScale
        cropNode.addChild(cardControlPlaceNode)
        
        moveNode.anchorPoint = CGPointZero
        moveNode.position = CGPoint(x: 1, y: moveNode.size.height / 2 - 3)
        cardControlPlaceNode.addChild(moveNode)
        
        self.addChild(cropNode)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func moveTo(position position: CGPoint) {
        moveNode.position = position
    }
}

class TGCCardNumAndBloodNumNode: SKNode {
    
}
