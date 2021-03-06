//
//  errorHandlers.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func handleError(of error: Error) {
    switch type(of: error) {
    case is MenuErrorType.Type: handleInvalidOption()
    case is LibraryErrorType.Type: handleInvalidMusic()
    case is ArtistErrorType.Type: handleArtistNotFound()
    case is DataErrorType.Type: handleDataError(of: error)
    default: print("[ERROR]: \(error.localizedDescription)")
    }
}

func handleInvalidOption() {
    print("\nEi! O que você digitou não é uma opção válida :(")
}

func handleInvalidMusic() {
    clearTerminal()
    print("\nA música que você digitou não existe ou você já tem ela na sua galeria!")
}

func handleArtistNotFound() {
    clearTerminal()
    print("\nO artista que você digitou não existe ou não está no nosso sistema :(")
}

func handleDataError(of error: Error) {
    clearTerminal()
    
    if let error = error as? DataErrorType {
        if error == DataErrorType.saveError {
            print("Houve um erro ao salvar seus dados :(")
        } else if error == DataErrorType.loadError {
            print("Houve um erro ao carregar os dados do programa, reinicie e tente novamente.")
        }
    } else {
        print("Um erro ocorreu ao carregar ou salvar seus dados: \(error.localizedDescription)")
    }
}
