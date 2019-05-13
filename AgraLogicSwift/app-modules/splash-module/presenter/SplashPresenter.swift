//
//  AccountPresenter.swift
//  AgraLogicSwift
//
//  Created by Reena on 03/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import Foundation
import CoreData

class SplashPresenter
{
    func saveAllRanchesIntoDB(arrRanches : NSArray, completion: (_ result: Bool)->())
    {
       
        self.clearAllDB(completion: { (result) -> () in
            
          if result
          {
            if arrRanches.count > 0
            {
                
                Ranch.saveAllRanchesToDB(arrRanches: arrRanches, completion: { (result) -> () in
                    
                    completion(result)
                })
                
            }else
            {
                completion(true)
            }
            }
            
        })
    }
    
    func saveTagsForRanches(response : NSDictionary,strRanchId : String, strFieldId : String, completion: (_ result: Bool)->())
    {
        if response.allKeys.count > 0
        {
            let tagInfo = NSEntityDescription.entity(forEntityName: "Tags", in: kAppDelegate.managedObjectContext!)
            
            let objTags : Tags = NSManagedObject(entity: tagInfo!, insertInto: kAppDelegate.managedObjectContext) as! Tags
            
            objTags.field_id = strFieldId
            
            objTags.ranch_id = strRanchId
            
            if response.allKeys.count > 0
            {
                let dataTags = NSKeyedArchiver.archivedData(withRootObject: response)
                
                objTags.tags = dataTags as NSData
                
            }else
            {
                let dataTags = NSKeyedArchiver.archivedData(withRootObject: NSDictionary())
                objTags.tags = dataTags as NSData
            }
            
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
    
    
    func clearAllDB(completion: (_ result: Bool)->())
    {
        // delete all old ranches values.
        CoreUtils.deleteAllDataFromEntity(strEntity: "Ranch" , completion:{ (result) -> () in
            
            if result
            {
                CoreUtils.deleteAllDataFromEntity(strEntity: "Field" , completion:{ (result) -> () in
                    
                    if result
                    {
                        CoreUtils.deleteAllDataFromEntity(strEntity: "Tags" , completion:{ (result) -> () in
                            
                            if result
                            {
                                CoreUtils.deleteAllDataFromEntity(strEntity: "Coordinates" , completion:{ (result) -> () in
                                    
                                    if result
                                    {
                                        completion(true)
                                    }else
                                    {
                                        completion(false)
                                    }
                                    
                                })
                                
                            }else
                            {
                                completion(false)
                            }
                            
                        })
                    }else
                    {
                        completion(false)
                    }
                    
                })
                
            }else
            {
                completion(result)
            }
            
        })
    }
}

