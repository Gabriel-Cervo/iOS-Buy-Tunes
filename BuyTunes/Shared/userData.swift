//
//  userData.swift
//  BuyTunes
//
//  Created by Joao Gabriel Dourado Cervo on 18/03/21.
//

import Foundation

func saveData<T: Encodable>(key: String, data: T) throws {
    let jsonEncoder = JSONEncoder()
    if let savedData = try? jsonEncoder.encode(data) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(savedData, forKey: key)
    } else {
        throw DataErrorType.saveError
    }
}

func loadData(key: String) throws -> [Song] {
    let userDefaults = UserDefaults.standard
    if let userData = userDefaults.data(forKey: key) {
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode([Song].self, from: userData) else {
            throw DataErrorType.loadError
        }
        return decodedData
    }

    return [Song]()
}

func loadSongsFromJSON() throws {
    let jsonDecoder = JSONDecoder()
    
    guard let dataUrl = Bundle.main.url(forResource: "data", withExtension: "json") else {
        fatalError("ERRO AO PEGAR URL")
    }
    let data = try! Data(contentsOf: dataUrl)
    
    if let decodedData = try? jsonDecoder.decode([Artist].self, from: data) {
        Artists.sharedInstance.artistsAvaliable = decodedData
        
        decodedData.map({ $0.songs }).forEach { Library.sharedInstance.songsAvaliable.append(contentsOf: $0) }
    }
    
}

func resetData() {
    let userDefaults = UserDefaults.standard
    userDefaults.removeObject(forKey: "userMusics")
    userDefaults.removeObject(forKey: "avaliableMusics")
}
