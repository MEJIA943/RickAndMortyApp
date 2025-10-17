//
//  CharacterRepository.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func fetchCharacters() async throws -> [Character]
}


