//
//  menu.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func showMenu() {
    print("Seja bem vindo a BuyTunes!\n")
    
    while true {
        print("\n---- MENU ----\n")
        
        var optionIndex: Int = 0
        
        for option in MenuChoices.allCases {
            let optionWithoutUnderlines: String = option.rawValue.removeUnderlines()
            print("\(optionIndex): \(optionWithoutUnderlines)")
            optionIndex += 1
        }
        
        print("\nDigite o que deseja fazer:")
        
        let optionNumber: Int = handleReadLine()
        
        do {
            let optionInEnum: MenuChoices = try MenuChoices.init(choiceNumber: optionNumber)
            
            if optionInEnum == MenuChoices.Sair {
                clearTerminal()
                return print("Obrigado por usar a BuyTunes!\n\nVolte sempre!\n")
            }
            
            try selectMenuChoice(optionInEnum)
            
        } catch MenuErrorType.invalidOption {
            handleInvalidOption()
            
        } catch {
            handleGeneralError(of: error)
        }
    }
}

func selectMenuChoice(_ selectedOption: MenuChoices) throws {
    switch selectedOption {
        case .Comprar: handleBuy()
        case .Procurar: try handleSearch()
        case .Listar_Compras: handleListPurchases()
        default: throw MenuErrorType.invalidOption
    }
}

