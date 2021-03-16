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
    // logica para verificar
}

func handleSearch() throws {
    clearTerminal()
    
    print("Como deseja procurar sua música?")
    var optionIndex: Int = 0
    for option in SearchChoices.allCases {
        let optionWithoutUnderlines: String = option.rawValue.removeUnderlines()
        print("\(optionIndex): \(optionWithoutUnderlines)")
        optionIndex += 1
    }
    
    let optionNumber = Int(readLine() ?? "-1")
    do {
        let optionInEnum: SearchChoices = try SearchChoices.init(choiceNumber: optionNumber ?? -1)
    } catch {
        throw error
    }
}

func handleListPurchases() {
    
}
