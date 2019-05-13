//
//  OfflinePhotos+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension OfflinePhotos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OfflinePhotos> {
        return NSFetchRequest<OfflinePhotos>(entityName: "OfflinePhotos")
    }

    @NSManaged public var activity_id: NSNumber?
    @NSManaged public var observation_id: NSNumber?
    @NSManaged public var photoData: NSData?
    @NSManaged public var ranch_id: NSNumber?
    @NSManaged public var activity: Activities?
    @NSManaged public var observation: Observations?
    @NSManaged public var ranch: Ranch?

}
