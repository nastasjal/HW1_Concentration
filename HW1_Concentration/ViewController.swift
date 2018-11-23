//
//  ViewController.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 21/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func newGame() {
        game.newGame()
        emoji.removeAll()
        indexTheme = Int(arc4random_uniform(UInt32(allThemes.count)))
        updateViewFromModel()
    }
   
    var indexTheme = 0 {
        didSet {
            emojiChoices = allThemes[indexTheme].emoji
        }
    }
    
    lazy var game = Concentration(numberOfCardPars: cardButtons.count/2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
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
        flipCountLabel.text = "flip count: \(game.flipCount)"
    }
    var emoji=[Int:String]()
    
lazy var emojiChoices = allThemes[indexTheme].emoji
    
    private struct themeGame{
        var theme: String
        var emoji: [String]
    }
    
    private var allThemes: [themeGame] = [
        themeGame(theme: "animal", emoji: ["🐶", "🐭", "🐯", "🐮", "🙉", "🐸", "🦋"]),
        themeGame(theme: "food", emoji: ["🥥", "🥦", "🍅", "🥒", "🍒", "🥝", "🍇"]),
        themeGame(theme: "nature", emoji: ["⭐️", "⚡️", "❄️", "🌥", "☔️", "🌧", "💨"]),
        themeGame(theme: "computer", emoji: ["📲", "💽", "📞", "💾", "📷", "🎥", "💻"])]
        
 /*  func chooseTheme(){
        indexTheme = Int(arc4random_uniform(UInt32(allThemes.count)))
    }*/
    
    func emoji (for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: Int(arc4random_uniform(UInt32(emojiChoices.count))))
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

