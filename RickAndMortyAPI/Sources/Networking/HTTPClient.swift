//
//  HTTPClient.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//
// Clase responsable de realizar las peticiones HTTP genéricas (capa más baja de red)

import Foundation

protocol HTTPClient {
    func request<T: Decodable>(_ url: URL) async throws -> T
}

final class URLSessionHTTPClient: HTTPClient {
    func request<T: Decodable>(_ url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}

