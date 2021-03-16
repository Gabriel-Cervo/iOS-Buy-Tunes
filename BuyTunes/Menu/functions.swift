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
    
        print("\nDigite o que deseja fazer:")
    while true {
        let optionNumber = Int(readLine() ?? "-1")
        do {
            let optionInEnum: MenuChoicesEnum = try MenuChoicesEnum.init(choiceNumber: optionNumber ?? -1)
            if optionInEnum == MenuChoicesEnum.Sair {
                clearTerminal()
                print("Obrigado por usar a BuyTunes!")
                print("Volte sempre!\n")
                return
            }
        } catch MenuErrorType.invalidOption {
            print("\nEi! O que você digitou não é uma opção válida :(")
            print("Digite uma das quatro opçoes mostradas no menu!")
        } catch {
            print("Erro ao iniciar MenuChoicesEnum")
        }
    }
}
