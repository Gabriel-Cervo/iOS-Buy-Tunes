//
//  handlers.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func handleBuy() {
    clearTerminal()
    print("Você deseja comprar uma música? Que ótimo!!!\n")
    print("Digite o nome da música que deseja comprar:")
    
    let songToBePurchased: String = readLine() ?? ""
    do {
        try Library.sharedInstance.buyMusic(songToBePurchased)
        
        clearTerminal()
        print("Você comprou '\(songToBePurchased)' com sucesso!")
    } catch {
        handleError(of: error)
    }
}

func handleSearch() {
    clearTerminal()
    
    while true {
        print("\nComo deseja procurar sua música?")
        
        var optionIndex: Int = 0
        
        for option in SearchChoices.allCases {
            let optionWithoutUnderlines: String = option.rawValue.removeUnderlines()
            print("\(optionIndex): \(optionWithoutUnderlines)")
            optionIndex += 1
        }
        
        let optionNumber = handleReadLine()
        do {
            let optionInEnum: SearchChoices = try SearchChoices.init(choiceNumber: optionNumber)
            
            switch optionInEnum {
            case .Por_Artistas: handleArtistSearch()
            case .Ver_Todas: handleAllMusicsSearch()
            case .Voltar:
                clearTerminal()
                return
            }
        } catch {
            handleError(of: error)
        }
    }
}

func handleArtistSearch() {
    clearTerminal()
  
    while true {
        print("\nComo deseja procurar seu artista?")
        
        var optionIndex: Int = 0
        for option in ArtistSearchChoices.allCases {
            let optionWithoutUnderlines: String = option.rawValue.removeUnderlines()
            print("\(optionIndex): \(optionWithoutUnderlines)")
            optionIndex += 1
        }
        
        let optionNumber = handleReadLine()
        do {
            let optionInEnum: ArtistSearchChoices = try ArtistSearchChoices.init(choiceNumber: optionNumber)
        
            switch optionInEnum {
            case .Por_Nome: handleSearchArtistByName()
            case .Ver_Todos: handleAllArtistsSearch()
            case .Voltar:
                clearTerminal()
                return
            }
        } catch {
            handleError(of: error)
        }
    }
}

func handleSearchArtistByName() {
    clearTerminal()
    print("Qual o nome do artista que deseja procurar?")
    let artistToSearch: String = readLine() ?? ""
    
    do {
        let artist: Artist = try Artists.sharedInstance.getArtist(withName: artistToSearch)
        printAll(from: artist.songs, withTitle: "Músicas de \(artist.name)")
        return
    } catch {
        handleError(of: error)
    }
}

func handleAllArtistsSearch() {
    printAll(from: Artists.sharedInstance.artistsAvaliable, withTitle: "Artistas Disponíveis")
}

func handleAllMusicsSearch() {
    printAll(from: Library.sharedInstance.songsAvaliable, withTitle: "Músicas Disponíveis")
}

func handleListPurchases() {
    let purchases: [Song] = Library.sharedInstance.songsPurchased
    
    if purchases.count > 0 {
        printAll(from: purchases, withTitle: "Suas músicas")
    } else {
        clearTerminal()
        print("Você não possui nenhuma música :(")
    }
}

func printAll(from list: [Printable], withTitle title: String) {
    clearTerminal()
    print("---- \(title) ---- ")
    list.forEach { print("\($0.description)\n") }
}
