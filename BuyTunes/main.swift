//
//  main.swift
//  BuyTunes
//
//  Created by Thaís Fernandes on 16/03/21.
//

import Foundation

var date = DateComponents(calendar: .current, year: 2021, month: 3, day: 16, hour: 15, minute: 30, second: 12).date!

var adele = Artist(name: "Adele", about: "idk")
var taylor = Artist(name: "Taylor Swift", about: "helpp")

adele.addSong(title: "Rolling in the Deep", releaseDate: date, price: 2.99)
adele.addSong(title: "Set fire to the rain", releaseDate: date, price: 2.99)
Library.sharedInstance.songsAvaliable.append(contentsOf: adele.songs)

taylor.addSong(title: "ME!", releaseDate: date, price: 2.99)
taylor.addSong(title: "Love story", releaseDate: date, price: 2.99)
Library.sharedInstance.songsAvaliable.append(contentsOf: taylor.songs)

let artists = [adele, taylor]
Artists.sharedInstance.artistsAvaliable = artists

showMenu()
