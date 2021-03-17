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
        return name + "is a music artist" // TODO pensar em uma desc melhor (personalizada)
    }
    
    mutating func addSong(title: String, releaseDate: Date, price: Double) {
        let newSong = Song(title: title, artist: self, releaseDate: releaseDate, price: price)
        songs.append(newSong)
    }
}
