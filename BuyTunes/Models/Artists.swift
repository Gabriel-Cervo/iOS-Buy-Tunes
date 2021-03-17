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
    
    mutating func loadSongs () {
        artistsAvaliable.append(contentsOf: [
            Artist(name: "Los Hermanos", about: "Los Hermanos é uma banda brasileira de rock alternativo formada no Rio de Janeiro em 1997."),
            Artist(name: "Taylor Swift", about: "Taylor Alison Swift é uma cantora e compositora norte-americana."),
            Artist(name: "Capital Inicial", about: "Capital Inicial é uma banda de rock brasileira formada pelos irmãos Fê Lemos e Flávio Lemos em 1982, após o encerramento das atividades do grupo Aborto Elétrico, de que os irmãos participavam."),
            Artist(name: "Adele", about: "Adele Laurie Blue Adkins é uma cantora, compositora e multi-instrumentista britânica."),
            Artist(name: "The Strokes", about: "The Strokes é uma banda de rock dos Estados Unidos formada em 1998 na cidade de Nova Iorque. "),
            Artist(name: "Iza", about: "Isabela Cristina Correia de Lima Lima, mais conhecida pelo seu nome artístico IZA é uma cantora, compositora, apresentadora e publicitária brasileira. "),
            Artist(name: "Paramore", about: "Paramore é uma banda americana de rock formada em Franklin, Tennessee no ano de 2004."),
            Artist(name: "Anitta", about: "Larissa de Macedo Machado, mais conhecida pelo seu nome artístico Anitta, é uma cantora, compositora, atriz, dançarina, empresária e apresentadora brasileira. ")
        ])
        
        artistsAvaliable[0].addSong(title: "A flor", price: 0.99);
        artistsAvaliable[0].addSong(title: "Sentimental", price: 0.99);
        artistsAvaliable[0].addSong(title: "Anna Julia", price: 1.99);
        
        artistsAvaliable[1].addSong(title: "ME!", price: 2.99);
        artistsAvaliable[1].addSong(title: "It's nice to have a friend", price: 1.99);
        artistsAvaliable[1].addSong(title: "I did something Bad", price: 2.99);
        
        artistsAvaliable[2].addSong(title: "A sua Maneira", price: 1.99)
        artistsAvaliable[2].addSong(title: "Primeiros Erros", price: 0.99);

        artistsAvaliable[3].addSong(title: "Rolling in the Deep", price: 1.99);
        
        artistsAvaliable[4].addSong(title: "The adults are Talking", price: 2.99);
        artistsAvaliable[4].addSong(title: "Juicebox", price: 1.99);
        artistsAvaliable[4].addSong(title: "Selfless", price: 2.99);

        artistsAvaliable[5].addSong(title: "Talismã", price: 1.99);
        artistsAvaliable[5].addSong(title: "Dona de Mim", price: 1.99);

        artistsAvaliable[6].addSong(title: "Hard Times", price: 2.99);
        artistsAvaliable[6].addSong(title: "Emergency", price: 0.99);
        
        artistsAvaliable[7].addSong(title: "Show das Poderosas", price: 0.99);
        
        artistsAvaliable.map({ $0.songs }).forEach { song in
            Library.sharedInstance.songsAvaliable.append(contentsOf: song)
        }
    }
}
