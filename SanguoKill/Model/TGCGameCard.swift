//
//  TGCGameCard.swift
//  SanguoKill
//
//  Created by DonMaulyn on 15/9/16.
//  Copyright (c) 2015年 MaulynTang. All rights reserved.
//

import UIKit

enum TGCGameCardSuit: Character {
    case Spades = "♠️", Hearts = "♥️", Clubs = "♣️", Diamonds = "♦️"
}

enum TGCGameCardRank: Int {
    case Ace = 1
    case Two, Trhee, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
}

class TGCGameCard: NSObject {
    let suit: TGCGameCardSuit
    let rank: TGCGameCardRank
    
    init(suit: TGCGameCardSuit, rank: TGCGameCardRank) {
        self.suit = suit
        self.rank = rank
    }
}
