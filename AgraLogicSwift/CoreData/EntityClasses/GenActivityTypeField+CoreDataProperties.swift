//
//  GenActivityTypeField+CoreDataProperties.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData


extension GenActivityTypeField {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenActivityTypeField> {
        return NSFetchRequest<GenActivityTypeField>(entityName: "GenActivityTypeField")
    }

    @NSManaged public var name_field_defaultValue: NSData?
    @NSManaged public var name_field_enable: NSNumber?
    @NSManaged public var name_field_is_lock_value: NSNumber?
    @NSManaged public var name_field_is_scanned: NSNumber?
    @NSManaged public var name_field_label: String?
    @NSManaged public var name_field_lock_value_options: NSData?
    @NSManaged public var name_field_meta: String?
    @NSManaged public var name_field_modify_at_complete: NSNumber?
    @NSManaged public var name_field_only_admin_can_update: NSNumber?
    @NSManaged public var name_field_only_admin_can_view_mobile: NSNumber?
    @NSManaged public var name_field_required: NSNumber?
    @NSManaged public var name_field_type: String?
    @NSManaged public var name_field_value: NSNumber?
    @NSManaged public var quantity_field_defaultValue: NSData?
    @NSManaged public var quantity_field_enable: NSNumber?
    @NSManaged public var quantity_field_is_lock_value: NSNumber?
    @NSManaged public var quantity_field_is_scanned: NSNumber?
    @NSManaged public var quantity_field_label: String?
    @NSManaged public var quantity_field_lock_value_options: NSData?
    @NSManaged public var quantity_field_meta: String?
    @NSManaged public var quantity_field_modify_at_complete: NSNumber?
    @NSManaged public var quantity_field_only_admin_can_update: NSNumber?
    @NSManaged public var quantity_field_only_admin_can_view_mobile: NSNumber?
    @NSManaged public var quantity_field_required: NSNumber?
    @NSManaged public var quantity_field_type: String?
    @NSManaged public var quantity_field_value: NSNumber?
    @NSManaged public var unit_field_defaultValue: NSData?
    @NSManaged public var unit_field_enable: NSNumber?
    @NSManaged public var unit_field_is_lock_value: NSNumber?
    @NSManaged public var unit_field_is_scanned: NSNumber?
    @NSManaged public var unit_field_label: String?
    @NSManaged public var unit_field_lock_value_options: NSData?
    @NSManaged public var unit_field_meta: String?
    @NSManaged public var unit_field_modify_at_complete: NSNumber?
    @NSManaged public var unit_field_only_admin_can_update: NSNumber?
    @NSManaged public var unit_field_only_admin_can_view_mobile: NSNumber?
    @NSManaged public var unit_field_required: NSNumber?
    @NSManaged public var unit_field_type: String?
    @NSManaged public var unit_field_value: NSNumber?

}
