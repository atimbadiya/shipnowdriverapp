//
//  UserDefaultUtility.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class UserDefaultUtility: NSObject {
    
    class func saveStringWithKey(_ message: String, key: String){
    let defaults = UserDefaults.standard
    defaults.set(message, forKey: key)
    defaults.synchronize()
    }
    class func retrieveStringWithKey(_ key: String)-> String{
    let defaults = UserDefaults.standard
    return defaults.object(forKey: key) as! String
    }
    class func removeStringWithKey(_ key: String){
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: key)
    defaults.synchronize()
    }
    
    class func saveObjectWithKey(_ object: AnyObject, key: String){
    let defaults = UserDefaults.standard
    defaults.set(object, forKey: key)
    defaults.synchronize()
    }
    
    class func retrievObjectWithKey(_ key: String)-> AnyObject{
    if let keys:String = key as String? {
    let defaults = UserDefaults.standard
    if let value = defaults.object(forKey: keys){
    return value as AnyObject
    }
    }
    return "" as AnyObject
    }
    
    class  func removeObjectWithKey(_ key: String) {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: key)
    defaults.synchronize()
    }
    
    class func objectAlreadyExist(_ key: String) -> Bool {
    let userDefaults : UserDefaults = UserDefaults.standard
    if (userDefaults.object(forKey: key) != nil) {
    return true
    }
    return false
    }
    
    class func saveBoolForKey(_ key: String, value: Bool){
    let defaults = UserDefaults.standard
    defaults.set(value, forKey: key)
    defaults.synchronize()
    }
    
    class func retrieveBoolForKey(_ key: String) -> Bool{
    let defaults = UserDefaults.standard
    return defaults.bool(forKey: key)
    }
    
    class func removeAllUserDefault(){
    //LoginResponseModel.deleteUserInformationObject()
    //TokenResponse.deleteTokenInformationObject()
    // UserDefaultUtility.removeObjectWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)
    // UserDefaultUtility.removeObjectWithKey(AppConstants.UserDefaultKeys.IS_DRIVER)
   // GIDSignIn.sharedInstance().signOut()
    
    //    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.ACCESS_TOKEN)
        
        
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.DISTANCE_UNIT)
        
        
      
        UserDefaultUtility.removeStringWithKey("outstationpopup")
        
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.Taxi_Company)
        
        UserDefaults.standard.removeObject(forKey: "configurationarray")
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.EMAIL_ID)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.PASSWORD)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.FIRST_NAME)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.LAST_NAME)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.MOBILE_NUMBER)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.DRIVER_GENDER)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.DRIVER_IMAGE)
    UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.DRIVER_REGISTERATION_DATE)
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.BUSY_STATUS)
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
        
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.AUTO_ACCEPT_VALUE)
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.LOGIN_LOGOUT)
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.AREAID)
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.FIRST_NAME)
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.LAST_NAME)
        
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.VEHICLE_ID)
        
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.DEMO_LOGIN)
        
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
        
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.SIGNUP_STEP)
        
        UserDefaultUtility.removeStringWithKey(AppConstants.UserDefaultKeys.COUNTRY_ID)
        AppConstants.autoAcceptStatus = ""
    //
    UserDefaults.standard.synchronize()
    
    
    }
    
}
