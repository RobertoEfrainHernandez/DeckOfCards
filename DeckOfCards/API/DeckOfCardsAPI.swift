//
//  DeckOfCardsAPI.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/29/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit

class DeckOfCardsAPI {
    static let shared = DeckOfCardsAPI()
    let shuffleCardURLString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
    let session = URLSession.shared
    
    func fetchDeck(completionHandler: @escaping (Deck) -> ()) {
        guard let url = URL(string: shuffleCardURLString) else {  return }
        
        let task = session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let deck = try decoder.decode(Deck.self, from: data)
               completionHandler(deck)
            } catch let jsonErr {
                print("Failed to get deck: ", jsonErr.localizedDescription)
            }
         }
        
        task.resume()
    }
    
    func fetchCards(with deckId: String, completionHandler: @escaping ([Card]) -> ()) {
        let cardsURLString = "https://deckofcardsapi.com/api/deck/\(deckId)/draw/?count=52"
        guard let url = URL(string: cardsURLString) else { return }
        
        let task = session.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Error getting cards", err.localizedDescription)
            }
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let cards = try decoder.decode(CardResults.self, from: data)
                completionHandler(cards.cards)
            } catch let jsonErr {
                print("Failed to get cards: ", jsonErr.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}
