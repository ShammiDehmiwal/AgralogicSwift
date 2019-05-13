//
//  Ranch+CoreDataClass.swift
//  
//
//  Created by Reena on 06/05/19.
//
//

import Foundation
import CoreData

@objc(Ranch)
public class Ranch: NSManagedObject {
    
    
    class func fetchAllEntityFromDB() -> NSArray
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Ranch")
        //request.predicate = NSPredicate(format: "%@ = %@", strAttibuteName,strAttributeValue)
        //request.returnsObjectsAsFaults = false
        do {
            let result = try kAppDelegate.managedObjectContext!.fetch(request)
            
            return result as NSArray
            
        } catch {
            
            print("Failed")
        }
        
        return []
    }
    
    class func saveAllRanchesToDB(arrRanches : NSArray, completion: (_ result: Bool)->())
    {
        let ranchInfo = NSEntityDescription.entity(forEntityName: "Ranch", in: kAppDelegate.managedObjectContext!)
        
        if ranchInfo != nil
        {
            var isAllSaved : Bool = false
            
            for x in 0..<arrRanches.count
            {
                let dicRanch : NSDictionary = arrRanches.object(at: x) as! NSDictionary
                
                let objRanch = NSManagedObject(entity: ranchInfo!, insertInto: kAppDelegate.managedObjectContext)
                
                if let idAccount = dicRanch.object(forKey: "account_id") as? NSNumber
                {
                    objRanch.setValue("\(idAccount)", forKey: "account_id")
                    
                }else
                {
                    objRanch.setValue(dicRanch.object(forKey: "account_id") as! String, forKey: "account_id")
                }
                
                
                if let acre = dicRanch.object(forKey: "acreage") as? NSNumber
                {
                    objRanch.setValue("\(acre)", forKey: "ranch_acreage")
                    
                }else
                {
                    objRanch.setValue(dicRanch.object(forKey: "acreage") as! String, forKey: "ranch_acreage")
                }
                
                
                objRanch.setValue(dicRanch.object(forKey: "canonical_name"), forKey: "ranch_canonical_name")
                
                let arrCrops : [String] = dicRanch.object(forKey: "crops") as! [String]
                
                objRanch.setValue(arrCrops.joined(separator: ","), forKey: "ranch_crop")
                
                if let idCrop = dicRanch.object(forKey: "crop_id") as? NSNumber
                {
                    objRanch.setValue("\(idCrop)", forKey: "ranch_crop_id")
                    
                }else
                {
                    objRanch.setValue(dicRanch.object(forKey: "crop_id") as! String, forKey: "ranch_crop_id")
                }
                
                
                objRanch.setValue(dicRanch.object(forKey: "description") as! String, forKey: "ranch_desc")
                
                if let idFarmId = dicRanch.object(forKey: "farm_id") as? NSNumber
                {
                    objRanch.setValue("\(idFarmId)", forKey: "ranch_farm_id")
                    
                }else
                {
                    objRanch.setValue(dicRanch.object(forKey: "farm_id") as! String, forKey: "ranch_farm_id")
                }
                
                
                
                objRanch.setValue(dicRanch.object(forKey: "farm_name") as! String, forKey: "ranch_farm_name")
                objRanch.setValue(dicRanch.object(forKey: "field_image") as! String, forKey: "ranch_field_img")
                
                if let iFieldCount = dicRanch.object(forKey: "num_of_fields") as? NSNumber
                {
                    objRanch.setValue("\(iFieldCount)", forKey: "ranch_fields_count")
                    
                }else
                {
                    objRanch.setValue(dicRanch.object(forKey: "num_of_fields") as! String, forKey: "ranch_fields_count")
                }
                
                let strName : String =  dicRanch.object(forKey: "name") as! String
                let arrNames : [String] = strName.components(separatedBy: " ")
                
                if arrNames.count > 0
                {
                    objRanch.setValue(arrNames[0], forKey: "ranch_fname")
                    
                }else
                {
                    objRanch.setValue(dicRanch.object(forKey: "name") as! String, forKey: "ranch_fname")
                }
                
                
                if let iRanchId = dicRanch.object(forKey: "id") as? NSNumber
                {
                    objRanch.setValue("\(iRanchId)", forKey: "ranch_id")
                    
                }else
                {
                    objRanch.setValue(dicRanch.object(forKey: "id") as! String, forKey: "ranch_id")
                }
                
                
                objRanch.setValue(dicRanch.object(forKey: "name") as! String, forKey: "ranch_name")
                objRanch.setValue(dicRanch.object(forKey: "user_summary") as! String, forKey: "ranch_user_summary")
                
                if let dicTags = dicRanch.object(forKey: "tags") as? NSDictionary
                {
                    let dataTags = NSKeyedArchiver.archivedData(withRootObject: dicTags)
                    objRanch.setValue(dataTags, forKey: "tags")
                }else
                {
                    let dataTags = NSKeyedArchiver.archivedData(withRootObject: NSDictionary())
                    objRanch.setValue(dataTags, forKey: "tags")
                }
                
                do {
                    
                    try kAppDelegate.managedObjectContext?.save()
                    isAllSaved = true
                }catch
                {
                    print("Error in save time : \(error)")
                    
                    isAllSaved = false
                   
                }
                
            }//end loop
            
             completion(isAllSaved)
            
        } // end ranch info not nil.
        
    }
    
    
    class func saveRanchFields(dicRanch : NSDictionary, completion: (_ result: Bool)->())
    {
//        CoreUtils.deleteRowsFromEntityFromDB(strEntityName: "Field", strAttibuteName: "ranch_id", strAttributeValue: "\(dicRanch.object(forKey: "id") as! NSNumber)", completion: { (result) -> () in
//
//            if result
//            {
//                //remove all has fields from related ranch id.
//
//
//
//
//
        
                
                let fieldInfo = NSEntityDescription.entity(forEntityName: "Field", in: kAppDelegate.managedObjectContext!)
                
                let arr = dicRanch.object(forKey: "fields") as! NSArray
                
                let marrHasFields : NSMutableSet = NSMutableSet()
                
                for x in 0..<arr.count
                {
                    var dicField : NSDictionary = arr.object(at: x) as! NSDictionary
                    
                    dicField = Utility.trimNullFromDictionaryResponse(dic: dicField) // remove all nulls values to string.
                    
                    let objField : Field = NSManagedObject(entity: fieldInfo!, insertInto: kAppDelegate.managedObjectContext) as! Field
                    
                    if let iAcreage = dicField.object(forKey: "acreage") as? NSNumber
                    {
                        objField.setValue("\(iAcreage)", forKey: "field_acreage")
                        
                    }else
                    {
                        objField.setValue(dicField.object(forKey: "acreage") as! String, forKey: "field_acreage")
                    }
                    
                    
                    objField.setValue(dicField.object(forKey: "crop") as! String, forKey: "field_crop")
                    
                    
                    if let idField = dicField.object(forKey: "id") as? NSNumber
                    {
                        objField.setValue("\(idField)", forKey: "field_id")
                        
                    }else
                    {
                        objField.setValue(dicField.object(forKey: "id") as! String, forKey: "field_id")
                    }
                    
                    objField.setValue(dicField.object(forKey: "name") as! String, forKey: "field_name")
                    
                    objField.setValue(dicField.object(forKey: "summary") as! String, forKey: "field_summary")
                    
                    
                    
                    if let idRanch = dicRanch.object(forKey: "id") as? NSNumber
                    {
                        objField.setValue("\(idRanch)", forKey: "ranch_id")
                        
                    }else
                    {
                        objField.setValue(dicRanch.object(forKey: "id") as! String, forKey: "ranch_id")
                    }
                    
                    
                    let arrCoordinates : NSArray = dicField.object(forKey: "coordinates") as! NSArray
                    
                    let marrCoordinate : NSMutableOrderedSet = NSMutableOrderedSet()
                    
                    let coordinatesInfo = NSEntityDescription.entity(forEntityName: "Coordinates", in: kAppDelegate.managedObjectContext!)
                    
                    //saving coordinates of current fields
                    for y in 0..<arrCoordinates.count
                    {
                        let objCoordinate : [NSNumber] = arrCoordinates.object(at: y) as! [NSNumber]
                        
                        if objCoordinate.count > 0
                        {
                            
                            let objInsertCoordinates = NSManagedObject(entity: coordinatesInfo!, insertInto: kAppDelegate.managedObjectContext)
                            
                            objInsertCoordinates.setValue("\(objCoordinate[0])", forKey: "latitude")
                            objInsertCoordinates.setValue("\(objCoordinate[1])", forKey: "longitude")
                            
                            marrCoordinate.add(objInsertCoordinates)
                            
                            do {
                                
                                try kAppDelegate.managedObjectContext?.save()
                                
                                completion(true)
                                
                            }catch
                            {
                                print("Error in save time : \(error)")
                                
                                completion(false)
                            }
                            
                        }
                    }
                    
                    objField.coordinates = marrCoordinate
                    
                    // objField.setValue(marrCoordinate, forKey: "coordinates")
                    
                    
                    
                    //save middle point.
                    let dicMiddlePointsCoordinates : NSDictionary = dicField.object(forKey: "middle_point") as! NSDictionary
                    
                    let objMiddlePointCoordinates = NSManagedObject(entity: coordinatesInfo!, insertInto: kAppDelegate.managedObjectContext)
                    
                    objMiddlePointCoordinates.setValue(dicMiddlePointsCoordinates.object(forKey: "lat") as! String, forKey: "latitude")
                    objMiddlePointCoordinates.setValue(dicMiddlePointsCoordinates.object(forKey: "lng") as! String, forKey: "longitude")
                    
                    do {
                        
                        try kAppDelegate.managedObjectContext?.save()
                        
                        
                    }catch
                    {
                        print("Error in save time : \(error)")
                        
                        
                    }
                    
                    objField.setValue(objMiddlePointCoordinates, forKey: "middle_point")
                    
                    do {
                        
                        try kAppDelegate.managedObjectContext?.save()
                        
                        
                    }catch
                    {
                        print("Error in save time : \(error)")
                        
                    }
                    
                    marrHasFields.add(objField) // save fields data array in Ranch has fields.
                }
                
                
                //linked all fields with related ranch object.
                let objRanch = CoreUtils.fetchEntityFromDB(strEntityName: "Ranch", strAttibuteName: "ranch_id", strAttributeValue: "\(dicRanch.object(forKey: "id") as! NSNumber)") as? Ranch
                
                if objRanch != nil
                {
                    objRanch?.addToHasFields(marrHasFields)
                    
                    do {
                        
                        try kAppDelegate.managedObjectContext?.save()
                        
                        completion(true)
                        
                    }catch
                    {
                        print("Error in save time : \(error)")
                        
                        completion(false)
                    }
                }
                
          //  }
            
        //})
        
    }
    
}
