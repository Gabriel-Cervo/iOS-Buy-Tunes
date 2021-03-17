//
//  Cart.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 17/03/21.
//

import Foundation

struct Library {
    static var sharedInstance = Library()
    var songsAvaliable: [Song] = [Song]()
    var songsPurchased: [Song] = [Song]()
        
    mutating func buyMusic(_ musicToBuy: String) throws {
        if let musicToBuyIndex = songsAvaliable.firstIndex(where: { $0.title.lowercased() == musicToBuy.lowercased() }) {
            let music = songsAvaliable[musicToBuyIndex]
            songsAvaliable.remove(at: musicToBuyIndex)
            songsPurchased.append(music)
        } else {
            throw LibraryErrorType.MusicNotFound
        }
    }
}