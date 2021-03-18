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
