//
//  ViewController.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/28/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit

class InitialViewController: UITableViewController {

    var cards = [Card]()
    var groupedCards = [[Card]]()
    let reuseID = "cardsID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CardCell.self, forCellReuseIdentifier: reuseID)
        setNavProperties()
        getDeckAndCards()
        view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.3843137255, blue: 0.1568627451, alpha: 1)
    }
    
    //MARK:- Private Functions
    
    fileprivate func setNavProperties() {
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor : UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.137254902, green: 0.3529411765, blue: 0.1490196078, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Deck of Cards"
        
    }
    
    func modalPresent(for model: CardViewModel) {
        let previewVC = PreviewViewController()
        model.configureView(view: previewVC.cardView)
        let navPreviewVC = UINavigationController(rootViewController: previewVC)
        navPreviewVC.modalTransitionStyle = .crossDissolve
        navPreviewVC.modalPresentationStyle = .overFullScreen
        present(navPreviewVC, animated: true, completion: nil)
    }
    
    /* API Call */
    fileprivate func getDeckAndCards() {
        DeckOfCardsAPI.shared.fetchDeck { (deck) in
            let deckID = deck.deckId
            DeckOfCardsAPI.shared.fetchCards(with: deckID, completionHandler: { (cards) in
                self.cards = cards
                self.groupedCards = self.setupGroupedCards(with: self.cards)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    /* Grouping Function for Suits */
    fileprivate func setupGroupedCards(with cards: [Card]) -> [[Card]] {
        var arrayForGrouping = [[Card]]()
        
        let groupedCardsBySuit = Dictionary(grouping: cards) { (element) -> String in
            return element.suit
        }
        
        let sortedKeys = groupedCardsBySuit.keys.sorted()
        sortedKeys.forEach { (key) in
            if let sortedVals = groupedCardsBySuit[key]?.sorted(by: { (card1, card2) -> Bool in
                
                let c1 = card1.value
                let c2 = card2.value
                let converted1 = Card.convertCardType(with: c1)
                let converted2 = Card.convertCardType(with: c2)

                return converted1 > converted2
            }) {
                arrayForGrouping.append(sortedVals.reversed())
            }
        }
        
        return arrayForGrouping
    }
    
}

