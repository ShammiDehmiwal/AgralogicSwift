//
//  Weather_Hourly+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Weather_Hourly {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather_Hourly> {
        return NSFetchRequest<Weather_Hourly>(entityName: "Weather_Hourly")
    }

    @NSManaged public var chanceOfRain: String?
    @NSManaged public var hour: NSNumber?
    @NSManaged public var humidity: String?
    @NSManaged public var tempC: String?
    @NSManaged public var tempF: String?
    @NSManaged public var weatherCode: String?
    @NSManaged public var weatherDesc: String?
    @NSManaged public var weatherIconUrl: String?
    @NSManaged public var winddir16Point: String?
    @NSManaged public var windspeedKmph: String?
    @NSManaged public var windspeedMiles: String?

}
