//
//  Artists.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 17/03/21.
//

import Foundation

struct Artists {
    static var sharedInstance = Artists()
    
    var artistsAvaliable: [Artist] = [Artist]()
    
    func getArtist(_ artist: String) throws -> Artist {
        if let artistIndex = artistsAvaliable.firstIndex(where: { $0.name.lowercased() == artist.lowercased() }) {
            return artistsAvaliable[artistIndex]
        }
        
        throw ArtistErrorType.ArtistNotFound
    }
    
    mutating func addArtist(_ artist: Artist) {
        let isArtistNotAvaliable = !artistsAvaliable.contains(where: { $0.name.lowercased() == artist.name.lowercased() })
        
        if (isArtistNotAvaliable) {
            artistsAvaliable.append(artist)
        }
    }
}
