//
//  CardResults.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/29/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import Foundation

struct CardResults: Decodable {
    let success : Bool
    let remaining : Int
    let deck_id : String
    let cards : [Card]
}
