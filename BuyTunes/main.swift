//
//  main.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

//func printList (_ list: Array<Printable>) {
//    for item in list {
//        print(item.description)
//    }
//}

var date = DateComponents(calendar: .current, year: 2021, month: 3, day: 16, hour: 15, minute: 30, second: 12).date!

var adele = Artist(name: "Adele", about: "idk")
var taylor = Artist(name: "Taylor Swift", about: "helpp")

adele.addSong(title: "Rolling in the Deep", releaseDate: date, price: 2.99)
adele.addSong(title: "Set fire to the rain", releaseDate: date, price: 2.99)
Cart.sharedInstance.songsAvaliable.append(contentsOf: adele.songs)

taylor.addSong(title: "ME!", releaseDate: date, price: 2.99)
taylor.addSong(title: "Love story", releaseDate: date, price: 2.99)

let artists = [adele, taylor]

//artists.forEach { artist in
//    print(artist.name)
//    printList(artist.songs)
//}

try? Cart.sharedInstance.buyMusic("Rolling in the Deep")
//print("Songs Avaliable: \(Cart.sharedInstance.songsAvaliable)")
//print("Songs purchased: \(Cart.sharedInstance.songsPurchased)")


//showMenu()
handleListPurchases()
