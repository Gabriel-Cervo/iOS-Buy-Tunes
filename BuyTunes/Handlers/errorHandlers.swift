//
//  errorHandlers.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func handleInvalidOption() {
    print("\nEi! O que você digitou não é uma opção válida :(")
}

func handleInvalidMusic() {
    clearTerminal()
    print("\nA música que você digitou não existe ou você já tem ela na sua galeria!")
}

func handleGeneralError(of error: Error) {
    print("[ERROR]: \(error.localizedDescription)")
}
