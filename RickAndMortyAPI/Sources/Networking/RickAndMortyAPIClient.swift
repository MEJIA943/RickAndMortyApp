//
//  RickAndMortyAPIClient.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

// Clase que usa el HTTPClient para interactuar con los endpoints de la API.

import Foundation

final class RickAndMortyAPIClient {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient = URLSessionHTTPClient()) {
        self.httpClient = httpClient
    }

    // MARK: - Characters

    func fetchCharacters(page: Int = 1) async throws -> CharacterResponse {
        let endpoint = APIEndpoints.characters(page: page)
        let response: CharacterResponse = try await httpClient.request(endpoint)
        return response    }
}

