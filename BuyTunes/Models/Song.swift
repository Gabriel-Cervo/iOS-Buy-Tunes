//
//  Song.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

struct Song: Printable {
    let title: String
    let artist: Artist
    let releaseDate: Date
    let price: Double
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
                
        guard let priceCurrency = numberFormatter.string(from: NSNumber(value: price)) else {
            return "\(title) - \(artist) - \(dateFormatter.string(from: releaseDate))"
        }
        
        return "\(title) - \(artist.name) - \(dateFormatter.string(from: releaseDate)) - \(priceCurrency)"
    }
}
