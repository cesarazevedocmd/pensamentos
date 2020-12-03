//
//  Quote.swift
//  Pensamentos
//
//  Created by César Alves de Azevedo on 17/11/20.
//

import Foundation

struct Quote: Codable{
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "“" + quote + "”"
    }
    
    var authorFormatted: String {
        return "“" + author + "”"
    }
}
