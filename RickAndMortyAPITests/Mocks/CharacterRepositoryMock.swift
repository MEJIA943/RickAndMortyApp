//
//  CharacterRepositoryMock.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation
@testable import RickAndMortyAPI

final class CharacterRepositoryMock: CharacterRepository {
    var shouldFail = false

    func getCharacters(page: Int) async throws -> [Character] {
        if shouldFail {
            throw URLError(.badServerResponse)
        }

        //Retorna datos de ejemplo simulados
        return [
            Character(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                gender: "Male",
                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                origin: Origin(name: "Earth (C-137)", url: ""),
                location: LocationReference(name: "Citadel of Ricks", url: "")
            )
        ]
    }
}
