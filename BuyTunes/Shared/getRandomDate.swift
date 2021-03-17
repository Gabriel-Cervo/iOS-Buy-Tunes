//
//  getRandomDate.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 17/03/21.
//

import Foundation

func getRandomDate () -> Date {
    return DateComponents(calendar: .current, year: Int.random(in: 2000...2021), month: Int.random(in: 1...12), day: Int.random(in: 1...30)).date!
}
