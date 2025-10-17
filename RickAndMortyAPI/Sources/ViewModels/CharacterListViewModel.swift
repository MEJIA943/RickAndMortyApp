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
    private var currentPage = 1       // Página actual
    private var totalPages: Int?      // Total de páginas disponibles
    private var isFetching = false
    
    // MARK: - Inicializador
    init(repository: CharacterRepository = CharacterRepositoryImpl()) {
        self.repository = repository
    }
    
    /// Función principal para cargar personajes (primera página o siguiente)
    func fetchCharacters() async {
        guard !isFetching else { return }               // Evitar múltiples llamadas
        if let total = totalPages, currentPage > total {
            return                                        // Ya no hay más páginas
        }
        
        isFetching = true
        isLoading = true
        errorMessage = nil
        
        do {
            // ⚠ Aquí obtenemos CharacterResponse, no [Character]
            let response = try await repository.getCharacters(page: currentPage)

            // Append de los personajes a la lista
            characters.append(contentsOf: response.results)

            // Guardamos totalPages desde response.info
            totalPages = response.info.pages
        currentPage += 1
        } catch {
            errorMessage = "No se pudieron cargar los personajes"
            print(error)
        }

        isLoading = false
        isFetching = false
    }
}

