//
//  UserPersistenceController.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "UserData")
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                completion(error)
            }
        }
    }
    
    func delete(_ deletingObject: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        context.delete(deletingObject)
        save(completion: completion)
    }
    
}
