//
//  main.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

loadArtists()

if Library.sharedInstance.songsAvaliable.count == 0 {
    insertSongsInLibrary()
}

showMenu()
