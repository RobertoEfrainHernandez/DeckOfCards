//
//  SuitHeaderLabel.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/29/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit

class SuitHeaderLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.137254902, green: 0.3529411765, blue: 0.1490196078, alpha: 1)
        textColor = .white
        textAlignment = .center
    }
    
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let width = originalContentSize.width + 16
        let height = originalContentSize.height + 12
        
        clipsToBounds = true
        layer.cornerRadius = height / 2
        font = UIFont.boldSystemFont(ofSize: 16)
        
        return CGSize(width: width, height: height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
