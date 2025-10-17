//
//  CoreDataStack.swift
//  RickAndMortyAPI
//
//  Created by Eduardo Javier Mejia Valdiviezo on 17/10/25.
//

import CoreData

/// Stack de CoreData para la app
final class CoreDataStack {
    static let shared = CoreDataStack()
    
    // Contexto principal para UI y repositorios
    lazy var context: NSManagedObjectContext = persistentContainer.viewContext
    
    private init() {}
    
    // Contenedor persistente
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RickAndMortyModel") // debe coincidir con tu .xcdatamodeld
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("No se pudo cargar CoreData: \(error)")
            }
        }
        return container
    }()
    
    // Guardar cambios
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error guardando CoreData: \(error)")
            }
        }
    }
}

