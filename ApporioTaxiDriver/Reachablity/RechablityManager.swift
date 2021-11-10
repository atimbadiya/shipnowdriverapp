//
//  RechablityManager.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ReachabilitySwift

class ReachabilityManager: NSObject {
    
    //Shared instance
    static  let shared = ReachabilityManager()
    
    //Boolean to track network reachability
    var isNetworkAvailable : Bool! = false
    
    //Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    var reachabilityStatus: Reachability.NetworkStatus = .notReachable
    
    //Reachability instance for Network status monitoring
    let reachability = Reachability()!
    
    /// Called whenever there is a change in NetworkReachibility Status
    ///
    /// — parameter notification: Notification with the Reachability instance
    @objc func reachabilityChanged(notification: Notification) {
    let reachability = notification.object as! Reachability
    switch reachability.currentReachabilityStatus {
    
    case .notReachable:
    isNetworkAvailable = false
    debugPrint("Network became unreachable")
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppConstants.NSNotificationNames.INTERNET_UNREACHABLE_NOTIFICATION), object: nil, userInfo: nil)
    
    case .reachableViaWiFi:
    isNetworkAvailable = true
    debugPrint("Network reachable through WiFi")
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppConstants.NSNotificationNames.INTERNET_RECHABLE_NOTIFICATION), object: nil, userInfo: nil)
    
    case .reachableViaWWAN:
    isNetworkAvailable = true
    debugPrint("Network reachable through Cellular Data")
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppConstants.NSNotificationNames.INTERNET_RECHABLE_NOTIFICATION), object: nil, userInfo: nil)
    }
    }
    
    /// Starts monitoring the network availability status
    func startMonitoring() {
    NotificationCenter.default.addObserver(self,
    selector: #selector(self.reachabilityChanged),
    name: ReachabilityChangedNotification,
    object: reachability)
    do{
    try reachability.startNotifier()
    } catch {
    debugPrint("Could not start reachability notifier")
    }
    }
    
}


