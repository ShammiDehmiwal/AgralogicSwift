//
//  Weather_Day+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Weather_Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather_Day> {
        return NSFetchRequest<Weather_Day>(entityName: "Weather_Day")
    }

    @NSManaged public var condition: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var day: String?
    @NSManaged public var maxTemp: NSNumber?
    @NSManaged public var minTemp: NSNumber?

}
