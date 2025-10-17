//
//  APIEndpoints.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

// Define todos los endpoints específicos de la API Rick & Morty.

import Foundation

enum APIEndpoints {
    static func characters(page: Int) -> URL {
        let baseURL = "https://rickandmortyapi.com/api"
        return URL(string: "\(baseURL)/character?page=\(page)")!
    }
}

