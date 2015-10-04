//
//  Constants.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/9/21.
//  Copyright © 2015年 MaulynTang. All rights reserved.
//

import Foundation
import UIKit

let screenBounds = UIScreen.mainScreen().bounds
let screenWidth = CGRectGetWidth(screenBounds)
let screenHeight = CGRectGetHeight(screenBounds)


var backgroundImageName: String? = NSUserDefaults.standardUserDefaults().objectForKey("com.tgcasce.backgroundImageName") as? String




var xGameScale: CGFloat!
var yGameScale: CGFloat!