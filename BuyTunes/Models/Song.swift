//
//  Song.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

struct Song: Printable, Codable {
    let title: String
    var releaseDate: Date = getRandomDate()
    let price: Double
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
                
        let priceCurrency = numberFormatter.string(from: NSNumber(value: price))!
        return "'\(title)' - Publicada em: \(dateFormatter.string(from: releaseDate)) - \(priceCurrency)"
    }
}
