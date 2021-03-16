//
//  clearConsole.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

func clearTerminal() {
    print(" ", terminator: Array(repeating: "\n", count: 100).joined())
}
