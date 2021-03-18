//
//  Artist.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

struct Artist: Printable, Codable {    
    let name: String
    let about: String
    var songs: [Song] = [Song]()
    
    var description: String {
        return name
    }
    mutating func addSong(title: String, price: Double) {
        let newSong = Song(title: title, price: price)
        songs.append(newSong)
    }
}
