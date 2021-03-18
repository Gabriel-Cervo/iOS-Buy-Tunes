//
//  Artist.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

struct Artist: Printable {    
    let name: String
    let about: String
    var songs: [Song] = [Song]()
    
    var description: String {
        return name
    }
  
    func listAllMusics() {
        songs.forEach { print($0.description) }
    }
    
    mutating func addSong(title: String, price: Double) {
        let newSong = Song(artist: self, title: title, price: price)
        songs.append(newSong)
    }
}
