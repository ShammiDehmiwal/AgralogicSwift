//
//  User+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var user_fname: String?
    @NSManaged public var user_id: String?
    @NSManaged public var user_lname: String?
    @NSManaged public var user_screen_name: String?

}
