//
//  Ranch+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Ranch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ranch> {
        return NSFetchRequest<Ranch>(entityName: "Ranch")
    }

    @NSManaged public var account_id: String?
    @NSManaged public var ranch_acreage: String?
    @NSManaged public var ranch_canonical_name: String?
    @NSManaged public var ranch_crop: String?
    @NSManaged public var ranch_crop_id: String?
    @NSManaged public var ranch_desc: String?
    @NSManaged public var ranch_farm_id: String?
    @NSManaged public var ranch_farm_name: String?
    @NSManaged public var ranch_field_img: String?
    @NSManaged public var ranch_fields_count: String?
    @NSManaged public var ranch_fname: String?
    @NSManaged public var ranch_id: String?
    @NSManaged public var ranch_name: String?
    @NSManaged public var ranch_user_summary: String?
    @NSManaged public var tags: NSData?
    @NSManaged public var activities: NSOrderedSet?
    @NSManaged public var observations: NSOrderedSet?
    @NSManaged public var photos: NSOrderedSet?
    @NSManaged public var weather: Weather_Today?
    @NSManaged public var hasFields: NSSet?

}

// MARK: Generated accessors for activities
extension Ranch {

    @objc(insertObject:inActivitiesAtIndex:)
    @NSManaged public func insertIntoActivities(_ value: Activities, at idx: Int)

    @objc(removeObjectFromActivitiesAtIndex:)
    @NSManaged public func removeFromActivities(at idx: Int)

    @objc(insertActivities:atIndexes:)
    @NSManaged public func insertIntoActivities(_ values: [Activities], at indexes: NSIndexSet)

    @objc(removeActivitiesAtIndexes:)
    @NSManaged public func removeFromActivities(at indexes: NSIndexSet)

    @objc(replaceObjectInActivitiesAtIndex:withObject:)
    @NSManaged public func replaceActivities(at idx: Int, with value: Activities)

    @objc(replaceActivitiesAtIndexes:withActivities:)
    @NSManaged public func replaceActivities(at indexes: NSIndexSet, with values: [Activities])

    @objc(addActivitiesObject:)
    @NSManaged public func addToActivities(_ value: Activities)

    @objc(removeActivitiesObject:)
    @NSManaged public func removeFromActivities(_ value: Activities)

    @objc(addActivities:)
    @NSManaged public func addToActivities(_ values: NSOrderedSet)

    @objc(removeActivities:)
    @NSManaged public func removeFromActivities(_ values: NSOrderedSet)

}

// MARK: Generated accessors for observations
extension Ranch {

    @objc(insertObject:inObservationsAtIndex:)
    @NSManaged public func insertIntoObservations(_ value: Observations, at idx: Int)

    @objc(removeObjectFromObservationsAtIndex:)
    @NSManaged public func removeFromObservations(at idx: Int)

    @objc(insertObservations:atIndexes:)
    @NSManaged public func insertIntoObservations(_ values: [Observations], at indexes: NSIndexSet)

    @objc(removeObservationsAtIndexes:)
    @NSManaged public func removeFromObservations(at indexes: NSIndexSet)

    @objc(replaceObjectInObservationsAtIndex:withObject:)
    @NSManaged public func replaceObservations(at idx: Int, with value: Observations)

    @objc(replaceObservationsAtIndexes:withObservations:)
    @NSManaged public func replaceObservations(at indexes: NSIndexSet, with values: [Observations])

    @objc(addObservationsObject:)
    @NSManaged public func addToObservations(_ value: Observations)

    @objc(removeObservationsObject:)
    @NSManaged public func removeFromObservations(_ value: Observations)

    @objc(addObservations:)
    @NSManaged public func addToObservations(_ values: NSOrderedSet)

    @objc(removeObservations:)
    @NSManaged public func removeFromObservations(_ values: NSOrderedSet)

}

// MARK: Generated accessors for photos
extension Ranch {

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

// MARK: Generated accessors for hasFields
extension Ranch {

    @objc(addHasFieldsObject:)
    @NSManaged public func addToHasFields(_ value: Field)

    @objc(removeHasFieldsObject:)
    @NSManaged public func removeFromHasFields(_ value: Field)

    @objc(addHasFields:)
    @NSManaged public func addToHasFields(_ values: NSSet)

    @objc(removeHasFields:)
    @NSManaged public func removeFromHasFields(_ values: NSSet)

}
