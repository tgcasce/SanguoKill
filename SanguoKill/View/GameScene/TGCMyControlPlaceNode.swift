//
//  TGCMyControlPlaceNode.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/10/2.
//  Copyright © 2015年 MaulynTang. All rights reserved.
//

import SpriteKit

class TGCMyControlPlaceNode: SKNode {
    var myCardControlPlaceNode: TGCMyCardAndSkillControlPlaceNode!
    var myCardAndBloodNumberNode: TGCCardNumAndBloodNumNode!
    
    override init() {
        super.init()
        
        let myControlScene = SKScene.unarchiveFromFile("MyControlPlace") as! SKScene
        let myControlNode = myControlScene.childNodeWithName("MyControlPlace") as! SKSpriteNode
        myControlNode.removeFromParent()
        
        xGameScale = (screenWidth - 20) / myControlNode.size.width
        yGameScale = (screenHeight / 3) / myControlNode.size.height
        myControlNode.xScale = xGameScale
        myControlNode.yScale = yGameScale
        
        myCardControlPlaceNode = TGCMyCardAndSkillControlPlaceNode(position: CGPoint(x: 258.714, y: 0), sizeScale: TGCScale(xScale: xGameScale, yScale: yGameScale))
        myCardAndBloodNumberNode = TGCCardNumAndBloodNumNode(cardNumber: 44, maxBloodNumber: 5)
        myCardAndBloodNumberNode.position = CGPoint(x: 3, y: 160)
        myCardAndBloodNumberNode.bloodNode.currentBlood = 4
        myCardAndBloodNumberNode.cardNumber = 100

        myControlNode.addChild(myCardControlPlaceNode)
        myControlNode.addChild(myCardAndBloodNumberNode)
        self.addChild(myControlNode)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func moveTo(position position: CGPoint) {
        myCardControlPlaceNode.moveTo(position: position)
    }
    
    func movePosition() -> CGPoint {
        return myCardControlPlaceNode.moveNode.position
    }
}

//extension SKSpriteNode {
//    
//    class func myCardAndSkillControlPlaceNode -> SKSpriteNode {
//        
//    }
//}
