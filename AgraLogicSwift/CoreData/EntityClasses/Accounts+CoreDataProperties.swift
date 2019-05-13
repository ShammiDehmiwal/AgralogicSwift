//
//  Accounts+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension Accounts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Accounts> {
        return NSFetchRequest<Accounts>(entityName: "Accounts")
    }

    @NSManaged public var account_id: NSNumber?
    @NSManaged public var account_name: String?
    @NSManaged public var acreage: NSNumber?
    @NSManaged public var crops: NSObject?
    @NSManaged public var enabled: NSNumber?
    @NSManaged public var ranches_count: NSNumber?

}
