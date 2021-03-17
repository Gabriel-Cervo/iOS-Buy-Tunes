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
        try Cart.sharedInstance.buyMusic(songToBePurchased)
        
        clearTerminal()
        
        print("Compra realizada com sucesso!")
    } catch CartErrorType.MusicNotFound {        
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
    // pesquisa pelo nome do artista
}

func handleAllMusicsSearch() {
    // mostrar todas as musicas
}

func handleListPurchases() {
    let musicsPurchased = Cart.sharedInstance.songsPurchased
    
    clearTerminal()
    print("---- Suas músicas ---- ")
    
    musicsPurchased.forEach { print($0.description) }
}
