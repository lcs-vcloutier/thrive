//
//  UserViewModel.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-12-12.
//

import Foundation
import CoreData

class UserViewModel: ObservableObject {
    
    let persistenceController = PersistenceController.shared
    
    @Published var user: User?
    
    //MARK: Create User
    func createUser(userName: String, userSurname: String, userAge: Int, userGrade: String,_ completion: @escaping (() -> Void)) {
        
        let user = User(context: self.persistenceController.container.viewContext)
        
        user.name = userName
        user.surname = userSurname
        user.age = Int16(userAge)
        user.grade = userGrade
        user.dayStreak = 0
        user.totalScore = 0
        user.lastTestDate = nil
        
        self.user = user
        
        print("User Created.")
        // Save Context
        self.save() {
            completion()
        }
    }
    
    //MARK: Update User
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
        self.save()
    }
    
    //MARK: Fetch Existing User Data
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
    
    //MARK: Save Context
    private func save(_ completion: (() -> Void)? = nil) {
        do {
            try self.persistenceController.container.viewContext.save()
            if completion != nil {
                completion!()
            }
        } catch {
            persistenceController.container.viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    //MARK: Initializer
    init() {
        self.fetchUser()
    }
}
