//
//  CharacterListViewModel.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation

@MainActor //Asegura que las actualizaciones de UI se hagan en el hilo principal
final class CharacterListViewModel: ObservableObject {

    // MARK: - Propiedades observables
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let repository: CharacterRepository

    // MARK: - Inicializador
    init(repository: CharacterRepository = CharacterRepositoryImpl()) {
        self.repository = repository
    }

    // MARK: - Lógica principal
    func fetchCharacters() async {
        isLoading = true
        errorMessage = nil

        do {
            // Llamada al repositorio para obtener los personajes
            let fetchedCharacters = try await repository.getCharacters(page: 1)
            self.characters = fetchedCharacters
        } catch {
            // Si ocurre un error (red, decodificación, etc.)
            self.errorMessage = "No se pudieron cargar los personajes"
            print("Error fetching characters: \(error.localizedDescription)")
        }

        isLoading = false
    }
}

