//
//  Character.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let origin: Origin
    let location: LocationReference
}

// MARK: - Origin & LocationReference

struct Origin: Decodable {
    let name: String
    let url: String
}

struct LocationReference: Decodable {
    let name: String
    let url: String
}

// MARK: - CharacterResponse (se agrega al final de este archivo)

struct CharacterResponse: Decodable {
    let info: PageInfo
    let results: [Character]
}

struct PageInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}


