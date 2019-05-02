//
//  CommonApi.swift
//  AgraLogicSwift
//
//  Created by Reena on 02/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import UIKit
import Alamofire

public class CommonApi: NSObject
{

   
    
    
    static let sharedInstance = CommonApi()
    
  
    func apiRequest(url : URL, typeMethod : HTTPMethod,params : [String:Any],header : [String:String], onSuccess: @escaping (Data?, URLResponse?, Error?)-> Void, onFailure: @escaping(Error) -> Void)
    {
        
        //now use your requests  i.e:
        Alamofire.request(url, method: typeMethod, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    //success
                    onSuccess(response.data, response.response,response.error)
                    
                    break
                case .failure(let error):
                    //fail
                    print("something went wrong : \(error)")
                    
                    onFailure(error)
                    
                    break
                }
            })
    }
    
}
