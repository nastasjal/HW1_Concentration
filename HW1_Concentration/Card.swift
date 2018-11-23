//
//  Card.swift
//  L1_Concentration
//
//  Created by Анастасия Латыш on 22/11/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import Foundation

struct Card {
  
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
static var identifierFactory = 0
    
   static func getUniqueIdentifier () -> Int {
    Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
