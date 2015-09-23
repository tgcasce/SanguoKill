//
//  GameViewController.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/9/16.
//  Copyright (c) 2015年 MaulynTang. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! SKNode
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    var mainScene = GameScene(size: CGSizeMake(screenWidth, screenHeight))

    override func viewDidLoad() {
        super.viewDidLoad()

        mainScene.scaleMode = .AspectFill
//        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
        let skView = self.view as! SKView
        skView.showsDrawCount = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.presentScene(mainScene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
