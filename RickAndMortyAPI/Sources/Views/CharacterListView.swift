//
//  CharacterListView.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Text("Rick and Morty API App")
                    .font(.title)
                    .padding()

                Text("Aquí irá la lista de personajes")
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("Personajes")
        }
    }
}

#Preview {
    CharacterListView(viewModel: CharacterListViewModel(repository: MockCharacterRepository()))
}
