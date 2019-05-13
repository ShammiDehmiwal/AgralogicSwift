//
//  Deleted+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Deleted {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deleted> {
        return NSFetchRequest<Deleted>(entityName: "Deleted")
    }

    @NSManaged public var activity_id: String?
    @NSManaged public var observation_id: String?

}
