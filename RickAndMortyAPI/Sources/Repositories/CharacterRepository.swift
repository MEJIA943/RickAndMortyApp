//
//  CharacterRepository.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

protocol CharacterRepository {
    func getCharacters(page: Int) async throws -> [Character]
}



