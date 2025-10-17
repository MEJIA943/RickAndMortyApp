//
//  CharacterDetailView.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var viewModel: CharacterDetailViewModel

    init(character: Character) {
        _viewModel = StateObject(wrappedValue: CharacterDetailViewModel(character: character))
    }

    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: viewModel.character.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }

            Text(viewModel.character.name)
                .font(.largeTitle)
                .bold()

            Text("Estado: \(viewModel.character.status)")
            Text("Especie: \(viewModel.character.species)")
            Text("Género: \(viewModel.character.gender)")
            Text("Origen: \(viewModel.character.origin.name)")
            Text("Ubicación actual: \(viewModel.character.location.name)")

            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

