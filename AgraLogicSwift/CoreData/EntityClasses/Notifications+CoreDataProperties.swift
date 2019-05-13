//
//  Notifications+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Notifications {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notifications> {
        return NSFetchRequest<Notifications>(entityName: "Notifications")
    }

    @NSManaged public var account_id: NSNumber?
    @NSManaged public var category: String?
    @NSManaged public var event_data_fetched: NSNumber?
    @NSManaged public var event_date: NSDate?
    @NSManaged public var event_id: NSNumber?
    @NSManaged public var id: String?
    @NSManaged public var parcel_id: NSNumber?
    @NSManaged public var ranch_id: NSNumber?

}
