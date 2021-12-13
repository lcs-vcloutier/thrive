//
//  UserViewModel.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-12-12.
//

import Foundation
import CoreData

class UserViewModel {
    
    let persistenceController = PersistenceController.shared
    
    var user: User?
    
    func createUser(userName: String, userSurname: String, userAge: String, userGrade: String) {
        
        let user = User(context: self.persistenceController.container.viewContext)
        
        self.user!.name = "Efe"
        self.user!.surname = "Yencilek"
        self.user!.age = Int16(Int(userAge)!)
        self.user!.grade = "11"
        self.user!.dayStreak = 0
        self.user!.totalScore = 0
        self.user!.lastTestDate = nil
        
        self.user = user
        
        do {
            try self.persistenceController.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Update user
    func updateUser() {
        user?.dayStreak += 1
        // Increment of .25 with each day (beginning 1x and max 3x)
        let effectiveStreak = (user!.dayStreak - 2 > 0) ? user!.dayStreak : 0
        let multiplier = 1 + Int(0.25 * Double(effectiveStreak))
        let clamped = (multiplier > 3) ? 3 : multiplier
        user!.totalScore += Int32(100 * clamped)
        // Change the last test date to now
        user!.lastTestDate = Date.now

        // Save Context
        do {
            try persistenceController.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchUser() {
        // Configure a fetch request to fetch at most 1 result
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.fetchLimit = 1

        // Get a reference to a NSManagedObjectContext
        let context = self.persistenceController.container.viewContext

        // Fetch a single object. If the object does not exist,
        // nil is returned
        do {
            self.user = try (context.fetch(fetchRequest).first as? User)
        } catch {
            self.user = nil
        }
    }
    
    init() {
        self.fetchUser()
    }
}
