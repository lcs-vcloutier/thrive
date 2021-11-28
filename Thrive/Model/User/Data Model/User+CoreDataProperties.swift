//
//  User+CoreDataProperties.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var dayStreak: Int16
    @NSManaged public var grade: String
    @NSManaged public var lastTestDate: Date?
    @NSManaged public var name: String
    @NSManaged public var surname: String
    @NSManaged public var totalScore: Int32

}

extension User : Identifiable {

}
