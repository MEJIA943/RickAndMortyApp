//
//  CharacterListViewModel.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation
import Combine

/// ViewModel principal para el listado de personajes.
final class CharacterListViewModel: ObservableObject {
    // MARK: - Propiedades publicadas
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: CharacterRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Inicializador
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
        loadCharacters()
    }

    // MARK: - Métodos
    func loadCharacters() {
        isLoading = true
        Task {
            do {
                let result = try await repository.fetchCharacters()
                DispatchQueue.main.async {
                    self.characters = result
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error al cargar personajes"
                    self.isLoading = false
                }
            }
        }
    }
}
