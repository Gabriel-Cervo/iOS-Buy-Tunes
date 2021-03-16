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
    
    var itemIndex: Int = 0
    for option in MenuChoicesEnum.allCases {
        print("\(itemIndex): \(option)")
        itemIndex += 1
    }
    
    while true {
        print("\nDigite o que deseja fazer:")
        let optionNumber = Int(readLine() ?? "-1")
        do {
            let optionInEnum: MenuChoicesEnum = try MenuChoicesEnum.init(choiceNumber: optionNumber ?? -1)
            if optionInEnum == MenuChoicesEnum.Sair {
                return
            }
        } catch MenuErrorType.invalidOption {
            clearTerminal()
            print("\nEscolha uma opção válida!")
        } catch {
            print("Erro ao iniciar MenuChoicesEnum")
        }
    }
}
