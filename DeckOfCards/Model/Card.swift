//
//  Card.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/28/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import Foundation

struct Card: Decodable {
  let image : String
  let value : String
  let suit  : String
  let code  : String
  
  init(image: String, value: String, suit: String, code: String) {
    self.image = image
    self.value = value
    self.suit = suit
    self.code = code
  }
  
  static func convertCardType(with cardVal: String) -> Int {
    let cardDict: [String: Int] = ["ACE": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, "JACK": 11, "QUEEN": 12, "KING": 13]
    return cardDict[cardVal] ?? 0
  }
}
