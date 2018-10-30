//
//  CardCell.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/29/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit
import SDWebImage

class CardCell: UITableViewCell {
    
    let cardImageView : CardImageView = {
        let iv = CardImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let cardNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    lazy var stack : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [cardImageView, cardNameLabel, UIView()])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isLayoutMarginsRelativeArrangement = true
        sv.axis = .horizontal
        sv.spacing = 12
        return sv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        setupStack()
    }
    
    fileprivate func setupStack() {
        addSubview(stack)
        
        let stackConstraints = [
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(stackConstraints)
        stack.layoutMargins = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
