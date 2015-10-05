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

    var cardNodes: [SKSpriteNode]?
    let moveNode = SKSpriteNode(imageNamed: "card0_4-hd")
    
    init(position: CGPoint, sizeScale scale: TGCScale) {
        super.init()
        let cardControlPlaceNode = SKSpriteNode(imageNamed: "zijicaozuolan_1-hd")
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

let aCardNodeSize: CGFloat = 30.0

class TGCCardNumAndBloodNumNode: SKNode {
    
    var cardNumberLabel = SKLabelNode()
    var cardNumber: UInt = 0 {

        willSet {
            if newValue > 99 {
                cardNumberLabel.fontSize = 18.0
            } else {
                cardNumberLabel.fontSize = 26.0
            }
            cardNumberLabel.text = "\(newValue)"
        }
    }
    
    init(cardNumber card: UInt, bloodNumber blood: Int) {
        cardNumber = card
        super.init()
        
        let backgroundLableNode = SKSpriteNode(color: UIColor(white: 0.3, alpha: 0.6), size: CGSize(width: aCardNodeSize, height: aCardNodeSize))
        backgroundLableNode.anchorPoint = CGPointZero
        cardNumberLabel.verticalAlignmentMode = .Center
        cardNumberLabel.fontSize = 26.0
        cardNumberLabel.text = "\(card)"
        cardNumberLabel.position = CGPoint(x: aCardNodeSize / 2, y: aCardNodeSize / 2)
        backgroundLableNode.addChild(cardNumberLabel)
        
        let bloodNode = TGCBloodNumberNode(bloodNumber: blood)
        bloodNode.position = CGPoint(x: (aCardNodeSize - CGRectGetWidth(bloodNode.calculateAccumulatedFrame())) / 2, y: -CGRectGetHeight(bloodNode.calculateAccumulatedFrame()) - 2)
        
        self.addChild(backgroundLableNode)
        self.addChild(bloodNode)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

let aBloodTextureWidth = 19
let aBloodTextureHeight = 18

class TGCBloodNumberNode: SKNode {
    
    static let bloodTexture = SKTexture(imageNamed: "xuege-hd")
    let redBloodTexture = SKTexture(rect: CGRect(x: 0, y: 0, width: CGFloat(1) / CGFloat(3), height: 1), inTexture: TGCBloodNumberNode.bloodTexture)
    let yellowBloodTexture = SKTexture(rect: CGRect(x: CGFloat(1) / CGFloat(3), y: 0, width: CGFloat(1) / CGFloat(3), height: 1), inTexture: TGCBloodNumberNode.bloodTexture)
    let greyBloodTexture = SKTexture(rect: CGRect(x: CGFloat(2) / CGFloat(3), y: 0, width: CGFloat(1) / CGFloat(3), height: 1), inTexture: TGCBloodNumberNode.bloodTexture)
    var bloodNumber: Int = 0 {
        
        willSet {
            
        }
    }
    
    init(bloodNumber number: Int) {
        bloodNumber = number
        super.init()
        for count in 0...2 {
            let bloodNode = SKSpriteNode(texture: redBloodTexture)
            bloodNode.name = "\(count)"
            bloodNode.anchorPoint = CGPointZero
            bloodNode.position = CGPoint(x: 0, y: count * aBloodTextureHeight)
            self.addChild(bloodNode)
        }
        if number >= 4 {
            let bloodNode = SKSpriteNode(texture: redBloodTexture)
            bloodNode.name = "3"
            bloodNode.anchorPoint = CGPointZero
            bloodNode.position = CGPoint(x: 0, y: 3 * aBloodTextureHeight)
            self.addChild(bloodNode)
            if number >= 5 {
                bloodNode.texture = yellowBloodTexture
                if number == 6 {
                    (self.childNodeWithName("2") as! SKSpriteNode).texture = yellowBloodTexture
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}