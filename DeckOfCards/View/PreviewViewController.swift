//
//  PreviewViewController.swift
//  DeckOfCards
//
//  Created by Roberto Hernandez on 10/28/18.
//  Copyright © 2018 Roberto Efrain Hernandez. All rights reserved.
//

import UIKit
import SDWebImage

class PreviewViewController: UIViewController {
    
    var cardView = CardPreviewImageView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.3843137255, blue: 0.1568627451, alpha: 1)
        setNavButton()
        setUpCardView()
    }
    
    fileprivate func setUpCardView() {
        view.addSubview(cardView)
        let contraints = [
            cardView.topAnchor.constraint(equalTo: view.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(contraints)
    }
    
    fileprivate func setNavButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(dismissPreview))
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1490196078, green: 0.3843137255, blue: 0.1568627451, alpha: 1)
    }
    
    @objc func dismissPreview() {
        dismiss(animated: true, completion: nil)
    }
}
