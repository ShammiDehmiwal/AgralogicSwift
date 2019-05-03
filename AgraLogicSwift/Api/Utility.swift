//
//  Utility.swift
//  AgraLogicSwift
//
//  Created by Reena on 02/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class Utility
{
    //MARK: - Custom Data Methods.
    class func setAccessToken(strAccessToken : String) {
        
        if strAccessToken != ""
        {
            UserDefaults.standard.set(strAccessToken, forKey: "access_token")
             UserDefaults.standard.synchronize()
        }
        
    }
    
    class func getAccessToken() -> String {
        
        if let strAccessToken = UserDefaults.standard.object(forKey: "access_token") as? String
        {
            return strAccessToken
        }else
        {
            return ""
        }
    }
    
    
    //MARK: - Common Methods
    class func validateEnvironment(strEnvironment : String) -> String
    {
        if !strEnvironment.contains(".agralogics.com") // if not contains - use negation.
        {
            if strEnvironment.hasSuffix(".")
            {
                return "\(strEnvironment).agralogics.com"
            }
            
        }else
        {
           return strEnvironment
        }
        
        return ""
    }
    
    
   class func trimNullFromDictionaryResponse(dic:NSDictionary) -> NSMutableDictionary
   {
        let allKeys = dic.allKeys
        let dicTrimNull = NSMutableDictionary()
        for i in 0...allKeys.count - 1 {
            let keyValue = dic[allKeys[i]]
            if keyValue is NSNull {
                dicTrimNull.setValue("", forKey: allKeys[i] as! String)
            }
            else {
                dicTrimNull.setValue(keyValue, forKey: allKeys[i] as! String)
            }
        }
        return dicTrimNull
    }
    
    
    func showLoader(parentView : UIView)
    {
        if let objHud : MBProgressHUD = parentView.viewWithTag(1010) as? MBProgressHUD
        {
            objHud.show(true)
            
        }else
        {
            let hud = MBProgressHUD.showAdded(to: parentView, animated: true)
            hud?.tag = 1010
            hud?.labelText = ""
            hud?.isUserInteractionEnabled = false
            hud?.dimBackground = true
            hud?.animationType = MBProgressHUDAnimationFade
            hud?.removeFromSuperViewOnHide = true
        }
    }
    
    
   class func showLoaderWithMessage(parentView : UIView, strMsg : String)
    {
        if let objHud : MBProgressHUD = parentView.viewWithTag(1010) as? MBProgressHUD
        {
            objHud.show(true)
            
        }else
        {
            let hud = MBProgressHUD.showAdded(to: parentView, animated: true)
            hud?.tag = 1010
            hud?.labelText = strMsg
            hud?.isUserInteractionEnabled = false
            hud?.dimBackground = true
            hud?.animationType = MBProgressHUDAnimationFade
            hud?.removeFromSuperViewOnHide = true
        }
    }
    
    
   class func hideLoader(parentView : UIView)
    {
        MBProgressHUD.hide(for: parentView, animated: true)
        
    }
    
   class func showAlertMessage(strTitle : String , strMessage : String, objController : UIViewController)
    {
        let alert = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        objController.present(alert, animated: true, completion: nil)
    }
    
}
