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
//    func saveAllRanchesIntoDB(arrRanches : NSArray) -> Bool
//    {
//        CoreUtils.deleteAllDataFromEntity(strEntity: "Ranch") // delete all old ranches values.
//
//        let isSavedAllRanches : Bool = Ranch.saveAllRanchesToDB(arrRanches: arrRanches)
//
//        return isSavedAllRanches
//
//
////        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Ranch")
////
////        do {
////            let result = try kAppDelegate.managedObjectContext?.fetch(fetchRequest)
////
////            if result != nil
////            {
////
////            if result!.count > 0
////            {
////                for x in 0..<(result!.count)
////                {
////                    let objRanchDelete = result![x] as! NSManagedObject
////
////                    kAppDelegate.managedObjectContext?.delete(objRanchDelete)
////                }
////
////                try kAppDelegate.managedObjectContext?.save()
////            }
////
////            }
////
////        } catch  {
////            print("Error DB : \(error)")
////        }
////
//
//    }
//
//
//    func saveRanchFields(dicRanch : NSDictionary)
//    {
//        //code in db class Ranch class.
//        Ranch.saveRanchFields(dicRanch: dicRanch)
//    }
//
//    func saveTagsForRanches(response : NSDictionary,strRanchId : String, strFieldId : String)
//    {
//        if response.allKeys.count > 0
//        {
//                 let tagInfo = NSEntityDescription.entity(forEntityName: "Tags", in: kAppDelegate.managedObjectContext!)
//
//            let objTags : Tags = NSManagedObject(entity: tagInfo!, insertInto: kAppDelegate.managedObjectContext) as! Tags
//
//            objTags.field_id = strFieldId
//
//            objTags.ranch_id = strRanchId
//
//            if response.allKeys.count > 0
//            {
//                let dataTags = NSKeyedArchiver.archivedData(withRootObject: response)
//
//                objTags.tags = dataTags as NSData
//
//            }else
//            {
//                let dataTags = NSKeyedArchiver.archivedData(withRootObject: NSDictionary())
//                objTags.tags = dataTags as NSData
//            }
//
//            do {
//
//                try kAppDelegate.managedObjectContext?.save()
//
//            }catch
//            {
//                print("Error in save time : \(error)")
//
//            }
//
//        }
//
//    }
//
    
}
