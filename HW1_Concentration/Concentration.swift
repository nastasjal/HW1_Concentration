//
//  Concentration.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 22/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfoneAndOnlyOneFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchesIndex = indexOfoneAndOnlyOneFaceUpCard , index != matchesIndex {
                if cards[index].identifier == cards[matchesIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchesIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfoneAndOnlyOneFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfoneAndOnlyOneFaceUpCard = index
            }
        } else {

        }
    }
    
    init (numberOfCardPars: Int) {
        for _ in 0..<numberOfCardPars {
            let card = Card()
            cards += [card, card]
        }
        //MARK: shufle cards
        for _ in 0..<numberOfCardPars {
            let randomIndex = Int(arc4random_uniform(UInt32(numberOfCardPars * 2)))
            let randomCard = cards.remove(at: randomIndex)
            cards += [randomCard]
        }
    }
    
}