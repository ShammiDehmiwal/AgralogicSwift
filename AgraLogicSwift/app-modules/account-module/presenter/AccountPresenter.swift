//
//  AccountPresenter.swift
//  AgraLogicSwift
//
//  Created by Reena on 03/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import Foundation
import CoreData

class AccountPresenter
{
    func saveAllRanchesIntoDB(arrRanches : NSArray) -> Bool
    {
        var isSaved : Bool = false
        
        CoreUtils.deleteAllDataFromEntity(strEntity: "Ranch") // delete all old ranches values.
        
        let ranchInfo = NSEntityDescription.entity(forEntityName: "Ranch", in: kAppDelegate.managedObjectContext!)
        
        if ranchInfo != nil
        {
        
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
                isSaved = true
            }catch
            {
                print("Error in save time : \(error)")
                
                isSaved = false
            }
            
        }

    }
        
        return isSaved
        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Ranch")
//
//        do {
//            let result = try kAppDelegate.managedObjectContext?.fetch(fetchRequest)
//
//            if result != nil
//            {
//
//            if result!.count > 0
//            {
//                for x in 0..<(result!.count)
//                {
//                    let objRanchDelete = result![x] as! NSManagedObject
//
//                    kAppDelegate.managedObjectContext?.delete(objRanchDelete)
//                }
//
//                try kAppDelegate.managedObjectContext?.save()
//            }
//
//            }
//
//        } catch  {
//            print("Error DB : \(error)")
//        }
//
        
    }
    
    
    func saveRanchFields(dicRanch : NSDictionary) -> Bool
    {
        var isSaved : Bool = false
        
        let fieldInfo = NSEntityDescription.entity(forEntityName: "Field", in: kAppDelegate.managedObjectContext!)
        
        let arrFields : NSArray = NSArray()
        
        if let arr = dicRanch.object(forKey: "fields")
        
        
        
        if fieldInfo != nil
        {
            
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
                    isSaved = true
                }catch
                {
                    print("Error in save time : \(error)")
                    
                    isSaved = false
                }
                
            }
            
        }
        
        return isSaved
        
        //        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Ranch")
        //
        //        do {
        //            let result = try kAppDelegate.managedObjectContext?.fetch(fetchRequest)
        //
        //            if result != nil
        //            {
        //
        //            if result!.count > 0
        //            {
        //                for x in 0..<(result!.count)
        //                {
        //                    let objRanchDelete = result![x] as! NSManagedObject
        //
        //                    kAppDelegate.managedObjectContext?.delete(objRanchDelete)
        //                }
        //
        //                try kAppDelegate.managedObjectContext?.save()
        //            }
        //
        //            }
        //
        //        } catch  {
        //            print("Error DB : \(error)")
        //        }
        //
        
    }
    
    
}
