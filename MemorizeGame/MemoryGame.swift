//
//  MemoryGame.swift
//  MemorizeGame
//
//  Created by Emiliano on 26/03/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card chosen \(card)")
        let chosenIndex :Int = self.index(of: card)
        self.cards[chosenIndex].isFacedUp = !self.cards[chosenIndex].isFacedUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 //TODO: Bogus!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            
        }
    }
    
    struct Card: Identifiable {
        var isFacedUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
