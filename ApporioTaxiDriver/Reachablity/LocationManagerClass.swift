//
//  LocationManagerClass.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 03/07/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import Foundation
import CoreLocation


class LocationManagerClass: NSObject, CLLocationManagerDelegate{

static let sharedInstance = LocationManagerClass()
    
    
     let locationManager = CLLocationManager()
    
    var Lat = ""
    var Lng = ""
    
    
    var finddistancelat = ""
    var finddistancelng = ""
    var radiansBearing : Double = 0.0
    
    
    
    func startupdatelocation(){
        
      //  kCLLocationAccuracyNearestTenMeters
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        AppConstants.calculatedAccuracy = self.locationManager.desiredAccuracy
        
        self.locationManager.pausesLocationUpdatesAutomatically = false
        //  self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        
        self.locationManager.startUpdatingLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        print(locations.count)
        
        
        if let location = locations.first {
            
            AppConstants.Lat = String(location.coordinate.latitude)
            AppConstants.Lng = String(location.coordinate.longitude)
            
            AppConstants.drivertselectaddressLng = String(location.coordinate.longitude)
            AppConstants.driverselectaddressLat = String(location.coordinate.latitude)
            
          
            
             self.getBearing(toPoint: location.coordinate)
            
//             if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
//
//
//                SocketManagerClass.sharedInstance.EmitCode(Latitude: AppConstants.driverselectaddressLat, Longitude: AppConstants.drivertselectaddressLng, DriverId: UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DRIVER_ID), Bearning: String(AppConstants.radiansBearing), Accuracy: "10",LiveStatus: UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.ONLINE_OFFLINE))
//
//
//            }
//
            
//            if AppConstants.trackingscreenvalue == "1"{
//
//
//
//                if AppConstants.finddistancelat == ""{
//
//                    AppConstants.finddistancelat = String(location.coordinate.latitude)
//                    AppConstants.finddistancelng = String(location.coordinate.longitude)
//
//                    self.trackingemit()
//                }
//
//
//
//
//                let coordinateTo = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//
//
//
//                let pickuplat = Double(AppConstants.finddistancelat)
//                let pickuplng = Double(AppConstants.finddistancelng)
//
//                let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
//
//                let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
//
//
//                print("hellodistance\(distanceInMeter)")
//
//
//
//
//                if distanceInMeter < 20 {
//
//                    print("fgdwhfjekrlv")
//
//
//                }else{
//
//
//                    AppConstants.finddistancelat = String(location.coordinate.latitude)
//                    AppConstants.finddistancelng = String(location.coordinate.longitude)
//
//
//                    self.trackingemit()
//
//                }
//            }
//
            
        }
        
    }
    
    
    
    func trackingemit(){
        
        
        var polylinevalue = ""
        
        var bookingeta = ""
        
        if (AppConstants.driverconfiguredata.data?.generalConfig?.polyline)!{
            
            polylinevalue = "1"
        }else{
            
            polylinevalue = ""
        }
        
        if (AppConstants.driverconfiguredata.data?.generalConfig?.bookingeta)!{
            
            bookingeta = "1"
        }else{
            
            bookingeta = ""
        }
        
        let distanceunit = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DISTANCE_UNIT)
        
        
        SocketManagerClass.sharedInstance.savedrivertrackinglatlng(Currentlat: AppConstants.Lat, Currentlng: AppConstants.Lng, Droplat: AppConstants.pickdroplat, Droplng: AppConstants.pickdroplng, BookingId: AppConstants.bookingid, DriverId: UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DRIVER_ID), Polyline: polylinevalue, GoogleKey: AppConstants.googlemapkey, Bearning: String(AppConstants.radiansBearing), Accuracy: "10",BookingStatus: String(AppConstants.statusofbooking),BookingEta: bookingeta,DistanceUnit: distanceunit)
        
        
        
        
        
        
        
    }
    
    
    func getBearing(toPoint point: CLLocationCoordinate2D) {
        
        
        func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
        func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
        
        let lat1 = degreesToRadians(Double(AppConstants.Lat)!)
        let lon1 = degreesToRadians(Double(AppConstants.Lng)!)
        
        
        
        let lat2 = degreesToRadians(point.latitude);
        let lon2 = degreesToRadians(point.longitude);
        
        print(point.latitude)
        
        let dLon = lon2 - lon1;
        
        let y = sin(dLon) * cos(lat2);
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
        
        let radiansBearing1 = atan2(y, x);
        
        
        radiansBearing = (radiansToDegrees(radiansBearing1))
        AppConstants.radiansBearing = (radiansToDegrees(radiansBearing1))
        
        // return radiansToDegrees(radiansBearing)
    }
    
    


}
