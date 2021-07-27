//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Emiliano on 26/03/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","🧟‍♂️","🕸"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func fontSize(pairs: Int) -> Bool {
        var smallFont: Bool = true
        if pairs > 9 {
            smallFont = false
        }
        return smallFont
    }
    
    
    // MARK: Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

