//
//  SplashVC.swift
//  AgraLogicSwift
//
//  Created by Reena on 02/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import UIKit
import CoreData

class SplashVC: UIViewController {

    
    @IBOutlet weak var pvProgress: UIProgressView!
    
    @IBOutlet weak var lblProgressMsg: UILabel!
    
    
    
     var presenter : SplashPresenter = SplashPresenter()
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //after save all Ranch fields.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.showProgressViewOnDataSaving),
            name: Notification.Name(rawValue: "updateProgressView"),
            object: nil)
        
        
        //load all ranches of user.
        self.fetchAllRanches()
    }
    
    //MARK: - Custom Methods.
    @objc func showProgressViewOnDataSaving(notify : NSNotification)
    {
        if pvProgress.progress < 1
        {
            if let iCounter = notify.userInfo?["callNumber"] as? Int {
                // do something with your image
                
                switch iCounter
                {
                case 1:
                    pvProgress.progress = 0.1
                    break
                    
                case 2:
                    pvProgress.progress = 0.2
                    break
                    
                case 3:
                    pvProgress.progress = 0.3
                    break
                    
                case 4:
                    pvProgress.progress = 0.4
                    break
                    
                case 5:
                    pvProgress.progress = 0.5
                    break
                    
                case 6:
                    pvProgress.progress = 0.6
                    break
                    
                case 7:
                    pvProgress.progress = 0.7
                    break
                    
                case 8:
                    pvProgress.progress = 0.8
                    break
                    
                case 9:
                    pvProgress.progress = 0.9
                    break
                    
                case 10:
                    pvProgress.progress = 1
                    break
                    
                default:
                    pvProgress.progress = 1
                    break
                }
                
                
            }
            
       
        }
    }
    

    func fetchAllRanches()
    {
        
        lblProgressMsg.text = "Syncing All Ranch data, please wait ..."
        
        
        let strUrl = "\(kApiHost)/ranches"
        
        Utility.showLoaderWithMessage(parentView: self.view, strMsg: "Loading Account Ranches...") // show the loader.
        
        let header : [String : String] = ["Authorization":Utility.getAccessToken(),"Accept-Encoding":"gzip"]
        
        CommonApi.sharedInstance.apiRequest(url: URL(string: strUrl)!, typeMethod: .get, params: [:], header: header, onSuccess: { data,response,error  in
            
            Utility.hideLoader(parentView: self.view) //hide the loader.
            
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary else { return }
                
                print("Response Json Account : \(jsonObject)")
                
                let marrRanches : NSMutableArray = NSMutableArray()
                
                var arrRances : NSArray = NSArray()
                
                if let arr = jsonObject.object(forKey: "ranch") as? NSArray
                {
                    arrRances = arr
                    
                    // post a notification : update progress - 1 (load ranches)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateProgressView"), object: nil, userInfo: ["callNumber":1])
                    
                }
                
                for x in 0..<arrRances.count
                {
                    let dic : NSDictionary = arrRances.object(at: x) as! NSDictionary
                    
                    marrRanches.add(Utility.trimNullFromDictionaryResponse(dic: dic))
                    
                }
                
                
                if marrRanches.count > 0
                {//save all ranches in db.
                    
                    self.presenter.saveAllRanchesIntoDB(arrRanches: marrRanches, completion: { (result) -> Void in
                        
                        if result
                        {
                            // post a notification : update progress - 2 (saved ranches)
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateProgressView"), object: nil, userInfo: ["callNumber":2])
                            
                            for x in 0..<marrRanches.count
                            {
                                let dic : NSDictionary = marrRanches.object(at: x) as! NSDictionary
                                
                                if x == (marrRanches.count - 1)
                                {
                                    self.getRanchDetails(dicRanch: dic, isLastRanch: true, iTotalRanch: marrRanches.count, iCurrentRanchCounter: x) // fetch ranch details and saved into db.
                                }else
                                {
                                    self.getRanchDetails(dicRanch: dic, isLastRanch: false, iTotalRanch: marrRanches.count, iCurrentRanchCounter: x) // fetch ranch details and saved into db.
                                }
                                
                            }
                            
                            
                        }else
                        {
                            
                            Utility.showAlertMessage(strTitle: "Warning", strMessage: "Unable to fetch all raches data. Please try again.", objController: self)
                            
                            return
                        }
                    })
                    
                    
                  
                }else
                {
                    Utility.showAlertMessage(strTitle: "Warning", strMessage: "No Ranches found on server. Please try again.", objController: self)
                    
                    return
                }
                
                
            }catch let jsonErr
            {
                print("Error Login Response : \(jsonErr)")
            }
            
        }, onFailure: { error in
            
            print("failure error : \(error)")
            Utility.hideLoader(parentView: self.view) //hide the loader.
        })
        
    }
    
    
    func getRanchDetails(dicRanch : NSDictionary , isLastRanch : Bool, iTotalRanch : Int, iCurrentRanchCounter : Int)
    {
        
         lblProgressMsg.text = "Syncing All Fields data, please wait ..."
        
        let strUrl = "\(kApiHost)/ranches/\(dicRanch.object(forKey: "id") as! NSNumber)"
        
        Utility.showLoaderWithMessage(parentView: self.view, strMsg: "Loading Ranch Fields...") // show the loader.
        
        let header : [String : String] = ["Authorization":Utility.getAccessToken(),"Accept-Encoding":"gzip"]
        
        CommonApi.sharedInstance.apiRequest(url: URL(string: strUrl)!, typeMethod: .get, params: [:], header: header, onSuccess: { data,response,error  in
            
            Utility.hideLoader(parentView: self.view) //hide the loader.
            
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary else { return }
                
                print("Response Ranch Fields : \(jsonObject)")
                
                if let strStatus = jsonObject.object(forKey: "status") as? String
                {
                    if strStatus == "SUCCESS"
                    {// correct
                        
                        if let currentRanch = jsonObject.object(forKey: "ranch") as? NSDictionary
                        {
                            //saves ranch all fields.
                            //code in db class Ranch class.
                            Ranch.saveRanchFields(dicRanch: currentRanch, completion: { (result) -> () in
                                
                                if result
                                {
                                    
                                    if iCurrentRanchCounter == Int(Double(iTotalRanch) * 0.25)
                                    {
                                        // post a notification : update progress - 3
                                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateProgressView"), object: nil, userInfo: ["callNumber":3])
                                        
                                    }else if iCurrentRanchCounter == Int(Double(iTotalRanch) * 0.5)
                                    {
                                        // post a notification : update progress - 4
                                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateProgressView"), object: nil, userInfo: ["callNumber":4])
                                        
                                    }else if iCurrentRanchCounter == Int(Double(iTotalRanch) * 0.75)
                                    {
                                        // post a notification : update progress - 5
                                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateProgressView"), object: nil, userInfo: ["callNumber":5])
                                        
                                    }
                                    
                                    
                                    if iCurrentRanchCounter == (iTotalRanch - 1)
                                    {//end of ranch fields data saved.
                                        
                                        // post a notification : update progress - 6
                                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateProgressView"), object: nil, userInfo: ["callNumber":6])
                                        
                                        self.getRanchFieldTagsFromApi() // get all tags from server.
                                    }
                                    
                                }else
                                {
                                     Utility.showAlertMessage(strTitle: "Warning", strMessage: "Facing issue in saving Ranch local db. Please try again !", objController: self)
                                    
                                    return
                                }
                            })
                            
                        }else
                        { // when no ranch object.
                            return
                        }
                        
                    }else
                    {
                        Utility.showAlertMessage(strTitle: "Warning", strMessage: "Facing issue in associating account with you. Please try again !", objController: self)
                        
                        return
                    }
                }
                
            }catch let jsonErr
            {
                print("Error Login Response : \(jsonErr)")
            }
            
        }, onFailure: { error in
            
            print("failure error : \(error)")
            Utility.hideLoader(parentView: self.view) //hide the loader.
        })
        
    }
    
    func getRanchFieldTagsFromApi()
    {
        lblProgressMsg.text = "Syncing All Tags data, please wait ..."
        
        let arrRanches : NSArray = Ranch.fetchAllEntityFromDB()
        
        for z in 0..<arrRanches.count
        {
            let objRanch : Ranch = arrRanches.object(at: z) as! Ranch
            
            let arrFields : NSSet = objRanch.hasFields!
            
            if arrFields.count > 0
            {
                for y in 0..<arrFields.allObjects.count
                {
                    
                    let objField : Field = arrFields.allObjects[y] as! Field
                    
                    let strUrl = "\(kApiHost)/ranches/\(objRanch.ranch_id!)/fields/\(objField.field_id!)/tags"
                    
                    //Utility.showLoaderWithMessage(parentView: self.view, strMsg: "Loading Accounts...") // show the loader.
                    
                    let header : [String : String] = ["Authorization":Utility.getAccessToken(),"Accept-Encoding":"gzip"]
                    
                    CommonApi.sharedInstance.apiRequest(url: URL(string: strUrl)!, typeMethod: .get, params: [:], header: header, onSuccess: { data,response,error  in
                        
                        Utility.hideLoader(parentView: self.view) //hide the loader.
                        
                        do {
                            guard let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary else { return }
                            
                            print("Response Json Account : \(jsonObject)")
                            
                            //save tags in database.
                            self.presenter.saveTagsForRanches(response: jsonObject, strRanchId: objField.ranch_id!, strFieldId: objField.field_id!, completion: { (result) -> () in
                                
                                if result
                                {
                                    //saved tags ranch field
                                    if (z == (arrRanches.count - 1)) && (y == (arrFields.count - 1))
                                    {//when last ranch and last fields tag save.
                                        // post a notification : update progress - 7
                                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateProgressView"), object: nil, userInfo: ["callNumber":7])
                                        
                                        
                                        
                                    }
                                }
                            })
                            
                            
                          
                            
                            
                        }catch let jsonErr
                        {
                            print("Error Login Response : \(jsonErr)")
                        }
                        
                    }, onFailure: { error in
                        
                        print("failure error : \(error)")
                        Utility.hideLoader(parentView: self.view) //hide the loader.
                    })
                    
                } //end of fields loop.
            } // check arrFields has fields or not.
            
            
            
        } // end ranch loop.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
