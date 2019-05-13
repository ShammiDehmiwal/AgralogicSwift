//
//  Photo+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var create_time: NSDate?
    @NSManaged public var date_time: NSDate?
    @NSManaged public var file_name: String?
    @NSManaged public var file_size: NSNumber?
    @NSManaged public var lat: NSNumber?
    @NSManaged public var lng: NSNumber?
    @NSManaged public var photo_id: NSNumber?
    @NSManaged public var photo_name: String?
    @NSManaged public var photo_url_original: String?
    @NSManaged public var photo_url_thumb: String?
    @NSManaged public var processing: NSNumber?
    @NSManaged public var summary: String?
    @NSManaged public var type: String?
    @NSManaged public var user_id: NSNumber?
    @NSManaged public var user_name: String?

}
