//
//  CharacterListView.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterListViewModel()

    var body: some View {
        NavigationView {
            // Si está cargando y no hay personajes, mostrar loader principal
            if viewModel.isLoading && viewModel.characters.isEmpty {
                ProgressView("Cargando personajes...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Si hay error, mostrar mensaje y botón de reintento
            } else if let errorMessage = viewModel.errorMessage {
                ErrorView(message: errorMessage) {
                    Task { await viewModel.fetchCharacters() }
                }

            // Lista de personajes
            } else {
                List {
                    ForEach(viewModel.characters, id: \.id) { character in
                        CharacterRowView(character: character)
                            .onAppear {
                                // Scroll infinito: si es el último personaje, cargar siguiente página
                                if character.id == viewModel.characters.last?.id  {
                                    Task { await viewModel.fetchCharacters() }
                                }
                            }
                    }

                    // Loader al final de la lista cuando se cargan más páginas
                    if viewModel.isLoading && !viewModel.characters.isEmpty {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Personajes")
        .task {
            // Cargar primera página al aparecer
            await viewModel.fetchCharacters()
        }
    }
}

/// Subvista para una fila de personaje
struct CharacterRowView: View {
    let character: Character

    var body: some View {
        NavigationLink(destination: CharacterDetailView(character: character)) {
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 60)
                .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.headline)
                    Text(character.species)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 8)
        }
    }
}

/// Subvista para mostrar un mensaje de error con botón de reintento
struct ErrorView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text(message)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            Button("Reintentar", action: retryAction)
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}




