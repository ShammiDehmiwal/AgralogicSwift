//
//  GenActivityType+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension GenActivityType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenActivityType> {
        return NSFetchRequest<GenActivityType>(entityName: "GenActivityType")
    }

    @NSManaged public var activity_type: String?
    @NSManaged public var create_permission: NSNumber?
    @NSManaged public var enabled: NSNumber?
    @NSManaged public var id: NSNumber?
    @NSManaged public var activityTypeField: NSOrderedSet?

}

// MARK: Generated accessors for activityTypeField
extension GenActivityType {

    @objc(insertObject:inActivityTypeFieldAtIndex:)
    @NSManaged public func insertIntoActivityTypeField(_ value: GenActivityTypeField, at idx: Int)

    @objc(removeObjectFromActivityTypeFieldAtIndex:)
    @NSManaged public func removeFromActivityTypeField(at idx: Int)

    @objc(insertActivityTypeField:atIndexes:)
    @NSManaged public func insertIntoActivityTypeField(_ values: [GenActivityTypeField], at indexes: NSIndexSet)

    @objc(removeActivityTypeFieldAtIndexes:)
    @NSManaged public func removeFromActivityTypeField(at indexes: NSIndexSet)

    @objc(replaceObjectInActivityTypeFieldAtIndex:withObject:)
    @NSManaged public func replaceActivityTypeField(at idx: Int, with value: GenActivityTypeField)

    @objc(replaceActivityTypeFieldAtIndexes:withActivityTypeField:)
    @NSManaged public func replaceActivityTypeField(at indexes: NSIndexSet, with values: [GenActivityTypeField])

    @objc(addActivityTypeFieldObject:)
    @NSManaged public func addToActivityTypeField(_ value: GenActivityTypeField)

    @objc(removeActivityTypeFieldObject:)
    @NSManaged public func removeFromActivityTypeField(_ value: GenActivityTypeField)

    @objc(addActivityTypeField:)
    @NSManaged public func addToActivityTypeField(_ values: NSOrderedSet)

    @objc(removeActivityTypeField:)
    @NSManaged public func removeFromActivityTypeField(_ values: NSOrderedSet)

}
