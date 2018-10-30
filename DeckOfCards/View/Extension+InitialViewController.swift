//
//  Extension+InitialViewController.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/30/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit

extension InitialViewController {
    
    //MARK:- TableView Methods
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstCardInSection = groupedCards[section].first {
            let suit = firstCardInSection.suit
            
            let label = SuitHeaderLabel()
            label.text = suit
            
            let container = UIView()
            container.addSubview(label)
            
            let labelContraints = [
                label.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: container.centerYAnchor)
            ]
            
            NSLayoutConstraint.activate(labelContraints)
            return container
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedCards.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedCards[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! CardCell
        let card = groupedCards[indexPath.section][indexPath.row]
        let viewModel = CardViewModel(model: card)
        viewModel.configureCell(cell: cell)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let card = groupedCards[indexPath.section][indexPath.row]
        let viewModel = CardViewModel(model: card)
        modalPresent(for: viewModel)
    }
}
