//
//  removeUnderlines.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 16/03/21.
//

import Foundation

extension String {
    func removeUnderlines() -> String {
        return self.replacingOccurrences(of: "_", with: " ")
    }
}
