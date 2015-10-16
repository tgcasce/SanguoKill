//
//  TGCCardNumAndBloodNumNode.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/10/16.
//  Copyright © 2015年 MaulynTang. All rights reserved.
//

import SpriteKit

let aCardNodeSize: CGFloat = 30.0

class TGCCardNumAndBloodNumNode: SKNode {
    
    var cardNumberLabel = SKLabelNode()
    var bloodNode: TGCBloodNumberNode!
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
    
    init(cardNumber card: UInt, maxBloodNumber blood: Int) {
        super.init()
        cardNumber = card
        
        let backgroundLableNode = SKSpriteNode(color: UIColor(white: 0.3, alpha: 0.6), size: CGSize(width: aCardNodeSize, height: aCardNodeSize))
        backgroundLableNode.anchorPoint = CGPointZero
        cardNumberLabel.verticalAlignmentMode = .Center
        cardNumberLabel.fontSize = 26.0
        cardNumberLabel.text = "\(card)"
        cardNumberLabel.position = CGPoint(x: aCardNodeSize / 2, y: aCardNodeSize / 2)
        backgroundLableNode.addChild(cardNumberLabel)
        
        bloodNode = TGCBloodNumberNode(maxBloodNumber: blood)
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
    private var maxBloodNumber: Int = 0
    var currentBlood: Int {
        
        get {
            return self.currentBlood
        }
        set {
            if newValue > self.maxBloodNumber {
                return
            }
            if newValue >= 5 {
                (self.childNodeWithName("blood3") as! SKSpriteNode).texture = yellowBloodTexture
                if newValue == 6 {
                    (self.childNodeWithName("blood2") as! SKSpriteNode).texture = yellowBloodTexture
                } else {
                    (self.childNodeWithName("blood2") as! SKSpriteNode).texture = redBloodTexture
                }
                (self.childNodeWithName("blood1") as! SKSpriteNode).texture = redBloodTexture
                (self.childNodeWithName("blood0") as! SKSpriteNode).texture = redBloodTexture
            } else if newValue <= 0 {
                for count in 0...2 {
                    (self.childNodeWithName("blood\(count)") as! SKSpriteNode).texture = greyBloodTexture
                }
                if maxBloodNumber > 3 {
                    (self.childNodeWithName("blood3") as! SKSpriteNode).texture = greyBloodTexture
                }
            } else {
                for count in 0...2 {
                    (self.childNodeWithName("blood\(count)") as! SKSpriteNode).texture = redBloodTexture
                }
                if maxBloodNumber > 3 {
                    (self.childNodeWithName("blood3") as! SKSpriteNode).texture = redBloodTexture
                    if newValue <= 3 {
                        (self.childNodeWithName("blood0") as! SKSpriteNode).texture = greyBloodTexture
                    }
                    if newValue <= 2 {
                        (self.childNodeWithName("blood1") as! SKSpriteNode).texture = greyBloodTexture
                    }
                    if newValue <= 1 {
                        (self.childNodeWithName("blood2") as! SKSpriteNode).texture = greyBloodTexture
                    }
                } else {
                    (self.childNodeWithName("blood2") as! SKSpriteNode).texture = redBloodTexture
                    if newValue <= 2 {
                        (self.childNodeWithName("blood0") as! SKSpriteNode).texture = greyBloodTexture
                    }
                    if newValue <= 1 {
                        (self.childNodeWithName("blood1") as! SKSpriteNode).texture = greyBloodTexture
                    }
                }
            }
        }
    }
    
    init(maxBloodNumber number: Int) {
        super.init()
        maxBloodNumber = number
        for count in 0...2 {
            let bloodNode = SKSpriteNode(texture: redBloodTexture)
            bloodNode.name = "blood\(count)"
            bloodNode.anchorPoint = CGPointZero
            bloodNode.position = CGPoint(x: 0, y: count * aBloodTextureHeight)
            self.addChild(bloodNode)
        }
        if number >= 4 {
            let bloodNode = SKSpriteNode(texture: redBloodTexture)
            bloodNode.name = "blood3"
            bloodNode.anchorPoint = CGPointZero
            bloodNode.position = CGPoint(x: 0, y: 3 * aBloodTextureHeight)
            self.addChild(bloodNode)
            if number >= 5 {
                bloodNode.texture = yellowBloodTexture
                if number == 6 {
                    (self.childNodeWithName("blood2") as! SKSpriteNode).texture = yellowBloodTexture
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
