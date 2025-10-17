//
//  AppDIContainer.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation
import Swinject

final class AppDIContainer {
    static let shared = AppDIContainer()
    let container = Container()

    private init() {
        registerDependencies()
    }

    private func registerDependencies() {
        container.register(CharacterRepository.self) { _ in
            CharacterRepositoryImpl()
        }

        //Llamamos al inicializador dentro del MainActor
        container.register(CharacterListViewModel.self) { resolver in
            let repository = resolver.resolve(CharacterRepository.self)!
            return MainActor.assumeIsolated {
                CharacterListViewModel(repository: repository)
            }
        }
    }
}

