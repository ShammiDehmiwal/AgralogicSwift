//
//  CDDWeather+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension CDDWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDWeather> {
        return NSFetchRequest<CDDWeather>(entityName: "CDDWeather")
    }

    @NSManaged public var cddDate: NSDate?
    @NSManaged public var maxtempF: String?
    @NSManaged public var mintempF: String?
    @NSManaged public var weatherCode: String?
    @NSManaged public var windspeedMiles: String?

}
