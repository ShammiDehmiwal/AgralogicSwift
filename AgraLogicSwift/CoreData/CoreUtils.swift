//
//  CoreUtils.swift
//  AgraLogicSwift
//
//  Created by Reena on 03/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import Foundation
import CoreData

class CoreUtils
{
    class func deleteAllDataFromEntity(strEntity : String, completion: (_ result: Bool)->())
    {
       
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: strEntity)
            
            do {
                let result = try kAppDelegate.managedObjectContext?.fetch(fetchRequest)
                
                if result != nil
                {
                    
                    if result!.count > 0
                    {
                        for x in 0..<(result!.count)
                        {
                            let objRanchDelete = result![x] as! NSManagedObject
                            
                            kAppDelegate.managedObjectContext?.delete(objRanchDelete)
                        }
                        
                        try kAppDelegate.managedObjectContext?.save()
                        
                        completion(true)
                    }else
                    {
                        completion(true)
                    }
                    
                }else
                {
                    completion(false)
                }
                
            } catch  {
                print("Core Utils : Error DB : \(error)")
                
                completion(false)
            }
    }
    
    
   class func fetchEntityFromDB(strEntityName : String, strAttibuteName: String, strAttributeValue: String) -> NSManagedObject?
   {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: strEntityName)
        request.predicate = NSPredicate(format: "\(strAttibuteName) = %@", strAttributeValue)
        //request.returnsObjectsAsFaults = false
        do {
            let result = try kAppDelegate.managedObjectContext!.fetch(request)
            
            
            if result.count > 0
            {
                return result[0] as? NSManagedObject // result of type = strEntityName.
                
            }else
            {
                return nil
            }
            
            //            for data in result as! [NSManagedObject]
            //            {
            //                print(data.value(forKey: "username") as! String)
            //            }
            
        } catch {
            
            print("Failed")
        }
        
        return nil
    }
    
    class func deleteRowsFromEntityFromDB(strEntityName : String, strAttibuteName: String, strAttributeValue: String, completion: (_ result: Bool)->())
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: strEntityName)
        request.predicate = NSPredicate(format: "\(strAttibuteName) = %@", strAttributeValue)
        //request.returnsObjectsAsFaults = false
        do {
            let result = try kAppDelegate.managedObjectContext!.fetch(request)
            
            
            if result.count > 0
            {
                for entity in result {
                    
                    kAppDelegate.managedObjectContext!.delete(entity as! NSManagedObject)
                }
                
                completion(true)
            }else
            {
               completion(true)
            }
        } catch {
            
            print("Failed")
            completion(false)
        }
        
    }
    
    
    
}
