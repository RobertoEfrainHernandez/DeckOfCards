//
//  CardViewModel.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/30/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit
import SDWebImage

struct CardViewModel {
    private let model : Card
    
    init(model: Card) {
        self.model = model
    }
}

extension CardViewModel {
    var cardName: String {
        guard let code = model.code else { return ""}
        return code
    }
    
    var cardImage: String {
        guard let imageURL = model.image else { return ""}
        return imageURL
    }
}

extension CardViewModel {
    func configureCell(cell: CardCell) {
        cell.cardNameLabel.text = cardName
        cell.cardImageView.sd_setImage(with: URL(string: cardImage), completed: nil)
    }
    
    func configureView(view: CardPreviewImageView) {
        view.imageView.sd_setImage(with: URL(string: cardImage), completed: nil)
    }
}
