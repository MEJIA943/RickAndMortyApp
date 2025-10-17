//
//  RickAndMortyAPIApp.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 16/10/25.
//

import SwiftUI
import Swinject

@main
struct RickAndMortyAPIApp: App {
    
    private let container = AppDIContainer.shared.container
    
    var body: some Scene {
        WindowGroup {
            CharacterListView(
                            viewModel: container.resolve(CharacterListViewModel.self)!
                        )
        }
    }
}
