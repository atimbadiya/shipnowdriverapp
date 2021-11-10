//
//  SplashViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import ObjectMapper

class SplashViewController: BaseViewController,CLLocationManagerDelegate {
    
    var timerForToken:Timer!
    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var demomaiviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var loginview: UIView!
    
    @IBOutlet weak var registerview: UIView!
    var configuredata: DriverAppConfigureModel!
    
    
    @IBOutlet weak var buttonmainviewheight: NSLayoutConstraint!
    @IBOutlet weak var registerloginviewheight: NSLayoutConstraint!
    @IBOutlet weak var buttonsmainview: UIView!
    @IBOutlet weak var registerloginbtnview: UIView!
    @IBOutlet weak var demomainview: UIView!
    @IBOutlet weak var demobtn: UIButton!
    @IBOutlet weak var splashmainimageview: UIImageView!
    @IBOutlet weak var logoimageview: UIImageView!
    @IBOutlet weak var taxinamelabel: UILabel!
    
    @IBOutlet weak var registerbtntext: UIButton!
    @IBOutlet weak var loginbtntext: UIButton!
    
    var languageBundle : Bundle?
    
    var locationvalue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppConstants.viewcontrollerself = self
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        
        buttonsmainview.isHidden = true
        demomainview.isHidden = true
        
        registerview.layer.cornerRadius = 8
        registerview.layer.borderWidth = 1.0
        registerview.layer.borderColor = UIColor.white.cgColor
        
        loginview.layer.cornerRadius = 8
        loginview.layer.borderWidth = 1.0
        loginview.layer.borderColor = UIColor.white.cgColor
        
        AppConstants.screenframeheight = UIScreen.main.bounds.size.height
        AppConstants.screenframewidth = UIScreen.main.bounds.size.width
        
        if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "ar"){
            
            if AppConstants.languageCodeSelectInMenu == 0{
                AppConstants.languagecode = "ar"
                
                UserDefaults.standard.set("ar", forKey: "PreferredLanguage")
                self.locationvalue = "1"
                AppConstants.languageCodeSelectInMenu = 1
                AppConstants.splashscreenoptions = 1
                Language.language = Language(rawValue: "ar")!
            }else{
                self.locationvalue = "0"
            }
            
        }else if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "es"){
            
            if AppConstants.languageCodeSelectInMenu == 0{
                AppConstants.languagecode = "es"
                
                UserDefaults.standard.set("es", forKey: "PreferredLanguage")
                self.locationvalue = "1"
                AppConstants.languageCodeSelectInMenu = 1
                AppConstants.splashscreenoptions = 1
                Language.language = Language(rawValue: "es")!
            }else{
                self.locationvalue = "0"
            }
            
        }else if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "bn"){
            
            if AppConstants.languageCodeSelectInMenu == 0{
                AppConstants.languagecode = "bn"
                
                UserDefaults.standard.set("bn", forKey: "PreferredLanguage")
                self.locationvalue = "1"
                AppConstants.languageCodeSelectInMenu = 1
                AppConstants.splashscreenoptions = 1
                Language.language = Language(rawValue: "bn")!
            }else{
                self.locationvalue = "0"
            }
            
        }else if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "pt"){
            
            if AppConstants.languageCodeSelectInMenu == 0{
                AppConstants.languagecode = "pt"
                
                UserDefaults.standard.set("pt", forKey: "PreferredLanguage")
                self.locationvalue = "1"
                AppConstants.languageCodeSelectInMenu = 1
                AppConstants.splashscreenoptions = 1
                Language.language = Language(rawValue: "pt")!
            }else{
                self.locationvalue = "0"
            }
            
        }else if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "hi"){
            
            if AppConstants.languageCodeSelectInMenu == 0{
                AppConstants.languagecode = "hi"
                
                UserDefaults.standard.set("hi", forKey: "PreferredLanguage")
                self.locationvalue = "1"
                AppConstants.languageCodeSelectInMenu = 1
                AppConstants.splashscreenoptions = 1
                Language.language = Language(rawValue: "hi")!
            }else{
                self.locationvalue = "0"
            }
            
        }
        else if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "zh"){
            
            if AppConstants.languageCodeSelectInMenu == 0{
                AppConstants.languagecode = "zh"
                
                UserDefaults.standard.set("zh", forKey: "PreferredLanguage")
                self.locationvalue = "1"
                AppConstants.languageCodeSelectInMenu = 1
                AppConstants.splashscreenoptions = 1
                Language.language = Language(rawValue: "zh")!
            }else{
                self.locationvalue = "0"
            }
            
        }
        else{
            if AppConstants.languageCodeSelectInMenu == 0{
                
                UserDefaults.standard.set("en", forKey: "PreferredLanguage")
                
                // self.locationvalue = "1"
                AppConstants.languageCodeSelectInMenu = 1
                AppConstants.languagecode = "en"
                AppConstants.splashscreenoptions = 1
                Language.language = Language(rawValue: "en")!
            }else{
                self.locationvalue = "0"
            }
        }
        
        taxinamelabel.text = "Ship now Driver".localized
        registerbtntext.setTitle("REGISTER".localized, for: .normal)
        loginbtntext.setTitle("LOGIN".localized, for: .normal)
        demobtn.setTitle("DEMO".localized, for: .normal)
        
        locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        AppConstants.calculatedAccuracy = self.locationManager.desiredAccuracy
        self.locationManager.pausesLocationUpdatesAutomatically = false
        self.locationManager.requestAlwaysAuthorization()
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        //        self.locationManager.startUpdatingLocation()
        //
        
        //        if self.locationvalue == "1"{
        //
        //
        //        }else{
        
        if ReachabilityManager.shared.isNetworkAvailable{
            
            self.timerForToken  = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(SplashViewController.getDeviceToken), userInfo: nil, repeats: true)
            //  }
            
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            
            LocationManagerClass.sharedInstance.startupdatelocation()
            
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
            // If always authorized
            
            LocationManagerClass.sharedInstance.startupdatelocation()
            
            manager.startUpdatingLocation()
            break
        case .restricted:
            // If restricted by e.g. parental controls. User can't enable Location Services
            break
        case .denied:
            // If user denied your app access to Location Services, but can grant access from Settings.app
            
            self.checklocationservice()
            
            // self.startgetlocation1()
            break
        }
    }
    
    func checklocationservice(){
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                
                self.showalert5(message: "To continue, let your device turn on location, which uses Google's location services.Please turn on your location from settings.".localized)
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            }
        } else {
            print("Location services are not enabled")
            
            self.showalert5(message: "To continue, let your device turn on location, which uses Google's location services.Please turn on your location from settings.".localized)
            
        }
    }
    
    
    func showalert5(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   "Alert".localized, message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                
                UIApplication.shared.openURL(NSURL(string: UIApplication.openSettingsURLString)! as URL)
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
        })
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        AppConstants.documentscreenapi = "1"
    }
    
    //---------Action Performed----------
    @IBAction func demo_btn_click(_ sender: Any) {
        
        let alert = UIAlertController(title: "Alert".localized, message: "Make sure you logged as Demo in Driver App as well.".localized, preferredStyle: .alert)
        
        let cancelaction = UIAlertAction(title: "CANCEL".localized, style: .default) { _ in
            
        }
        alert.addAction(cancelaction)
        
        let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myModalViewController = storyboard.instantiateViewController(withIdentifier: "DemoLoginDetailsViewController")as! DemoLoginDetailsViewController
            
            self.present(myModalViewController, animated: false, completion: nil)
        }
        alert.addAction(action)
        
        self.present(alert, animated: true){}
    }
    
    @IBAction func register_btn(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpController: SignupViewController = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        signUpController.reflectScreenData = configuredata.data?.register
        self.present(signUpController, animated: true, completion: nil)
    }
    
    @IBAction func login_btn(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginController: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginController.loginScreenData = configuredata.data?.login
        self.present(loginController, animated: true, completion: nil)
        
    }
    
    @objc func getDeviceToken(timer : Timer){
        
        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.UNIQUE_NUMBER)  && (UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.PLAYER_ID) || UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.DEVICE_ID)){
            
            self.timerForToken.invalidate()
            
            let dic1 = [
                
                "apk_version":AppConstants.appversion,
                "device":"2"
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCONFIGURATION
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter1(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverAppConfigureModel.self)
            
        } else {
            debugPrint("Device Token Not found..")
        }
    }
}

//------Api Response------

extension SplashViewController: ApiResponseReceiver{
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverAppConfigureModel{
            let data:DriverAppConfigureModel = responseData
            configuredata = data
            AppConstants.driverconfiguredata = data
            
            if data.result == "1"{
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.saveStringWithKey(String(AppConstants.driverconfiguredata.data?.generalConfig?.pushnotification ?? 1), key: AppConstants.UserDefaultKeys.PUSH_NOTIFICATION_VALUE)
                
                
                //                let splashimage = AppConstants.driverconfiguredata.data?.generalConfig?.splashscreendriver ?? ""
                //
                //
                //                print(splashimage)
                //
                //                if splashimage == ""{
                //
                //
                //                }else{
                //
                //                    AppConstants.downloadimage(imagename: splashimage, imageview: splashmainimageview, placeholderimage: "mandy")
                //
                //
                //                }
                
                
                UserDefaultUtility.saveBoolForKey("outstationpopup", value: (AppConstants.driverconfiguredata.data?.rideConfig?.outstationnotificationpopup) ?? false)
                
                if (AppConstants.driverconfiguredata.data?.appMaintainance?.showDialog)!{
                    let alert = UIAlertController(title: "", message: "App is under maintenance.".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Exit".localized, style: .default) { _ in
                        exit(0)
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else{
                    
                    if (AppConstants.driverconfiguredata.data?.appVersionDialog?.showDialog)!{
                        
                        if (AppConstants.driverconfiguredata.data?.appVersionDialog?.mandatory)!{
                            
                            let message: String = AppConstants.driverconfiguredata.data?.appVersionDialog?.dialogMessage ?? "New Version Available. Please update the app first.".localized
                            let alertController = UIAlertController(
                                title: "UPDATE AVAILABLE ".localized, // This gets overridden below.
                                message: message,
                                preferredStyle: .alert
                            )
                            let okAction = UIAlertAction(title: "Update App".localized, style: .cancel) { _ -> Void in
                                
                                AppConstants.rateApp(appId: (AppConstants.driverconfiguredata.data?.appVersionDialog?.iosdriverappid ?? "id1477821379")) { success in
                                }
                            }
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                            
                        }else{
                            
                            let refreshAlert = UIAlertController(title: "UPDATE AVAILABLE ".localized, message: AppConstants.driverconfiguredata.data?.appVersionDialog?.dialogMessage ?? "New Version Available. Please update the app.".localized, preferredStyle: UIAlertController.Style.alert)
                            
                            refreshAlert.addAction(UIAlertAction(title: "Update App".localized, style: .default, handler: { (action: UIAlertAction!) in
                                
                                AppConstants.rateApp(appId: (AppConstants.driverconfiguredata.data?.appVersionDialog?.iosdriverappid ?? "id1477821379")) { success in
                                }
                            }))
                            
                            refreshAlert.addAction(UIAlertAction(title: "Later".localized, style: .default, handler: { (action: UIAlertAction!) in
                                
                                self.buttonsmainview.isHidden = false
                                
                                if ((data.data?.generalConfig?.demo)!){
                                    self.demomaiviewheight.constant = 60
                                    self.buttonmainviewheight.constant = 60
                                    self.demomainview.isHidden = false
                                }else
                                {
                                    self.demomainview.isHidden = true
                                    self.demomaiviewheight.constant = 0
                                    self.buttonmainviewheight.constant = 60
                                }
                                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.SIGNUP_STEP){
                                    
                                    let signupstep = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.SIGNUP_STEP)
                                    
                                    if signupstep as! String == "1"
                                    {
                                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                        let nextController: VehicleInformationViewController = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
                                        nextController.movedFrom = movedFromDocVer.loginScreen.rawValue
                                        self.present(nextController, animated: false, completion: nil)
                                        //    self.presentVC("VehicleInformationViewController")
                                        
                                    }
                                    else if signupstep as! String == "2"
                                    {
                                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                        let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
                                        nextController.moveDfrom = movedFromDocVer.loginScreen.rawValue
                                        self.present(nextController, animated: false, completion: nil)
                                        
                                    }else{
                                        
                                        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                                            
                                            AppConstants.dicauthorization = ["Accept":"application/json",
                                                                             "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                                                             "locale":AppConstants.languagecode
                                                ] as [String : AnyObject]
                                            
                                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                            let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                                            
                                            if let window = self.view.window{
                                                window.rootViewController = nextController
                                            }
                                        }
                                        else
                                        {
                                            self.hideLoaderWithoutBackground()
                                            //presentVC("LoginViewController")
                                        }
                                    }
                                }
                            }))
                            
                            present(refreshAlert, animated: true, completion: nil)
                        }
                    }else{
                        
                        buttonsmainview.isHidden = false
                        
                        if ((data.data?.generalConfig?.demo)!){
                            demomaiviewheight.constant = 60
                            buttonmainviewheight.constant = 60
                            self.demomainview.isHidden = false
                        }else
                        {
                            self.demomainview.isHidden = true
                            demomaiviewheight.constant = 0
                            buttonmainviewheight.constant = 60
                        }
                        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.SIGNUP_STEP){
                            
                            let signupstep = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.SIGNUP_STEP)
                            
                            if signupstep as! String == "1"
                            {
                                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let nextController: VehicleInformationViewController = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
                                nextController.movedFrom = movedFromDocVer.loginScreen.rawValue
                                self.present(nextController, animated: false, completion: nil)
                                //    self.presentVC("VehicleInformationViewController")
                                
                            }
                            else if signupstep as! String == "2"
                            {
                                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
                                nextController.moveDfrom = movedFromDocVer.loginScreen.rawValue
                                self.present(nextController, animated: false, completion: nil)
                                
                            }else{
                                
                                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                                    
                                    AppConstants.dicauthorization = ["Accept":"application/json",
                                                                     "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                                                     "locale":AppConstants.languagecode
                                        
                                        ] as [String : AnyObject]
                                    
                                    
                                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                                    
                                    if let window = self.view.window{
                                        window.rootViewController = nextController
                                    }
                                }
                                else
                                {
                                    hideLoaderWithoutBackground()
                                    //presentVC("LoginViewController")
                                }
                            }
                        }else{
                            
                            if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                                
                                AppConstants.dicauthorization = ["Accept":"application/json",
                                                                 "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                                                 "locale":AppConstants.languagecode
                                    
                                    ] as [String : AnyObject]
                                
                                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                                
                                if let window = self.view.window{
                                    window.rootViewController = nextController
                                }
                            }
                            else
                            {
                                hideLoaderWithoutBackground()
                                //presentVC("LoginViewController")
                            }
                            
                        }
                    }
                }
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
}




