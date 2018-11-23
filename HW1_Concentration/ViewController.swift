//
//  ViewController.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 21/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfCardPars: cardButtons.count/2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "flip count: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    var choiceEmoji: [String] = ["👁", "🗝", "🧸", "🧸", "👁", "🗝"]
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCount += 1
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
           let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    var emoji=[Int:String]()
    
    var emojiChoices = ["👁", "🗝", "🧸", "🧲", "🧩", "🚗", "🥎"]
    
    func emoji (for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: Int(arc4random_uniform(UInt32(emojiChoices.count))))
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

