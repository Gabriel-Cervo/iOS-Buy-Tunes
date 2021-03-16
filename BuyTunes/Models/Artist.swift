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
    var songs: Array<Song> = [Song]()
    
    var description: String {
        return name
    }
    
    mutating func addSong (title: String, releaseDate: Date, price: Double) {
        songs.append(Song(title: title, artist: self, releaseDate: releaseDate, price: price))
    }
}
