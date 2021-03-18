//
//  printFunctions.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 18/03/21.
//

import Foundation

func printArtistInfo(_ artist: Artist) {
    let description: String = "\n==== \(artist.name) ====\n\n\(artist.about)\n"
    print(description)
    printAll(from: artist.songs, withTitle: "Músicas de \(artist.name)", cleaningTerminal: false)
}

func printAll(from list: [Printable], withTitle title: String, cleaningTerminal: Bool? = true) {
    if cleaningTerminal! {
        clearTerminal()
    }
        
    print("---- \(title) ---- ")
    list.forEach { print("\($0.description)\n") }
}

func printAllMusics(from songList: [Song], title: String) {
    clearTerminal()
    print(title)
    
    Artists.sharedInstance.artistsAvaliable.forEach({ artist in
        artist.songs.forEach({ song in
            if songList.contains(where: { $0.title == song.title }) {
                print("\(artist.description) | \(song.description)\n")
            }
        })
    })
}
