//
//  Updated+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Updated {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Updated> {
        return NSFetchRequest<Updated>(entityName: "Updated")
    }

    @NSManaged public var activity_id: NSNumber?
    @NSManaged public var observation_id: NSNumber?
    @NSManaged public var activity: Activities?
    @NSManaged public var observation: Observations?

}
