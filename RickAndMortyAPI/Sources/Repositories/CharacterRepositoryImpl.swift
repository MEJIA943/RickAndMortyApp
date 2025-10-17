//
//  CharacterRepositoryImpl.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

final class CharacterRepositoryImpl: CharacterRepository {
    private let apiClient: RickAndMortyAPIClient

    init(apiClient: RickAndMortyAPIClient = RickAndMortyAPIClient()) {
        self.apiClient = apiClient
    }

    func getCharacters(page: Int) async throws -> CharacterResponse {
        return try await apiClient.fetchCharacters(page: page)
    }
}

