//
//  Card.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/28/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import Foundation

class Card: Decodable {
    let image : String?
    let value : String?
    let suit : String?
    let code : String?
    
    init(image: String?, value: String?, suit: String?, code: String?) {
        self.image = image
        self.value = value
        self.suit = suit
        self.code = code
    }
    
    static func convertCardType(with cardVal: String?) -> Int? {
        switch cardVal {
        case "ACE":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        case "6":
            return 6
        case "7":
            return 7
        case "8":
            return 8
        case "9":
            return 9
        case "10":
            return 10
        case "JACK":
            return 11
        case "QUEEN":
            return 12
        case "KING":
            return 13
        default:
            break
        }
        return nil
    }
}
