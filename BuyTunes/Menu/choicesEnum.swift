//
//  menuChoicesEnum.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

enum MenuChoices: String, CaseIterable {
    case Sair
    case Comprar
    case Procurar
    case Listar_Compras
    
    init(choiceNumber: Int) throws {
        switch choiceNumber {
        case 0:
            self = .Sair
        case 1:
            self = .Comprar
        case 2:
            self = .Procurar
        case 3:
            self = .Listar_Compras
        default:
            throw MenuErrorType.invalidOption
        }
    }
}

enum SearchChoices: String, CaseIterable {
    case Voltar
    case Por_Artistas
    case Ver_Todas
    
    init(choiceNumber: Int) throws {
        switch choiceNumber {
        case 0:
            self = .Voltar
        case 1:
            self = .Por_Artistas
        case 2:
            self = .Ver_Todas
        default:
            throw MenuErrorType.invalidOption
        }
    }
}

enum ArtistSearchChoices: String, CaseIterable {
    case Voltar
    case Por_Nome
    case Ver_Todos
    
    init(choiceNumber: Int) throws {
        switch choiceNumber {
        case 0:
            self = .Voltar
        case 1:
            self = .Por_Nome
        case 2:
            self = .Ver_Todos
        default:
            throw MenuErrorType.invalidOption
        }
    }
}
