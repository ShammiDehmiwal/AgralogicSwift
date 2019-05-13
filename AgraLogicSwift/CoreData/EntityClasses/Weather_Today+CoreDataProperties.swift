//
//  Weather_Today+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Weather_Today {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather_Today> {
        return NSFetchRequest<Weather_Today>(entityName: "Weather_Today")
    }

    @NSManaged public var condition: String?
    @NSManaged public var temp: NSNumber?
    @NSManaged public var temp_hi: NSNumber?
    @NSManaged public var temp_lo: NSNumber?
    @NSManaged public var day: NSOrderedSet?

}

// MARK: Generated accessors for day
extension Weather_Today {

    @objc(insertObject:inDayAtIndex:)
    @NSManaged public func insertIntoDay(_ value: Weather_Day, at idx: Int)

    @objc(removeObjectFromDayAtIndex:)
    @NSManaged public func removeFromDay(at idx: Int)

    @objc(insertDay:atIndexes:)
    @NSManaged public func insertIntoDay(_ values: [Weather_Day], at indexes: NSIndexSet)

    @objc(removeDayAtIndexes:)
    @NSManaged public func removeFromDay(at indexes: NSIndexSet)

    @objc(replaceObjectInDayAtIndex:withObject:)
    @NSManaged public func replaceDay(at idx: Int, with value: Weather_Day)

    @objc(replaceDayAtIndexes:withDay:)
    @NSManaged public func replaceDay(at indexes: NSIndexSet, with values: [Weather_Day])

    @objc(addDayObject:)
    @NSManaged public func addToDay(_ value: Weather_Day)

    @objc(removeDayObject:)
    @NSManaged public func removeFromDay(_ value: Weather_Day)

    @objc(addDay:)
    @NSManaged public func addToDay(_ values: NSOrderedSet)

    @objc(removeDay:)
    @NSManaged public func removeFromDay(_ values: NSOrderedSet)

}
