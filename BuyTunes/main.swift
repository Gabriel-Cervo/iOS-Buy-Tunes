//
//  main.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

if Library.sharedInstance.songsAvaliable.count == 0 {
    do {
        try loadSongsFromJSON()
    } catch {
        handleError(of: error)
    }
}

showMenu()
