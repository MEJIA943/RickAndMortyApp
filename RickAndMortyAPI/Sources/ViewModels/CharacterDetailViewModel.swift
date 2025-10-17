//
//  CharacterDetailViewModel.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

@MainActor
final class CharacterDetailViewModel: ObservableObject {
    // MARK: - Propiedades
    @Published var character: Character

    // MARK: - Inicializador
    init(character: Character) {
        self.character = character
    }

    //episodios en los que aparece el personaje.
}
