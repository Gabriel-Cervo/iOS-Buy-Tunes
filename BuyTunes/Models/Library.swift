//
//  Cart.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 17/03/21.
//

import Foundation

struct Library {
    static var sharedInstance = Library()
    
    var songsAvaliable: [Song]
    var songsPurchased: [Song]
    
    init() {
        do {
            songsAvaliable = try loadData(key: "avaliableMusics")
            songsPurchased = try loadData(key: "userMusics")
        } catch {
            handleDataError(of: error)
            songsAvaliable = [Song]()
            songsPurchased = [Song]()
        }
        
    }
    
    mutating func buyMusic(_ musicToBuy: String) throws {
        if let musicToBuyIndex = songsAvaliable.firstIndex(where: { $0.title.lowercased() == musicToBuy.lowercased() }) {
            let music = songsAvaliable[musicToBuyIndex]
            songsPurchased.append(music)
            songsAvaliable.remove(at: musicToBuyIndex)
        } else {
            throw LibraryErrorType.MusicNotFound
        }
    }
}
