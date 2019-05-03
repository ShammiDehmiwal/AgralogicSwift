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
   class func deleteAllDataFromEntity(strEntity : String)
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
                    }
                    
                }
                
            } catch  {
                print("Core Utils : Error DB : \(error)")
            }
    }
    
}
