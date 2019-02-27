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
    genericFetchOfJSON(with: shuffleCardURLString, completion: completionHandler)
  }
  
  func fetchCards(with deckId: String, completionHandler: @escaping (CardResults) -> ()) {
    let cardsURLString = "https://deckofcardsapi.com/api/deck/\(deckId)/draw/?count=52"
    genericFetchOfJSON(with: cardsURLString, completion: completionHandler)
  }
  
  fileprivate func genericFetchOfJSON<T: Decodable>(with urlString: String, completion: @escaping (T) -> Void) {
    guard let url = URL(string: urlString) else {  return }
    let task = session.dataTask(with: url) { (data, resp, err) in
      if let err = err {
        print("Error completing data task:", err)
        return
      }
      guard let data = data, let statusCode = (resp as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else { return }
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let results = try decoder.decode(T.self, from: data)
        completion(results)
      } catch {
        print("Failed to complete decoding:", error)
      }
    }
    task.resume()
  }
  
}
