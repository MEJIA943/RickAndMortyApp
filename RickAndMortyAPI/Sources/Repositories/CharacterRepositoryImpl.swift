//
//  CharacterRepositoryImpl.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

/// Repositorio de prueba temporal.
final class MockCharacterRepository: CharacterRepositoryProtocol {
    func fetchCharacters() async throws -> [Character] {
        return [
            Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human"),
            Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human"),
            Character(id: 3, name: "Birdperson", status: "Dead", species: "Alien")
        ]
    }
}
