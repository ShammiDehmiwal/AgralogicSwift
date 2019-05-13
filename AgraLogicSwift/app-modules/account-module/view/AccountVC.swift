//
//  AccountVC.swift
//  AgraLogicSwift
//
//  Created by Reena on 02/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import UIKit

class AccountVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var tblAccounts: UITableView!
    
    
    var marrAccounts : NSMutableArray = NSMutableArray()
    
    var presenter : AccountPresenter = AccountPresenter()
    
    
    //MARK: - Life Cycle Methods.
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.getAccounts() // load all accounts.
    }
    

    //MARK: - UIButton Action methods.
    @IBAction func btnCancelTapAction(_ sender: UIButton)
    {
        
    }
    
    
    //MARK: - UITableView Delegate & Datasource methods.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marrAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dicAccount : NSDictionary = marrAccounts.object(at: indexPath.row) as! NSDictionary
        
        let cell : SelectAccountListCell = tableView.dequeueReusableCell(withIdentifier: "cellSelectAccount", for: indexPath) as! SelectAccountListCell
        
        cell.lblSerialNumber.text = "\(indexPath.row + 1)"
        cell.vSerialNumber.layer.cornerRadius = cell.vSerialNumber.frame.size.height/2
        cell.vSerialNumber.layer.masksToBounds = true
        
        cell.lblAccountName.text = dicAccount.object(forKey: "name") as? String
        cell.lblAcreage.text = "\(dicAccount.value(forKey: "acreage") as! Double)"
        
        let arrCrops : [String] = dicAccount.object(forKey: "crops") as! [String]
        
        cell.lblCrops.text = arrCrops.joined(separator: ",")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
         let dicAccount : NSDictionary = marrAccounts.object(at: indexPath.row) as! NSDictionary
        
        self.associateCurrentAccount(dicAccount: dicAccount) // set account with user.
    }
    
    
    
    //MARK: - Web Api
    func getAccounts()
    {
        let strUrl = "\(kApiHost)/user/accounts"
        
        Utility.showLoaderWithMessage(parentView: self.view, strMsg: "Loading Accounts...") // show the loader.
        
        let header : [String : String] = ["Authorization":Utility.getAccessToken(),"Accept-Encoding":"gzip"]
        
        CommonApi.sharedInstance.apiRequest(url: URL(string: strUrl)!, typeMethod: .get, params: [:], header: header, onSuccess: { data,response,error  in
            
            Utility.hideLoader(parentView: self.view) //hide the loader.
            
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray else { return }
                
                print("Response Json Account : \(jsonObject)")
                
                
                
                for x in 0..<jsonObject.count
                {
                    let dic : NSDictionary = jsonObject.object(at: x) as! NSDictionary
                    
                    if dic.value(forKey: "enabled") as! Bool
                    {
                        self.marrAccounts.add(dic)
                    }
                }
                
               
                if self.marrAccounts.count > 0
                {
                    //hide no account label
                    self.tblAccounts.reloadData()
                }else
                {
                    //show no account label
                    // hide the table.
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
    
    func associateCurrentAccount(dicAccount : NSDictionary)
    {
        let strUrl = "\(kApiHost)/sessions/accounts/\(dicAccount.object(forKey: "id") as! NSNumber)"
        
        Utility.showLoaderWithMessage(parentView: self.view, strMsg: "Associating Account...") // show the loader.
        
        let header : [String : String] = ["Authorization":Utility.getAccessToken(),"Accept-Encoding":"gzip"]
        
        CommonApi.sharedInstance.apiRequest(url: URL(string: strUrl)!, typeMethod: .put, params: [:], header: header, onSuccess: { data,response,error  in
            
            Utility.hideLoader(parentView: self.view) //hide the loader.
            
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary else { return }
                
                print("Response Associate Account : \(jsonObject)")
                
                if let strStatus = jsonObject.object(forKey: "status") as? String
                {
                    if strStatus == "SUCCESS"
                    {// account linked.
                        
                    UserDefaults.standard.set(Utility.trimNullFromDictionaryResponse(dic: dicAccount), forKey: "linked_account")
                    UserDefaults.standard.synchronize()
                        
                        
                        let objAccount : SplashVC = self.storyboard?.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
                        
                        self.navigationController?.pushViewController(objAccount, animated: true)
                        
                        
                    }else
                    {
                         Utility.showAlertMessage(strTitle: "Warning", strMessage: "Facing issue in associating account with you. Please try again !", objController: self)
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
    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
