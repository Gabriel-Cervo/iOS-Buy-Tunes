//
//  readLine.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 17/03/21.
//

import Foundation

func handleReadLine () -> Int {
    return Int(readLine() ?? "-1") ?? -1
}
