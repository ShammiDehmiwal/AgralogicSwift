//
//  Event+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var area_type: String?
    @NSManaged public var created_date: NSDate?
    @NSManaged public var event_desc: String?
    @NSManaged public var event_id: String?
    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?
    @NSManaged public var notes: String?
    @NSManaged public var subcategory: String?
    @NSManaged public var title: String?

}
