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
    
    override init() {
        super.init()
        
        let myControlScene = SKScene.unarchiveFromFile("MyControlPlace") as! SKScene
        let myControlNode = myControlScene.childNodeWithName("MyControlPlace") as! SKSpriteNode
        myControlNode.removeFromParent()
        
        xGameScale = (screenWidth - 20) / myControlNode.size.width
        yGameScale = (screenHeight / 3) / myControlNode.size.height
        myControlNode.xScale = xGameScale
        myControlNode.yScale = yGameScale
        
        myCardControlPlaceNode = TGCMyCardAndSkillControlPlaceNode.init(position: CGPoint(x: 258.714, y: 0), sizeScale: TGCScale(xScale: xGameScale, yScale: yGameScale))
        
        myControlNode.addChild(myCardControlPlaceNode)
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
