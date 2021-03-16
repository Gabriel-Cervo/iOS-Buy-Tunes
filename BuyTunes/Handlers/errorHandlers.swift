//
//  errorHandlers.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func handleInvalidOption() {
    print("\nEi! O que você digitou não é uma opção válida :(")
    print("Digite novamente uma opção:")
}

func handleGeneralError(of error: Error) {
    print("[ERROR]: \(error.localizedDescription)")
}
