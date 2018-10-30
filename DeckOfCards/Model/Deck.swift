//
//  Deck.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/29/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import Foundation

//struct Deck: Decodable {
//    let shuffled  : Bool
//    let success   : Bool
//    let remaining : Int
//    let deck_id   : String
//}

class Deck: Decodable {
    let shuffled : Bool?
    let success : Bool?
    let remaining : Int?
    let deck_id : String?
    
    init(shuffled: Bool?, success: Bool?, remaining: Int?, deck_id: String?) {
        self.shuffled = shuffled
        self.success = success
        self.remaining = remaining
        self.deck_id = deck_id
    }
    
}
