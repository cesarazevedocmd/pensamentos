//
//  QuoteManager.swift
//  Pensamentos
//
//  Created by César Alves de Azevedo on 17/11/20.
//

import Foundation

class QuoteManager {
    
    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let dataFile = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: dataFile)
    }
    
    func getRandomQuote() -> Quote{
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
}
