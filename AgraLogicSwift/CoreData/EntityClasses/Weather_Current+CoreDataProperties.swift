//
//  Weather_Current+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Weather_Current {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather_Current> {
        return NSFetchRequest<Weather_Current>(entityName: "Weather_Current")
    }

    @NSManaged public var cloudcover: String?
    @NSManaged public var feelsLikeC: String?
    @NSManaged public var feelsLikeF: String?
    @NSManaged public var humidity: String?
    @NSManaged public var maxtempC: String?
    @NSManaged public var maxtempF: String?
    @NSManaged public var mintempC: String?
    @NSManaged public var mintempF: String?
    @NSManaged public var observation_time: String?
    @NSManaged public var precipMM: String?
    @NSManaged public var pressure: String?
    @NSManaged public var temp_C: String?
    @NSManaged public var temp_F: String?
    @NSManaged public var visibility: String?
    @NSManaged public var weatherCode: String?
    @NSManaged public var weatherDesc: String?
    @NSManaged public var winddir16Point: String?
    @NSManaged public var winddirDegree: String?
    @NSManaged public var windspeedKmph: String?
    @NSManaged public var windspeedMiles: String?
    @NSManaged public var hourlyWeather: NSOrderedSet?

}

// MARK: Generated accessors for hourlyWeather
extension Weather_Current {

    @objc(insertObject:inHourlyWeatherAtIndex:)
    @NSManaged public func insertIntoHourlyWeather(_ value: Weather_Hourly, at idx: Int)

    @objc(removeObjectFromHourlyWeatherAtIndex:)
    @NSManaged public func removeFromHourlyWeather(at idx: Int)

    @objc(insertHourlyWeather:atIndexes:)
    @NSManaged public func insertIntoHourlyWeather(_ values: [Weather_Hourly], at indexes: NSIndexSet)

    @objc(removeHourlyWeatherAtIndexes:)
    @NSManaged public func removeFromHourlyWeather(at indexes: NSIndexSet)

    @objc(replaceObjectInHourlyWeatherAtIndex:withObject:)
    @NSManaged public func replaceHourlyWeather(at idx: Int, with value: Weather_Hourly)

    @objc(replaceHourlyWeatherAtIndexes:withHourlyWeather:)
    @NSManaged public func replaceHourlyWeather(at indexes: NSIndexSet, with values: [Weather_Hourly])

    @objc(addHourlyWeatherObject:)
    @NSManaged public func addToHourlyWeather(_ value: Weather_Hourly)

    @objc(removeHourlyWeatherObject:)
    @NSManaged public func removeFromHourlyWeather(_ value: Weather_Hourly)

    @objc(addHourlyWeather:)
    @NSManaged public func addToHourlyWeather(_ values: NSOrderedSet)

    @objc(removeHourlyWeather:)
    @NSManaged public func removeFromHourlyWeather(_ values: NSOrderedSet)

}
