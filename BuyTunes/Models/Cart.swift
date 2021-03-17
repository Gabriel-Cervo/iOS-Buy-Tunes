//
//  Cart.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 17/03/21.
//

import Foundation

class Library {
    static let sharedInstance = Library()
    var songsAvaliable: [Song] = [Song]()
    var songsPurchased: [Song] = [Song]()
    
    private init() {}
    
    func buyMusic(_ musicToBuy: String) throws {
        if let musicToBuyIndex = songsAvaliable.firstIndex(where: { $0.title.lowercased() == musicToBuy.lowercased() }) {
            let music = songsAvaliable[musicToBuyIndex]
            songsPurchased.append(music)
            songsAvaliable.remove(at: musicToBuyIndex)
        } else {
            throw LibraryErrorType.MusicNotFound
        }
    }
}
