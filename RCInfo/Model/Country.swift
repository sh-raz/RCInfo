//
//  Countries.swift
//  RCInfo
//
//  Created by shilani on 15/03/2024.
//

import Foundation

//struct Countries: Codable {
//    let countries: [ Country ]
//}
 
        
struct Country: Codable, Hashable {
    let name: Name
    let unMember: Bool
    let capital: [String]?
    let region: String
    let currencies: Currencies?
    let subregion: String?
    let flag: String
    let population: Double
    let timezones: [String]
    let continents: [String]
    let flags: Flag
    
    
}

struct Name: Codable, Hashable{
    let common: String
}

struct Flag: Codable, Hashable{
    let png: String
    let svg: String
    //let alt: String
}

struct Currencies: Codable, Hashable{
    let currency: [String: Currency]?
}

struct Currency : Codable, Hashable{
    let name: String
    let symbol: String
}

