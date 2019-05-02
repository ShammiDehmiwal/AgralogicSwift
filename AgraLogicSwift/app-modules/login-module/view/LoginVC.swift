//
//  LoginVC.swift
//  AgraLogicSwift
//
//  Created by Reena on 02/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //instance properties.
    @IBOutlet weak var ivBgBlur: UIImageView!
    
    @IBOutlet weak var vLoginView: UIView!
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtEnvionment: UITextField!
    
    
    var presenter : LoginPresenter?
    
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter = LoginPresenter()
        
        
     
    }
    

    //MARK: - UIButton Action Methods.
    @IBAction func btnSignInTapAction(_ sender: UIButton)
    {
        self.txtEnvionment.text = Utility.validateEnvironment(strEnvironment: self.txtEnvionment.text!)
        
         let strUrl = "\(kApiHost)/sessions?username=\(txtUserName.text!)&password=\(txtPassword.text!)"
        
        Utility.showLoaderWithMessage(parentView: self.view, strMsg: "Validating...") // show the loader.
        
        CommonApi.sharedInstance.apiRequest(url: URL(string: strUrl)!, typeMethod: .post, params: [:], header: [:], onSuccess: { data,response,error  in
            
            Utility.hideLoader(parentView: self.view) //hide the loader.
            
                        do {
                
                                guard let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String : Any] else { return }
                
                            
                            
                            let dicData : NSDictionary = Utility.trimNullFromDictionaryResponse(dic: jsonObject as NSDictionary)
                            
                             print("Response Json Login : \(dicData)")
                
                            UserDefaults.standard.set(dicData, forKey:"userData")
                            UserDefaults.standard.synchronize()
                            
                           
                            
                            }catch let jsonErr
                            {
                                print("Error Login Response : \(jsonErr)")
                            }
            
            
            
//            do {
//
//               // let objLogin = try JSONDecoder().decode(LoginResponse.self, from: data)
//
//                print("Login Response : \(objLogin)")
//
//            }catch let jsonErr
//            {
//                print("Json Parsing error : \(jsonErr)")
//            }
            
        }, onFailure: { error in
            
             print("failure error : \(error)")
             Utility.hideLoader(parentView: self.view) //hide the loader.
        })
        
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


extension UserDefaults {
    
    func getUserAuthToken() -> String {
        if let dicData = UserDefaults.standard.object(forKey: "userData") as? NSDictionary
        {
            if let strAuthToken = dicData.object(forKey: "auth_token") as? String
            {
                return strAuthToken

            }else
            {
                return ""
            }
            
        }else
        {
            return ""
        }
    }
}
