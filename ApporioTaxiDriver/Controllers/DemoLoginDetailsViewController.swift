//
//  DemoLoginDetailsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/20/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import SkyFloatingLabelTextField

class DemoLoginDetailsViewController: BaseViewController {
    
    
    @IBOutlet weak var enteremailtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var enterphonetextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var enternametextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var pleaseentertextlbl: UILabel!
    
    @IBOutlet weak var loginasdemobtnview: UIView!
    @IBOutlet weak var loginasdemobtn: UIButton!
  //  @IBOutlet weak var skipenteringdetailsbtn: UIButton!
    
  //  var playeridfordemo = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.PLAYER_ID)
    var uniquenodemo = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.UNIQUE_NUMBER)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.enternametextfield.placeholder = "Enter Name".localized
        self.enterphonetextfield.placeholder = "Enter Phone".localized
        self.enteremailtextfield.placeholder = "Enter Email".localized
        self.pleaseentertextlbl.text = "Please enter your name and details for the identification of your demo driver".localized
        self.loginasdemobtn.setTitle("Login As Demo".localized, for: .normal)
       
        
    }
    @IBAction func cancelbtn_click(_ sender: Any) {
        self.dismissVC()
    }
    @IBAction func loginasdemobtn_click(_ sender: Any) {
        
       
        
        if (self.enternametextfield.text?.count)! < 2 {
            
            self.showErrorAlert("", alertMessage: "Please Enter Name first".localized, VC: self)
            
            return
        }
        
        if (self.enterphonetextfield.text?.count)! < 2 {
            
            self.showErrorAlert("", alertMessage: "Please Enter Phone first".localized, VC: self)
            
            return
        }
        
        if (self.enteremailtextfield.text?.count)! < 2 {
            
            self.showErrorAlert("", alertMessage: "Please Enter email first".localized, VC: self)
            
            return
        }
        
        
         showLoaderWithoutBackground()
        
        var dic1 = ["unique_number": uniquenodemo,
                    "phone": enterphonetextfield.text!,
                    "name": enternametextfield.text!,
                    "email": enteremailtextfield.text!,
                    ] as [String : AnyObject]
        
        
        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.PLAYER_ID){
            
            
            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID) as AnyObject
            
            dic1["device_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID) as AnyObject
            
            
            
            
        }else{
            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
            
            dic1["device_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
            
            
            
        }
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDEMODETAILS
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DemoLoginModel.self)
        
    }
    
    @IBAction func skipenteringdetailsbtn_click(_ sender: Any) {
        
        showLoaderWithoutBackground()
        
        var dic1 = ["unique_number": uniquenodemo,
                    "phone": enterphonetextfield.text!,
                    "name": enternametextfield.text!,
                    "email": enteremailtextfield.text!,
                    ] as [String : AnyObject]
        
        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.PLAYER_ID){
            
            
            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID) as AnyObject
            
            dic1["device_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID) as AnyObject
            
            
            
            
        }else{
            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
            
            dic1["device_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
            
            
            
        }
       
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDEMODETAILS
        ServiceManager.sharedInstance.delegate = self
      
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DemoLoginModel.self)
    }
}

extension DemoLoginDetailsViewController: ApiResponseReceiver {
  
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? DemoLoginModel{
    let data:DemoLoginModel = responseData
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
        
        UserDefaultUtility.saveStringWithKey((data.data?.accessToken)!, key: AppConstants.UserDefaultKeys.CLIENT_ID)
        
        UserDefaultUtility.saveBoolForKey(AppConstants.UserDefaultKeys.FIREBASE_ONESIGNAL_CHECK, value: data.data?.pushNotification?.fireBase ?? false)
        
        AppConstants.dicauthorization = ["Accept":"application/json",
                                         "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                         "locale":AppConstants.languagecode
            
            ] as [String : AnyObject]
        
        let dic1 = [:] as [String : AnyObject]
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDETAILS
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverLoginModel.self)
        
    }
    else if data.result == "999" {
        
        UserDefaultUtility.removeAllUserDefault()
        
        self.presentVC("SplashViewController")
    }else{
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
    }
}
       
        if let responseData = response as? DriverLoginModel{
            
            
            let data:DriverLoginModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.saveStringWithKey((data.data!.email ?? "")!, key: AppConstants.UserDefaultKeys.EMAIL_ID)
                
                UserDefaultUtility.saveStringWithKey((data.data!.phoneNumber ?? "")!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                
//                UserDefaultUtility.saveStringWithKey((data.data!.fullName)!, key: AppConstants.UserDefaultKeys.NAME)
                
                UserDefaultUtility.saveStringWithKey((data.data!.firstName ?? "")!, key: AppConstants.UserDefaultKeys.FIRST_NAME)
                UserDefaultUtility.saveStringWithKey((data.data!.lastName ?? "")!, key: AppConstants.UserDefaultKeys.LAST_NAME)

                
                
                UserDefaultUtility.saveStringWithKey((data.data!.password ?? "")!, key: AppConstants.UserDefaultKeys.PASSWORD)
                UserDefaultUtility.saveStringWithKey((data.data!.profileImage)!, key: AppConstants.UserDefaultKeys.DRIVER_IMAGE)
                
//                UserDefaultUtility.saveStringWithKey((data.data!.driverGender)!, key: AppConstants.UserDefaultKeys.DRIVER_GENDER)
//
                UserDefaultUtility.saveStringWithKey((String((data.data!.onlineOffline)!)), key: AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
                
                
                UserDefaultUtility.saveStringWithKey((String((data.data?.id ?? 0)!)), key: AppConstants.UserDefaultKeys.DRIVER_ID)
                
                UserDefaultUtility.saveStringWithKey((String((data.data!.freeBusy)!)), key: AppConstants.UserDefaultKeys.BUSY_STATUS)
                
                UserDefaultUtility.saveStringWithKey((String((data.data!.loginLogout)!)), key: AppConstants.UserDefaultKeys.LOGIN_LOGOUT)
                
                UserDefaultUtility.saveStringWithKey((String((data.data!.countryAreaId)!)), key: AppConstants.UserDefaultKeys.AREAID)
                
                
                UserDefaultUtility.saveStringWithKey("1", key: AppConstants.UserDefaultKeys.DEMO_LOGIN)
                
                UserDefaultUtility.saveStringWithKey((data.data!.createdAt)!, key: AppConstants.UserDefaultKeys.DRIVER_REGISTERATION_DATE)
                
                if data.data?.driverVehicle?.count == 0{
                    
                    
                    UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                    
                }else{
                    
                    UserDefaultUtility.saveStringWithKey(String((data.data?.driverVehicle![0].id ?? 0)!), key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                    
                }
                
                UserDefaultUtility.saveStringWithKey(data.data?.autoAcceptStatus ?? "", key: AppConstants.UserDefaultKeys.AUTO_ACCEPT_VALUE)
                
//                if data.data?.signupStep == "1"{
//
//                    self.presentVC("VehicleInformationViewController")
//
//                }else if data.data?.signupStep == "2"{
//                    AppConstants.drivervehicleid = String((data.data!.driverVehicles![0].id)!)
//                    self.presentVC("UploadDocumentsViewController")
//                }else{
//
                    UserDefaultUtility.saveStringWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LAUNCHED, key: AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)

                
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                    }
                }
               
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else {
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
}

func onError(_ errorResponse: String, errorObject: AnyObject?) {
    showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
}
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }

}

