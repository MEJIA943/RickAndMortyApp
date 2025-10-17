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
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando personajes...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                        Button("Reintentar") {
                            Task { await viewModel.fetchCharacters() }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    //Lista de personajes
                    List(viewModel.characters, id: \.id) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            HStack {
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
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Personajes")
            .task {
                //Llamamos al ViewModel cuando la vista aparece
                await viewModel.fetchCharacters()
            }
        }
    }
}

