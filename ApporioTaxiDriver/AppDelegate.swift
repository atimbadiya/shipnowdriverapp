//
//  AppDelegate.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 29/01/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import GooglePlaces
import OneSignal
import GoogleMaps
import ObjectMapper
import IQKeyboardManagerSwift
import SwiftyJSON
import Stripe
import FirebaseAuth
import FirebaseCore
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, OSSubscriptionObserver, OSPermissionObserver {

    var window: UIWindow?
    
    var recievednotificationdata: RecievedNotificationModel!
    
    
    var recievednotificationdata1: MainRecievedNotificationModel!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        
        Fabric.with([Crashlytics.self])
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            AppConstants.appversion = version
            print(version)
        }
        
        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
            
            
            let dataaaa1 = (UserDefaults.standard.object(forKey: "configurationarray"))
            
            let dataaaa2 = self.json(from: dataaaa1 as Any)
            
            let jsonData =  DriverAppConfigureModel(JSONString: dataaaa2!)
            AppConstants.driverconfiguredata =  jsonData
            
            
            AppConstants.dicauthorization = ["Accept":"application/json",
                                             "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                             "locale":AppConstants.languagecode
                
                ] as [String : AnyObject]
            
            
        }else{
            
            
        }
        
       
        let modelName = UIDevice.current.model
        
        AppConstants.modelname = modelName
        
        FirebaseApp.configure()
        
        let bundleID = Bundle.main.bundleIdentifier
        
        AppConstants.appbundleid = bundleID!
        
         ReachabilityManager.shared.startMonitoring()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        
        let device_id = UIDevice.current.identifierForVendor?.uuidString
        
        StripeAPI.defaultPublishableKey = "pk_live_51HmaxMKDRHEasUKPb5A526Cgp93Ss8WNQETETduj108NUL32jyl21qMJSUR766EMlwmim6lPq0jv4jyG2VVnz84200zonky5HD"
        
        UserDefaultUtility.saveStringWithKey((device_id)!, key: AppConstants.UserDefaultKeys.UNIQUE_NUMBER)
        
        GMSServices.provideAPIKey("AIzaSyBeSXEpjR4eSAol-2HcUT_dMNXz-GGefuc")
        GMSPlacesClient.provideAPIKey("AIzaSyBeSXEpjR4eSAol-2HcUT_dMNXz-GGefuc")
        
        let notificationReceivedBlock: OSHandleNotificationReceivedBlock = { notification in
            
            print("Received Notification: \(String(describing: notification?.payload.body))")
            let dataaaa = self.json(from: notification?.payload.additionalData as Any)
            let jsonData =  RecievedNotificationModel(JSONString: dataaaa!)
            self.recievednotificationdata =  jsonData
            if self.recievednotificationdata.type == 1{
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                
                if self.recievednotificationdata.data?.bookingStatus == 1001{
                    
                    if self.recievednotificationdata.data?.bookingType == "1"{
                        
                        
                        if AppConstants.screenfromaccept == "1"{
                            
                            
                        }else{
                            
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.mutiplestops.removeAll()
                AppConstants.multipleVisable = self.recievednotificationdata.data?.multipleVisable ?? false
                let tablecount = self.recievednotificationdata.data?.multipleStopList?.count ?? 0
                            
                            if tablecount == 0{
                                
                                
                            }else{
                                
                               for i in 0...tablecount - 1{
                                
                                AppConstants.mutiplestops.append((self.recievednotificationdata.data?.multipleStopList![i].dropLocation)!)
                                }
                            }
                            
                    AppConstants.productDetailsData = self.recievednotificationdata.data?.productDetails
                    AppConstants.productImages = self.recievednotificationdata.data?.productImages
                    AppConstants.receiverDetails = self.recievednotificationdata.data?.receiverDetails
                            
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    AppConstants.servicetypeid = String((self.recievednotificationdata.data?.serviceTypeId ?? -1))
                    AppConstants.vehiclename = (self.recievednotificationdata.data?.vehicle!)!
                    AppConstants.service = (self.recievednotificationdata.data?.service!)!
                    AppConstants.estimatedistance = self.recievednotificationdata.data?.estimateDistance ?? ""

                    AppConstants.estimateFare = self.recievednotificationdata.data?.estimateBill ?? "0.0"
                    AppConstants.additionalNotes = (self.recievednotificationdata.data?.additionalNotes!)!
                    AppConstants.dropLocation = (self.recievednotificationdata.data?.dropLocation!)!
                    AppConstants.estimatetime =
                        (self.recievednotificationdata.data?.estimateTime!)!
                    AppConstants.paymentmethod = (self.recievednotificationdata.data?.paymentMethod!)!
                    AppConstants.timestamp = String((self.recievednotificationdata.data?.timestamp)!)
                    AppConstants.packagename = (self.recievednotificationdata.data?.packageName!)!
                    AppConstants.pickuplocation = (self.recievednotificationdata.data?.pickupLocation!)!
                    AppConstants.userphone = (self.recievednotificationdata.data?.phone!)!
                    AppConstants.username = (self.recievednotificationdata.data?.username!)!
                    AppConstants.driverrequesttimeout = String((self.recievednotificationdata.data?.driverRequestTimeout!)!)
                    AppConstants.useremail = (self.recievednotificationdata.data?.email!)!
                    AppConstants.vehicleimage = (self.recievednotificationdata.data?.vehicleimage!)!
                            
                  
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptRideViewController") as! AcceptRideViewController

                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                            
                    }
                        
                    }else{
                        
                      AppConstants.dialogopen = "1"
                        
                        if UserDefaultUtility.retrieveBoolForKey("outstationpopup"){
                            
                            
                              AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                            
                            self.showalert3(message: notification?.payload.body ?? "")
                            
                            
                        }else{
                        
                        
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AllUpcomingTripsViewController") as! AllUpcomingTripsViewController
                        
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                    }
                        
                    }
                  }
                
                if self.recievednotificationdata.data?.bookingStatus == 1002{
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
//                    AppConstants.newtimer?.cancel()
//                    AppConstants.newtimer = nil
//                    AppConstants.dialogopen = "1"
                    
//                    self.showalert1(message: "Your Ride Cancel by Driver!!".localized)
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                    
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(TrackViewController, animated: true, completion: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1003{
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
//                    AppConstants.newtimer?.cancel()
//                    AppConstants.newtimer = nil
                    
 //                   AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1004{
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
//                    AppConstants.newtimer?.cancel()
//                    AppConstants.newtimer = nil
                    
//                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1005{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    
//                    AppConstants.newtimer?.cancel()
//                    AppConstants.newtimer = nil
//
//                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "RideFareViewController") as! RideFareViewController
                    
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(TrackViewController, animated: true, completion: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1006{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    self.showalert1(message: "Ride Cancelled By User".localized)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1111{
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "acceptscreen"), object: nil, userInfo: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1007{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    self.showalert1(message: "Ride Cancelled By Driver".localized)
            }
                
                if self.recievednotificationdata.data?.bookingStatus == 1008{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    self.showalert1(message: "Ride Cancelled By Admin".localized)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1009{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                  //  self.showalert1(message: "Drop Location Change By User".localized)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1112{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    
                    //self.showalert1(message: "Please Make Payment".localized)
                    let alert = UIAlertController(title: "", message: notification?.payload.body ?? "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                    }
                    alert.addAction(action)
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(alert, animated: true) {
                    }
                }
            }
            }
            else if self.recievednotificationdata.type == 2
            {
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                if  AppConstants.notificationvalue == ""{
                    
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                                
                var presentedVC = self.window?.rootViewController
                
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(nextController, animated: true, completion: nil)
                    
                }else{
                    
                }
                }
                
            }else if self.recievednotificationdata.type == 3{
                AppConstants.dialogopen = "1"
               // self.showalert2(message: (notification?.payload.body ?? "")!)
            }
            else if self.recievednotificationdata.type == 5{
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                
                AppConstants.chatCount = 1
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
                }
                
       //           NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
            }
            else if self.recievednotificationdata.type == 6{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                
                UserDefaultUtility.removeAllUserDefault()
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
                
            }
            else if self.recievednotificationdata.type == 7
            {
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                
                
                if AppConstants.termChangedNotification == true
                {
                    AppConstants.termChangedNotification = false
                    let alertController = UIAlertController(title: "Alert".localized, message:"Terms and conditions has been changed.".localized, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let TermsController = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsViewController") as! TermsConditionsViewController
                        TermsController.source = "NOTIFICATION"
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(TermsController, animated: true, completion: nil)
                    }
                    alertController.addAction(OKAction)
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(alertController, animated: true) {
                    }
                }
            }
            }else if self.recievednotificationdata.type == 10{
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: (notification?.payload.body ?? "")!)
                }
                
            }else if self.recievednotificationdata.type == 11{
                 if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                AppConstants.dialogopen = "1"
                self.showalert5(message: (notification?.payload.body ?? "")!)
            }
            
            }else if self.recievednotificationdata.type == 12{
                 if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                AppConstants.dialogopen = "1"
                self.showalert5(message: (notification?.payload.body ?? "")!)
                }
                
            }else if self.recievednotificationdata.type == 13{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: (notification?.payload.body ?? "")!)
                
            }else if self.recievednotificationdata.type == 14{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: (notification?.payload.body ?? "")!)
                
            }else if self.recievednotificationdata.type == 15{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: (notification?.payload.body ?? "")!)
                
            }else if self.recievednotificationdata.type == 16{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: (notification?.payload.body ?? "")!)
                
            }else if self.recievednotificationdata.type == 17{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: (notification?.payload.body ?? "")!)
                
            }else if self.recievednotificationdata.type == 19{
                
                AppConstants.dialogopen = "1"
               // self.showalert2(message: (notification?.payload.body ?? "")!)
                
            }else if self.recievednotificationdata.type == 22{
                 if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                AppConstants.dialogopen = "1"
                self.showalert6(message: (notification?.payload.body ?? "")!)
                    
                }
            }
        }
        
        let notificationOpenedBlock: OSHandleNotificationActionBlock = { result in
            // This block gets called when the user reacts to a notification received
            let payload: OSNotificationPayload = result!.notification.payload
            
            let dataaaa = self.json(from: payload.additionalData as Any)
            
            let jsonData =  RecievedNotificationModel(JSONString: dataaaa!)
            self.recievednotificationdata =  jsonData
            
            if self.recievednotificationdata.type == 1{
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                
                if self.recievednotificationdata.data?.bookingStatus == 1001{
                    
                    if self.recievednotificationdata.data?.bookingType == "1"{
                        
                        if AppConstants.screenfromaccept == "1"{
                        
                        }else{
                        
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                            
                            AppConstants.mutiplestops.removeAll()
                            
                            AppConstants.multipleVisable = self.recievednotificationdata.data?.multipleVisable ?? false
                            
                            let tablecount = self.recievednotificationdata.data?.multipleStopList?.count ?? 0
                            
                            if tablecount == 0{
                                
                                
                            }else{
                                
                                for i in 0...tablecount - 1{
                                    
                                    AppConstants.mutiplestops.append((self.recievednotificationdata.data?.multipleStopList![i].dropLocation)!)
                                }
                            }
                            
                    AppConstants.productDetailsData = self.recievednotificationdata.data?.productDetails
                    AppConstants.productImages = self.recievednotificationdata.data?.productImages
                    AppConstants.receiverDetails = self.recievednotificationdata.data?.receiverDetails

                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    AppConstants.servicetypeid = String((self.recievednotificationdata.data?.serviceTypeId!)!)
                    AppConstants.vehiclename = (self.recievednotificationdata.data?.vehicle!)!
                    AppConstants.service = (self.recievednotificationdata.data?.service!)!
                    AppConstants.estimatedistance = (self.recievednotificationdata.data?.estimateDistance!)!
                    AppConstants.estimateFare = self.recievednotificationdata.data?.estimateBill ?? "0.0"
                    AppConstants.additionalNotes = (self.recievednotificationdata.data?.additionalNotes!)!
                    AppConstants.dropLocation = (self.recievednotificationdata.data?.dropLocation!)!

                    AppConstants.estimatetime = (self.recievednotificationdata.data?.estimateTime!)!
                    AppConstants.paymentmethod = (self.recievednotificationdata.data?.paymentMethod!)!
                    AppConstants.timestamp = String((self.recievednotificationdata.data?.timestamp)!)
                    AppConstants.packagename = (self.recievednotificationdata.data?.packageName!)!
                    AppConstants.pickuplocation = (self.recievednotificationdata.data?.pickupLocation!)!
                    AppConstants.userphone = (self.recievednotificationdata.data?.phone!)!
                    AppConstants.username = (self.recievednotificationdata.data?.username!)!
                    AppConstants.driverrequesttimeout = String((self.recievednotificationdata.data?.driverRequestTimeout!)!)
                    AppConstants.useremail = (self.recievednotificationdata.data?.email!)!
                    AppConstants.vehicleimage = (self.recievednotificationdata.data?.vehicleimage!)!

                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptRideViewController") as! AcceptRideViewController

                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                            
                        }
                    }else{
                        
                        if  AppConstants.dialogopen == "0"{
                            
                            
                            if UserDefaultUtility.retrieveBoolForKey("outstationpopup"){
                                
                                
                                AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                                
                                self.showalert3(message: (payload.body ?? "")!)
                                
                                
                            }else{
                            
                            
                            AppConstants.dialogopen = "0"
                            
                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let nextController: AllUpcomingTripsViewController = storyboard.instantiateViewController(withIdentifier: "AllUpcomingTripsViewController") as! AllUpcomingTripsViewController
                            var presentedVC = self.window?.rootViewController
                            while (presentedVC!.presentedViewController != nil)  {
                                presentedVC = presentedVC!.presentedViewController
                            }
                            presentedVC!.present(nextController, animated: true, completion: nil)
                            }
                            
                        }else{
                            
                            
                        }
                    }
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1002{
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    //                    AppConstants.newtimer?.cancel()
                    //                    AppConstants.newtimer = nil
                    //                    AppConstants.dialogopen = "1"
                    
                    //                    self.showalert1(message: "Your Ride Cancel by Driver!!".localized)
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                    
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(TrackViewController, animated: true, completion: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1003{
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    //                    AppConstants.newtimer?.cancel()
                    //                    AppConstants.newtimer = nil
                    
                    //                   AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1004{
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    //                    AppConstants.newtimer?.cancel()
                    //                    AppConstants.newtimer = nil
                    
                    //                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1005{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    //                    AppConstants.newtimer?.cancel()
                    //                    AppConstants.newtimer = nil
                    //
                    //                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "RideFareViewController") as! RideFareViewController
                    
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(TrackViewController, animated: true, completion: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1006{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    self.showalert1(message: (payload.body ?? "")!)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1007{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    self.showalert1(message: (payload.body ?? "")!)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1111{
                    
                   NotificationCenter.default.post(name: NSNotification.Name(rawValue: "acceptscreen"), object: nil, userInfo: nil)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1008{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.bookingid = String((self.recievednotificationdata.data?.bookingId)!)
                    
                    self.showalert1(message: (payload.body ?? "")!)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1009{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                     NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                //    self.showalert1(message: "Drop Location Change By User".localized)
                }
                
                if self.recievednotificationdata.data?.bookingStatus == 1112{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    
                    //self.showalert1(message: (payload.body ?? "")!)
                    let alert = UIAlertController(title: "", message: payload.body ?? "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(alert, animated: true) {
                    }
                    
                    
                }
                
            }
             
            }
            else if self.recievednotificationdata.type == 2{
                
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                
                if  AppConstants.notificationvalue == ""{
                    
                
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                    
                    
                    var presentedVC = self.window?.rootViewController
                    
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(nextController, animated: true, completion: nil)
                    
                }else{
                    
                    
                }
                    
                }
                
            }else if self.recievednotificationdata.type == 3{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                  //  self.showalert2(message: (payload.body ?? "")!)
                    
                }
            }
            else if self.recievednotificationdata.type == 5{
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                 AppConstants.chatCount = 1
               //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
                    
                }
            }
            else if self.recievednotificationdata.type == 6{
                
                
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                
                UserDefaultUtility.removeAllUserDefault()
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
                
            }
            else if self.recievednotificationdata.type == 7
            {
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                
                if AppConstants.termChangedNotification == true
                {
                     AppConstants.termChangedNotification = false
                    let alertController = UIAlertController(title: "Alert".localized, message:"Terms and conditions has been changed.".localized, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let TermsController = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsViewController") as! TermsConditionsViewController
                        TermsController.source = "NOTIFICATION"
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(TermsController, animated: true, completion: nil)
                    }
                    alertController.addAction(OKAction)
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(alertController, animated: true) {
                    }
                }
                    
                }
            }else if self.recievednotificationdata.type == 10{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata.type == 11{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    
                    
                     if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    self.showalert5(message: (payload.body ?? "")!)
                    }
                }
                
            }else if self.recievednotificationdata.type == 12{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    
                     if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    self.showalert5(message: (payload.body ?? "")!)
                    }
                }
                
            }else if self.recievednotificationdata.type == 13{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata.type == 14{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata.type == 15{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata.type == 16{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata.type == 17{
                
                if AppConstants.dialogopen == "1"
                {
                }
                else
                {
                    self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata.type == 19{
                
                if AppConstants.dialogopen == "1"
                {
                }
                else
                {
                  //  self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata.type == 22{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    
                     if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    self.showalert6(message: (payload.body ?? "")!)
                    }
                }
            }
        }
        
        let langId = NSLocale.current.languageCode
        
        
        if ((UserDefaults.standard.string(forKey: "PreferredLanguage")) != nil){
            AppConstants.languageCodeSelectInMenu = 1
            AppConstants.languagecode = UserDefaults.standard.string(forKey: "PreferredLanguage")!
            // Language.language = Language(rawValue: langId!)!
            
        } else{
            
            AppConstants.languagecode = langId!
            UserDefaults.standard.set(langId, forKey: "PreferredLanguage")
            // langId = NSLocale.current.languageCode
            // Language.language = Language(rawValue: langId!)!
            
        }
        
        
        let onesignalInitSettings: [AnyHashable: Any] = [kOSSettingsKeyAutoPrompt: false,kOSSettingsKeyInFocusDisplayOption: OSNotificationDisplayType.none.rawValue]
        
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: "0121f9f0-374f-4699-8ea7-9ce9217bd701",
                                        handleNotificationReceived: notificationReceivedBlock,
                                        handleNotificationAction: notificationOpenedBlock,
                                        settings: onesignalInitSettings)
        
        
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
        
       // OneSignal.promptLocation()
        
        OneSignal.add(self as OSSubscriptionObserver)
        
        OneSignal.add(self as OSPermissionObserver)
        
        // Override point for customiz
        
        return true
    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    
    func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!) {
        if !stateChanges.from.subscribed && stateChanges.to.subscribed {
            print("Subscribed for OneSignal push notifications!")
        }
        print("SubscriptionStateChange: \n\(String(describing: stateChanges))")
        
        //The player id is inside stateChanges. But be careful, this value can be nil if the user has not granted you permission to send notifications.
        if let playerId = stateChanges.to.userId {
            print("Current playerId \(playerId)")
            UserDefaultUtility.saveStringWithKey((playerId), key: AppConstants.UserDefaultKeys.PLAYER_ID)
            
        }
    }
    
    
    func onOSPermissionChanged(_ stateChanges: OSPermissionStateChanges!) {
        // Example of detecting answering the permission prompt
        if stateChanges.from.status == OSNotificationPermission.notDetermined {
            if stateChanges.to.status == OSNotificationPermission.authorized {
                print("Thanks for accepting notifications!")
                //   GlobalVarible.notificationvalue = 0
            } else if stateChanges.to.status == OSNotificationPermission.denied {
                //  GlobalVarible.notificationvalue = 1
                print("Notifications not accepted. You can turn them on later under your iOS settings.")
                
            }
        }
        // prints out all properties
        print("PermissionStateChanges: \n\(String(describing: stateChanges))")
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
       // SocketManagerClass.sharedInstance.establishConnection()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        print("Notifications status: \(notificationSettings)")
        
        if notificationSettings.types == UIUserNotificationType(rawValue: 0){
            print(notificationSettings.types)
            
            //GlobalVariables.notificationvalue = 1
            
            let deviceTokenValue = "7eba6f12589ea1d618359dc10d5633e031aae26a50023e531f712659975a7013"
            
            //  UserDefaults.standard.setValue(deviceTokenValue, forKey:"device_key")
            
            UserDefaults.standard.setValue(deviceTokenValue, forKey: AppConstants.UserDefaultKeys.DEVICE_ID)
            //  self.showalert2("Please first turn on Notification from Settings.")
            
            
        }else{
            print(notificationSettings.types)
            
            //GlobalVariables.notificationvalue = 0
        }
        
        
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert token to string
        //        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        //        print(deviceTokenString)
        
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("token \(token)")
        
        //GlobalVariables.notificationvalue = 0
        //print(deviceTokenString)
        
//        let device_id = UIDevice.current.identifierForVendor?.uuidString
        print("Registered for push notification")
        //   UserDefaults.standard.set(device_id, forKey: "DeviceId")
        UserDefaults.standard.setValue(token, forKey: AppConstants.UserDefaultKeys.DEVICE_ID)
        
        UserDefaults.standard.synchronize()
        
        
    }
    
    // Called when APNs failed to register the device for push notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("APNs registration failed: \(error)")
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print("dfxghjkldfxghjdxfcgvhbjnkmcfgvhbjnk")
    }
    
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (_ options:UNNotificationPresentationOptions) -> Void)
    {
        print("Handle push from foreground")
        
        print("\(notification.request.content.userInfo)")
        
         if UserDefaultUtility.retrieveBoolForKey(AppConstants.UserDefaultKeys.FIREBASE_ONESIGNAL_CHECK){
        
        let info : NSDictionary! = notification.request.content.userInfo as NSDictionary
        
        if info != nil
        {
            let receivedData = info["aps"] as? NSDictionary
            
            let dataaaa = self.json(from: receivedData as Any)
            
            let jsonData =  MainRecievedNotificationModel(JSONString: dataaaa!)
            self.recievednotificationdata1 =  jsonData
            
            let receivedMessge = self.recievednotificationdata1.alert ?? ""
            
            if self.recievednotificationdata1.ridedata!.type == 1{
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1001{
                        
                        if self.recievednotificationdata1.ridedata!.data?.bookingType == "1"{
                            
                            if AppConstants.screenfromaccept == "1"{
                                
                            }else{
                                
                                AppConstants.timer?.cancel()
                                AppConstants.timer = nil
                                
                                AppConstants.mutiplestops.removeAll()
                                
                                AppConstants.multipleVisable = self.recievednotificationdata1.ridedata!.data?.multipleVisable ?? false
                                
                                let tablecount = self.recievednotificationdata1.ridedata!.data?.multipleStopList?.count ?? 0
                                
                                if tablecount == 0{
                                    
                                }else{
                                    
                                    for i in 0...tablecount - 1{
                                        
                                        AppConstants.mutiplestops.append((self.recievednotificationdata1.ridedata!.data?.multipleStopList![i].dropLocation)!)
                                    }
                                }
                                
                                
                                AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                                print(AppConstants.bookingid)
                                AppConstants.servicetypeid = String((self.recievednotificationdata1.ridedata!.data?.serviceTypeId ?? -1))
                                AppConstants.vehiclename = (self.recievednotificationdata1.ridedata!.data?.vehicle!)!
                                AppConstants.service = (self.recievednotificationdata1.ridedata!.data?.service!)!
                                AppConstants.estimatedistance = self.recievednotificationdata1.ridedata!.data?.estimateDistance ?? ""
                                
                                AppConstants.estimateFare = self.recievednotificationdata1.ridedata!.data?.estimateBill ?? "0.0"
                                AppConstants.additionalNotes = (self.recievednotificationdata1.ridedata!.data?.additionalNotes!)!
                                AppConstants.dropLocation = (self.recievednotificationdata1.ridedata!.data?.dropLocation!)!
                                AppConstants.estimatetime =
                                    (self.recievednotificationdata1.ridedata!.data?.estimateTime!)!
                                AppConstants.paymentmethod = (self.recievednotificationdata1.ridedata!.data?.paymentMethod!)!
                                AppConstants.timestamp = String((self.recievednotificationdata1.ridedata!.data?.timestamp)!)
                                AppConstants.packagename = (self.recievednotificationdata1.ridedata!.data?.packageName!)!
                                AppConstants.pickuplocation = (self.recievednotificationdata1.ridedata!.data?.pickupLocation!)!
                                AppConstants.userphone = (self.recievednotificationdata1.ridedata!.data?.phone!)!
                                AppConstants.username = (self.recievednotificationdata1.ridedata!.data?.username!)!
                                AppConstants.driverrequesttimeout = String((self.recievednotificationdata1.ridedata!.data?.driverRequestTimeout!)!)
                                AppConstants.useremail = (self.recievednotificationdata1.ridedata!.data?.email!)!
                                AppConstants.vehicleimage = (self.recievednotificationdata1.ridedata!.data?.vehicleimage!)!
                                
                                
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptRideViewController") as! AcceptRideViewController
                                
                                var presentedVC = self.window?.rootViewController
                                while (presentedVC!.presentedViewController != nil)  {
                                    presentedVC = presentedVC!.presentedViewController
                                }
                                presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                                
                            }
                        }else{
                            
                            AppConstants.dialogopen = "1"
                            
                            if UserDefaultUtility.retrieveBoolForKey("outstationpopup"){
                                
                                AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                                
                                self.showalert3(message: receivedMessge)
                                
                            }else{
                                
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AllUpcomingTripsViewController") as! AllUpcomingTripsViewController
                                
                                var presentedVC = self.window?.rootViewController
                                while (presentedVC!.presentedViewController != nil)  {
                                    presentedVC = presentedVC!.presentedViewController
                                }
                                presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                            }
                        }
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1002{
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        //                    AppConstants.dialogopen = "1"
                        
                        //                    self.showalert1(message: "Your Ride Cancel by Driver!!".localized)
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                        
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(TrackViewController, animated: true, completion: nil)
                        
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1003{
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        
                        //                   AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1004{
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        
                        //                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1005{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        //
                        //                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "RideFareViewController") as! RideFareViewController
                        
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(TrackViewController, animated: true, completion: nil)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1006{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        self.showalert1(message: "Ride Cancelled By User".localized)
                        
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1111{
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "acceptscreen"), object: nil, userInfo: nil)
                        
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1007{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        self.showalert1(message: "Ride Cancelled By Driver".localized)
                        
                        
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1008{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        self.showalert1(message: "Ride Cancelled By Admin".localized)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1009{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                        //  self.showalert1(message: "Drop Location Change By User".localized)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1112{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        
                        //self.showalert1(message: "Please Make Payment".localized)
                        let alert = UIAlertController(title: "", message: receivedMessge, preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                            
                        }
                        alert.addAction(action)
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(alert, animated: true) {
                        }
                    }
                }
            }
            
            else if self.recievednotificationdata1.ridedata!.type == 2
            {
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    if  AppConstants.notificationvalue == ""{
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                        
                        
                        var presentedVC = self.window?.rootViewController
                        
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(nextController, animated: true, completion: nil)
                        
                    }else{
                        
                        
                        
                    }
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 3{
                AppConstants.dialogopen = "1"
                // self.showalert2(message: (notification?.payload.body ?? "")!)
            }
            else if self.recievednotificationdata1.ridedata!.type == 5{
                
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    AppConstants.chatCount = 1
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
                    
                }
                
                //           NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
            }
            else if self.recievednotificationdata1.ridedata!.type == 6{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                
                UserDefaultUtility.removeAllUserDefault()
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
                
            }
            else if self.recievednotificationdata1.ridedata!.type == 7
            {
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    
                    if AppConstants.termChangedNotification == true
                    {
                        AppConstants.termChangedNotification = false
                        let alertController = UIAlertController(title: "Alert".localized, message:"Terms and conditions has been changed.".localized, preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let TermsController = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsViewController") as! TermsConditionsViewController
                            TermsController.source = "NOTIFICATION"
                            var presentedVC = self.window?.rootViewController
                            while (presentedVC!.presentedViewController != nil)  {
                                presentedVC = presentedVC!.presentedViewController
                            }
                            presentedVC!.present(TermsController, animated: true, completion: nil)
                        }
                        alertController.addAction(OKAction)
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(alertController, animated: true) {
                        }
                    }
                }
            }else if self.recievednotificationdata1.ridedata!.type == 10{
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    AppConstants.dialogopen = "1"
                    self.showalert2(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 11{
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    AppConstants.dialogopen = "1"
                    self.showalert5(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 12{
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    AppConstants.dialogopen = "1"
                    self.showalert5(message: receivedMessge)
                }
            }else if self.recievednotificationdata1.ridedata!.type == 13{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: receivedMessge)
                
            }else if self.recievednotificationdata1.ridedata!.type == 14{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: receivedMessge)
                
            }else if self.recievednotificationdata1.ridedata!.type == 15{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: receivedMessge)
                
            }else if self.recievednotificationdata1.ridedata!.type == 16{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: receivedMessge)
                
            }else if self.recievednotificationdata1.ridedata!.type == 17{
                
                AppConstants.dialogopen = "1"
                self.showalert2(message: receivedMessge)
                
            }else if self.recievednotificationdata1.ridedata!.type == 19{
                
                AppConstants.dialogopen = "1"
                // self.showalert2(message: (notification?.payload.body ?? "")!)
                
            }else if self.recievednotificationdata1.ridedata!.type == 22{
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    AppConstants.dialogopen = "1"
                    self.showalert6(message: receivedMessge)
                    
                }
                
            }
            
            
        }
            
         }else{
            
            
        }
        
    }
    
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response:UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        print("Handle push from background or closed")
        
        print("\(response.notification.request.content.userInfo)")
        
        
         if UserDefaultUtility.retrieveBoolForKey(AppConstants.UserDefaultKeys.FIREBASE_ONESIGNAL_CHECK){
        
        let info : NSDictionary! = response.notification.request.content.userInfo as NSDictionary
        
        if info != nil
        {
            let receivedData = info["aps"] as? NSDictionary
            
            
            
            
            let dataaaa = self.json(from: receivedData as Any)
            
            let jsonData =  MainRecievedNotificationModel(JSONString: dataaaa!)
            self.recievednotificationdata1 =  jsonData
            
            
            let receivedMessge = self.recievednotificationdata1.alert ?? ""
            
            if self.recievednotificationdata1.ridedata!.type == 1{
                
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1001{
                        
                        if self.recievednotificationdata1.ridedata!.data?.bookingType == "1"{
                            
                            if AppConstants.screenfromaccept == "1"{
                                
                            }else{
                                
                                AppConstants.timer?.cancel()
                                AppConstants.timer = nil
                                
                                AppConstants.mutiplestops.removeAll()
                                
                                AppConstants.multipleVisable = self.recievednotificationdata1.ridedata!.data?.multipleVisable ?? false
                                
                                let tablecount = self.recievednotificationdata1.ridedata!.data?.multipleStopList?.count ?? 0
                                
                                if tablecount == 0{
                                    
                                    
                                }else{
                                    
                                    for i in 0...tablecount - 1{
                                        
                                        AppConstants.mutiplestops.append((self.recievednotificationdata1.ridedata!.data?.multipleStopList![i].dropLocation)!)
                                        
                                        
                                    }
                                    
                                    
                                }
                                
                                AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                                print(AppConstants.bookingid)
                                AppConstants.servicetypeid = String((self.recievednotificationdata1.ridedata!.data?.serviceTypeId!)!)
                                AppConstants.vehiclename = (self.recievednotificationdata1.ridedata!.data?.vehicle!)!
                                AppConstants.service = (self.recievednotificationdata1.ridedata!.data?.service!)!
                                AppConstants.estimatedistance = (self.recievednotificationdata1.ridedata!.data?.estimateDistance!)!
                                AppConstants.estimateFare = self.recievednotificationdata1.ridedata!.data?.estimateBill ?? "0.0"
                                AppConstants.additionalNotes = (self.recievednotificationdata1.ridedata!.data?.additionalNotes!)!
                                AppConstants.dropLocation = (self.recievednotificationdata1.ridedata!.data?.dropLocation!)!
                                
                                AppConstants.estimatetime = (self.recievednotificationdata1.ridedata!.data?.estimateTime!)!
                                AppConstants.paymentmethod = (self.recievednotificationdata1.ridedata!.data?.paymentMethod!)!
                                AppConstants.timestamp = String((self.recievednotificationdata1.ridedata!.data?.timestamp)!)
                                AppConstants.packagename = (self.recievednotificationdata1.ridedata!.data?.packageName!)!
                                AppConstants.pickuplocation = (self.recievednotificationdata1.ridedata!.data?.pickupLocation!)!
                                AppConstants.userphone = (self.recievednotificationdata1.ridedata!.data?.phone!)!
                                AppConstants.username = (self.recievednotificationdata1.ridedata!.data?.username!)!
                                AppConstants.driverrequesttimeout = String((self.recievednotificationdata1.ridedata!.data?.driverRequestTimeout!)!)
                                AppConstants.useremail = (self.recievednotificationdata1.ridedata!.data?.email!)!
                                AppConstants.vehicleimage = (self.recievednotificationdata1.ridedata!.data?.vehicleimage!)!
                                
                                
                                
                                
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptRideViewController") as! AcceptRideViewController
                                
                                var presentedVC = self.window?.rootViewController
                                while (presentedVC!.presentedViewController != nil)  {
                                    presentedVC = presentedVC!.presentedViewController
                                }
                                presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                                
                            }
                            
                        }else{
                            
                            if  AppConstants.dialogopen == "0"{
                                
                                
                                if UserDefaultUtility.retrieveBoolForKey("outstationpopup"){
                                    
                                    
                                    AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                                    
                                    self.showalert3(message: receivedMessge)
                                    
                                    
                                }else{
                                    
                                    
                                    AppConstants.dialogopen = "0"
                                    
                                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    let nextController: AllUpcomingTripsViewController = storyboard.instantiateViewController(withIdentifier: "AllUpcomingTripsViewController") as! AllUpcomingTripsViewController
                                    var presentedVC = self.window?.rootViewController
                                    while (presentedVC!.presentedViewController != nil)  {
                                        presentedVC = presentedVC!.presentedViewController
                                    }
                                    presentedVC!.present(nextController, animated: true, completion: nil)
                                    
                                    
                                }
                                
                            }else{
                                
                                
                            }
                        }
                        
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1002{
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        //                    AppConstants.dialogopen = "1"
                        
                        //                    self.showalert1(message: "Your Ride Cancel by Driver!!".localized)
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                        
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(TrackViewController, animated: true, completion: nil)
                        
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1003{
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        
                        //                   AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1004{
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        
                        //                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                        
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1005{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        //                    AppConstants.newtimer?.cancel()
                        //                    AppConstants.newtimer = nil
                        //
                        //                    AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "RideFareViewController") as! RideFareViewController
                        
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(TrackViewController, animated: true, completion: nil)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1006{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        self.showalert1(message: receivedMessge)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1007{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        self.showalert1(message: receivedMessge)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1111{
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "acceptscreen"), object: nil, userInfo: nil)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1008{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        AppConstants.bookingid = String((self.recievednotificationdata1.ridedata!.data?.bookingId)!)
                        
                        self.showalert1(message: receivedMessge)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1009{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                        //    self.showalert1(message: "Drop Location Change By User".localized)
                    }
                    
                    if self.recievednotificationdata1.ridedata!.data?.bookingStatus == 1112{
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        
                        //self.showalert1(message: (payload.body ?? "")!)
                        let alert = UIAlertController(title: "", message: receivedMessge, preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                        }
                        alert.addAction(action)
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(alert, animated: true) {
                        }
                    }
                }
            }
            else if self.recievednotificationdata1.ridedata!.type == 2{
                
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    if  AppConstants.notificationvalue == ""{
                        
                        
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                        
                        
                        var presentedVC = self.window?.rootViewController
                        
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(nextController, animated: true, completion: nil)
                        
                    }else{
                        
                        
                    }
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 3{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    //  self.showalert2(message: (payload.body ?? "")!)
                    
                }
            }
            else if self.recievednotificationdata1.ridedata!.type == 5{
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    AppConstants.chatCount = 1
                    //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
                    
                }
            }
            else if self.recievednotificationdata1.ridedata!.type == 6{
                
                
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                
                UserDefaultUtility.removeAllUserDefault()
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
                
            }
            else if self.recievednotificationdata1.ridedata!.type == 7
            {
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    if AppConstants.termChangedNotification == true
                    {
                        AppConstants.termChangedNotification = false
                        let alertController = UIAlertController(title: "Alert".localized, message:"Terms and conditions has been changed.".localized, preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let TermsController = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsViewController") as! TermsConditionsViewController
                            TermsController.source = "NOTIFICATION"
                            var presentedVC = self.window?.rootViewController
                            while (presentedVC!.presentedViewController != nil)  {
                                presentedVC = presentedVC!.presentedViewController
                            }
                            presentedVC!.present(TermsController, animated: true, completion: nil)
                        }
                        alertController.addAction(OKAction)
                        var presentedVC = self.window?.rootViewController
                        while (presentedVC!.presentedViewController != nil)  {
                            presentedVC = presentedVC!.presentedViewController
                        }
                        presentedVC!.present(alertController, animated: true) {
                        }
                    }
                    
                }
            }else if self.recievednotificationdata1.ridedata!.type == 10{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 11{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    
                    
                    if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                        
                        self.showalert5(message: receivedMessge)
                    }
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 12{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    
                    if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                        self.showalert5(message: receivedMessge)
                    }
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 13{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 14{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 15{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 16{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    self.showalert2(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 17{
                
                if AppConstants.dialogopen == "1"
                {
                }
                else
                {
                    self.showalert2(message: receivedMessge)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 19{
                
                if AppConstants.dialogopen == "1"
                {
                }
                else
                {
                    //  self.showalert2(message: (payload.body ?? "")!)
                    
                }
                
            }else if self.recievednotificationdata1.ridedata!.type == 22{
                
                if AppConstants.dialogopen == "1"{
                    
                    
                }else{
                    
                    if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                        self.showalert6(message: receivedMessge)
                    }
                }
            }
        }
            
         }else{
            
            
        }
    }
    
    func showalert2(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            AppConstants.dialogopen = "1"
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                AppConstants.dialogopen = "0"
                
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
        })
    }
    
    
    func showalert5(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            AppConstants.dialogopen = "1"
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                AppConstants.dialogopen = "0"
                
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TermsController = storyBoard.instantiateViewController(withIdentifier: "ExpiredDocumentsViewController") as! ExpiredDocumentsViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TermsController, animated: true, completion: nil)
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
    func showalert6(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            AppConstants.dialogopen = "1"
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                AppConstants.dialogopen = "0"
                
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TermsController = storyBoard.instantiateViewController(withIdentifier: "NewPersonalDocumentViewController") as! NewPersonalDocumentViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TermsController, animated: true, completion: nil)
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
    func showalert3(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            AppConstants.dialogopen = "1"
            
            
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                AppConstants.dialogopen = "0"
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "FullTripDetailsViewController") as! FullTripDetailsViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                
                
                
            }
            
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
    
    func showalert1(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                // AppConstants.dialogopen = "0"
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(AcceptViewController, animated: true, completion: nil)
                
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
}

