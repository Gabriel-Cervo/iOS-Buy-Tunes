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
    } catch LibraryErrorType.MusicNotFound {
        handleInvalidMusic()
        
    } catch {
        handleGeneralError(of: error)
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
            case .Voltar: 
                clearTerminal()
                return 
            case .Por_Artistas: handleArtistSearch()
            case .Ver_Todas: handleAllMusicsSearch()
            }
            
        } catch MenuErrorType.invalidOption {
            handleInvalidOption()
        } catch {
            handleGeneralError(of: error)
        }
    }
}

func handleAllMusicsSearch() {
    printOption("Músicas Disponíveis", from: Library.sharedInstance.songsAvaliable)
}

func handleListPurchases() {
    let purchases: [Song] = Library.sharedInstance.songsPurchased
    
    if purchases.count > 0 {
        printOption("Suas músicas", from: purchases)
    } else {
        print("Você não possui nenhuma música :(")
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
            case .Voltar:
                clearTerminal()
                return
            case .Por_Nome: handleSearchArtistByName()
            case .Ver_Todos: handleAllArtistsSearch()
            }
        } catch MenuErrorType.invalidOption {
            handleInvalidOption()
        } catch {
            handleGeneralError(of: error)
        }
    }
}

func handleSearchArtistByName() {
    clearTerminal()
    
    print("Qual o nome do artista que deseja procurar?")
    let artistToSearch: String = readLine() ?? ""
    
    do {
        let artist: Artist = try Artists.sharedInstance.getArtist(withName: artistToSearch)
        
        clearTerminal()
        print("---- Musicas de \(artist.name) ----")
        artist.listAllMusics()
        return
    } catch ArtistErrorType.ArtistNotFound {
        handleArtistNotFound()
    } catch {
        handleGeneralError(of: error)
    }
}

func handleAllArtistsSearch() {
    clearTerminal()
    
    print("---- Artistas Disponíveis ----")
    
    Artists.sharedInstance.artistsAvaliable.forEach { print($0.description) }
}

func printOption(_ title: String, from list: [Printable]) {
    clearTerminal()
    
    print("---- \(title) ---- ")
    
    list.forEach { print("\($0.description)\n") }
}
