//
//  Observations+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Observations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Observations> {
        return NSFetchRequest<Observations>(entityName: "Observations")
    }

    @NSManaged public var category: String?
    @NSManaged public var closing_notes: String?
    @NSManaged public var completed_on: NSDate?
    @NSManaged public var delete_permission: NSNumber?
    @NSManaged public var detail: String?
    @NSManaged public var duration: NSNumber?
    @NSManaged public var email: String?
    @NSManaged public var field_id: NSNumber?
    @NSManaged public var field_name: String?
    @NSManaged public var lat: NSNumber?
    @NSManaged public var lng: NSNumber?
    @NSManaged public var notify: String?
    @NSManaged public var observation_description: String?
    @NSManaged public var observation_id: NSNumber?
    @NSManaged public var ranch_id: NSNumber?
    @NSManaged public var ranch_name: String?
    @NSManaged public var scheduled_on: NSDate?
    @NSManaged public var status: String?
    @NSManaged public var sub_category: String?
    @NSManaged public var title: String?
    @NSManaged public var update_permission: NSNumber?
    @NSManaged public var user_defined_category: String?
    @NSManaged public var photos: NSOrderedSet?

}

// MARK: Generated accessors for photos
extension Observations {

    @objc(insertObject:inPhotosAtIndex:)
    @NSManaged public func insertIntoPhotos(_ value: Photo, at idx: Int)

    @objc(removeObjectFromPhotosAtIndex:)
    @NSManaged public func removeFromPhotos(at idx: Int)

    @objc(insertPhotos:atIndexes:)
    @NSManaged public func insertIntoPhotos(_ values: [Photo], at indexes: NSIndexSet)

    @objc(removePhotosAtIndexes:)
    @NSManaged public func removeFromPhotos(at indexes: NSIndexSet)

    @objc(replaceObjectInPhotosAtIndex:withObject:)
    @NSManaged public func replacePhotos(at idx: Int, with value: Photo)

    @objc(replacePhotosAtIndexes:withPhotos:)
    @NSManaged public func replacePhotos(at indexes: NSIndexSet, with values: [Photo])

    @objc(addPhotosObject:)
    @NSManaged public func addToPhotos(_ value: Photo)

    @objc(removePhotosObject:)
    @NSManaged public func removeFromPhotos(_ value: Photo)

    @objc(addPhotos:)
    @NSManaged public func addToPhotos(_ values: NSOrderedSet)

    @objc(removePhotos:)
    @NSManaged public func removeFromPhotos(_ values: NSOrderedSet)

}
