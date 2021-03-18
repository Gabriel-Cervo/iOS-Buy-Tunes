//
//  userData.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 18/03/21.
//

import Foundation

func saveData<T: Encodable>(key: String, data: T) throws {
    let jsonEncoder = JSONEncoder()
    if let savedData = try? jsonEncoder.encode(data) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(savedData, forKey: key)
    } else {
        throw DataErrorType.saveError
    }
}

func loadData(key: String) throws -> [Song] {
    let userDefaults = UserDefaults.standard
    if let userData = userDefaults.data(forKey: key) {
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode([Song].self, from: userData) else {
            throw DataErrorType.loadError
        }
        return decodedData
    }
    
    return [Song]()
}

func loadSongs () {
    let exampleArtists: [Artist] = [
        Artist(
            name: "Los Hermanos",
            about: "Los Hermanos é uma banda brasileira de rock alternativo formada no Rio de Janeiro em 1997.",
            songs: [
                Song(title: "A flor", price: 0.99),
                Song(title: "Sentimental", price: 0.99),
                Song(title: "Anna Julia", price: 1.99)
            ]
        ),
        Artist(
            name: "Taylor Swift",
            about: "Taylor Alison Swift é uma cantora e compositora norte-americana.",
            songs: [
                Song(title: "ME!", price: 2.99),
                Song(title: "It's nice to have a friend", price: 1.99),
                Song(title: "I did something Bad", price: 2.99)
            ]
        ),
        Artist(
            name: "Capital Inicial",
            about: "Capital Inicial é uma banda de rock brasileira formada pelos irmãos Fê Lemos e Flávio Lemos em 1982, após o encerramento das atividades do grupo Aborto Elétrico, de que os irmãos participavam.",
            songs: [
                Song(title: "A sua Maneira", price: 1.99),
                Song(title: "Primeiros Erros", price: 0.99)
            ]
        ),
        Artist(
            name: "Adele",
            about: "Adele Laurie Blue Adkins é uma cantora, compositora e multi-instrumentista britânica.",
            songs: [Song(title: "Rolling in the Deep", price: 1.99)]
        ),
        Artist(
            name: "The Strokes",
            about: "The Strokes é uma banda de rock dos Estados Unidos formada em 1998 na cidade de Nova Iorque.",
            songs: [
                Song(title: "The adults are Talking", price: 2.99),
                Song(title: "Juicebox", price: 1.99),
                Song(title: "Selfless", price: 2.99)
            ]
        ),
        Artist(
            name: "Iza",
            about: "Isabela Cristina Correia de Lima Lima, mais conhecida pelo seu nome artístico IZA é uma cantora, compositora, apresentadora e publicitária brasileira.",
            songs: [
                Song(title: "Talismã", price: 1.99),
                Song(title: "Dona de Mim", price: 1.99)
            ]
        ),
        Artist(
            name: "Paramore",
            about: "Paramore é uma banda americana de rock formada em Franklin, Tennessee no ano de 2004.",
            songs: [
                Song(title: "Hard Times", price: 2.99),
                Song(title: "Emergency", price: 0.99)
            ]
        ),
        Artist(
            name: "Anitta",
            about: "Larissa de Macedo Machado, mais conhecida pelo seu nome artístico Anitta, é uma cantora, compositora, atriz, dançarina, empresária e apresentadora brasileira.",
            songs: [
                Song(title: "Show das Poderosas", price: 0.99)
            ]
        )
    ]
    
    Artists.sharedInstance.artistsAvaliable.append(contentsOf: exampleArtists)
    
    Artists.sharedInstance.artistsAvaliable.map({ $0.songs }).forEach { Library.sharedInstance.songsAvaliable.append(contentsOf: $0) }
}

func resetData() {
    let userDefaults = UserDefaults.standard
    userDefaults.removeObject(forKey: "userMusics")
    userDefaults.removeObject(forKey: "avaliableMusics")
}
