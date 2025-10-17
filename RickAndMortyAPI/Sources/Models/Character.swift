//
//  Character.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

/// Modelo básico de personaje para pruebas iniciales.
struct Character: Identifiable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
}

