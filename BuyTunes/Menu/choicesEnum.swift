//
//  menuChoicesEnum.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

enum MenuChoicesEnum: CaseIterable {
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
