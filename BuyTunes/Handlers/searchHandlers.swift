//
//  handlers.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func handleBuy() {
    clearTerminal()
    
    print("Você deseja comprar uma música? Que ótimo!!!")
    print("Digite o nome da música que deseja comprar:")
    
    let songToBePurchased: String = readLine() ?? ""
    do {
        try Library.sharedInstance.buyMusic(songToBePurchased)
        
        clearTerminal()
        
        print("Compra realizada com sucesso!")
    } catch LibraryErrorType.MusicNotFound {
        handleInvalidMusic()
    } catch {
        handleGeneralError(of: error)
    }
}

func handleSearch() throws {
    clearTerminal()
    
    while true {
        print("\nComo deseja procurar sua música?")
        
        var optionIndex: Int = 0
        for option in SearchChoices.allCases {
            let optionWithoutUnderlines: String = option.rawValue.removeUnderlines()
            print("\(optionIndex): \(optionWithoutUnderlines)")
            optionIndex += 1
        }
        
        let optionNumber = Int(readLine() ?? "-1")
        do {
            let optionInEnum: SearchChoices = try SearchChoices.init(choiceNumber: optionNumber ?? -1)
            switch optionInEnum {
            case .Voltar:
                clearTerminal()
                return
            case .Por_Artistas:
                handleArtistSearch()
            case .Ver_Todas:
                handleAllMusicsSearch()
            }
        } catch MenuErrorType.invalidOption {
            handleInvalidOption()
        }
    }
}


func handleArtistSearch() {
    clearTerminal()
    print("---- Artistas Disponíveis ----")
    
    Artists.sharedInstance.artistsAvaliable.forEach { print($0.description) }
}

func handleAllMusicsSearch() {
    clearTerminal()
    print("---- Músicas Disponíveis ----")
    
    Library.sharedInstance.songsAvaliable.forEach { print($0.description) }
}

func handleListPurchases() {
    let musicsPurchased = Library.sharedInstance.songsPurchased
    
    clearTerminal()
    print("---- Suas músicas ---- ")
    
    musicsPurchased.forEach { print($0.description) }
}
