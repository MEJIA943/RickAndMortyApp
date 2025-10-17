//
//  CharacterRepository.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

protocol CharacterRepository {
    /// Obtiene la lista de personajes paginada
    /// - Parameter page: número de página a consultar
    func getCharacters(page: Int) async throws -> CharacterResponse
}



