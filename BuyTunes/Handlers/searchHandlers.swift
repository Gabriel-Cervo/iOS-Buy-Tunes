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
                
        let optionNumber = handleReadLine()
        
        do {
            let optionInEnum: SearchChoices = try SearchChoices.init(choiceNumber: optionNumber)
            
            switch optionInEnum {
                case .Voltar: return clearTerminal()
                case .Por_Artistas: handleArtistSearch()
                case .Ver_Todas: handleAllMusicsSearch()
            }
            
        } catch MenuErrorType.invalidOption {
            handleInvalidOption()
        }
    }
}

func handleArtistSearch() {
    printOption("Artistas Disponíveis", from: Artists.sharedInstance.artistsAvaliable)
}

func handleAllMusicsSearch() {
    printOption("Músicas Disponíveis", from: Library.sharedInstance.songsAvaliable)
}

func handleListPurchases() {
    printOption("Suas músicas", from: Library.sharedInstance.songsPurchased)
}

func printOption (_ title: String, from list: [Printable]) {
    clearTerminal()
    
    print("---- \(title) ---- ")
    
    list.forEach { item in print(item.description) }
}
