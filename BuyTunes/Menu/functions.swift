//
//  menu.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func showMenu() {
    print("Seja bem vindo a BuyTunes!\n")
    print("---- MENU ----")
    
    var optionIndex: Int = 0
    for option in MenuChoices.allCases {
        let optionWithoutUnderlines: String = option.rawValue.removeUnderlines()
        print("\(optionIndex): \(optionWithoutUnderlines)")
        optionIndex += 1
    }
    
    print("\nDigite o que deseja fazer:")
    while true {
        let optionNumber = Int(readLine() ?? "-1")
        do {
            let optionInEnum: MenuChoices = try MenuChoices.init(choiceNumber: optionNumber ?? -1)
            if optionInEnum == MenuChoices.Sair {
                clearTerminal()
                print("Obrigado por usar a BuyTunes!")
                print("Volte sempre!\n")
                return
            }
            
            try selectMenuChoice(optionInEnum)
        } catch MenuErrorType.invalidOption {
            print("\nEi! O que você digitou não é uma opção válida :(")
            print("Digite novamente uma opção:")
        } catch {
            print("Erro ao iniciar MenuChoicesEnum")
        }
    }
}

func selectMenuChoice(_ selectedOption: MenuChoices) throws {
    switch selectedOption {
    case .Comprar:
        handleBuy()
    case .Procurar:
        try handleSearch()
    case .Listar_Compras:
        handleListPurchases()
    default:
        throw MenuErrorType.invalidOption
    }
}

