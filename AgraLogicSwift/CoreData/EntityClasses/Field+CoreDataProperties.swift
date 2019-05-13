//
//  Field+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Field {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Field> {
        return NSFetchRequest<Field>(entityName: "Field")
    }

    @NSManaged public var field_acreage: String?
    @NSManaged public var field_crop: String?
    @NSManaged public var field_id: String?
    @NSManaged public var field_name: String?
    @NSManaged public var field_summary: String?
    @NSManaged public var ranch_id: String?
    @NSManaged public var coordinates: NSOrderedSet?
    @NSManaged public var middle_point: Coordinates?

}

// MARK: Generated accessors for coordinates
extension Field {

    @objc(insertObject:inCoordinatesAtIndex:)
    @NSManaged public func insertIntoCoordinates(_ value: Coordinates, at idx: Int)

    @objc(removeObjectFromCoordinatesAtIndex:)
    @NSManaged public func removeFromCoordinates(at idx: Int)

    @objc(insertCoordinates:atIndexes:)
    @NSManaged public func insertIntoCoordinates(_ values: [Coordinates], at indexes: NSIndexSet)

    @objc(removeCoordinatesAtIndexes:)
    @NSManaged public func removeFromCoordinates(at indexes: NSIndexSet)

    @objc(replaceObjectInCoordinatesAtIndex:withObject:)
    @NSManaged public func replaceCoordinates(at idx: Int, with value: Coordinates)

    @objc(replaceCoordinatesAtIndexes:withCoordinates:)
    @NSManaged public func replaceCoordinates(at indexes: NSIndexSet, with values: [Coordinates])

    @objc(addCoordinatesObject:)
    @NSManaged public func addToCoordinates(_ value: Coordinates)

    @objc(removeCoordinatesObject:)
    @NSManaged public func removeFromCoordinates(_ value: Coordinates)

    @objc(addCoordinates:)
    @NSManaged public func addToCoordinates(_ values: NSOrderedSet)

    @objc(removeCoordinates:)
    @NSManaged public func removeFromCoordinates(_ values: NSOrderedSet)

}
