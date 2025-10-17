//
//  AppDIContainer.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import Foundation
import Swinject

/// Contenedor de dependencias principal de la app.
/// Se encarga de registrar todos los servicios, repositorios y view models.
final class AppDIContainer {
    static let shared = AppDIContainer()
    let container = Container()

    private init() {
        registerDependencies()
    }

    private func registerDependencies() {
        container.register(CharacterListViewModel.self) { _ in
            CharacterListViewModel(repository: MockCharacterRepository())
        }
    }
}
