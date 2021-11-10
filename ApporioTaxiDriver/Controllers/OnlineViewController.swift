//
//  OnlineViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import GoogleMaps
import GooglePlaces
import CoreLocation
import MapKit

class POIItem: NSObject, GMUClusterItem{
    var position: CLLocationCoordinate2D
    var name: String!
    var tracking_number: String!
    
    init(position: CLLocationCoordinate2D, name: String, tracking_number: String) {
        self.position = position
        self.name = name
        self.tracking_number = tracking_number
    }
}

class CustomMarker: GMSMarker {

    var imgView: UIImageView!
    var bookingID: String!
    var markerAddress: String!
    var markerType: String!

    init(labelText:String, iconImage: UIImage) {
        super.init()

        let iconView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 50, height:50)))
        iconView.backgroundColor = .clear
        imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imgView.image = UIImage(named: "drop-marker-icon")
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 30, height: 20))
        label.text = labelText
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        imgView.image = iconImage
        imgView.addSubview(label)
        iconView.addSubview(imgView)
        self.iconView = iconView
    }
}

class OnlineViewController: BaseViewController,CLLocationManagerDelegate,GMSMapViewDelegate,GMUClusterManagerDelegate {
    var selectedCells:[Int] = []
    var selectedCellsvaluename:[String] = []
    var selectedCellsvalue:[String] = []
    var setvaluei = 0
    
    @IBOutlet weak var geofenceareaview: UIView!
    @IBOutlet weak var geofenceareatext: UILabel!
    @IBOutlet weak var Serviceselecthiddenview: UIView!
    @IBOutlet weak var Serviceselectinnerhiddenview: UIView!
    @IBOutlet weak var ServiceSelecttableview: UITableView!
    @IBOutlet weak var hiddenokbtnclick: UIButton!
    @IBOutlet weak var hiddencancelbtntext: UIButton!
    @IBOutlet weak var Serviceselectinnerhiddenheight: NSLayoutConstraint!
    var driverhomescreenmodeldata: DriverHomeScreenModel!
    var activeTripsData : [ActiveTripsRouteData] = []
    
    var heatmapdata: HeatMapModel!
    var serviceselecttablecount = 0
    var wayPoints = ""
    var selectvehiclevalue = 0
    var demologinvalue = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.DEMO_LOGIN) as! String
    
    let driverid =   UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DRIVER_ID)
    private var heatmap: GMUHeatmapTileLayer?
    var clusterManager: GMUClusterManager!
    var items: [GMUWeightedLatLng] = [Any]() as! [GMUWeightedLatLng]
    var markersInRoutes = [CustomMarker]()
    var markersNotInRoutes = [CustomMarker]()

    @IBOutlet weak var bottomtripsview: UIView!
    @IBOutlet weak var bottomearningview: UIView!
    @IBOutlet weak var bottomaccountview: UIView!
    @IBOutlet weak var bottomwalletview: UIView!
    @IBOutlet weak var bottomsettingview: UIView!
    @IBOutlet weak var autoAcceptView: UIView!
    @IBOutlet weak var autoAcceptWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var onOfflineWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var notificationWidthConstraint: NSLayoutConstraint!
    
    var activeTripBounds = GMSCoordinateBounds()
    var tablecount = 0
    var demandspotvalue = 0
    
    @IBOutlet weak var showpendingviewheight: NSLayoutConstraint!
    @IBOutlet weak var showpendingrideview: UIView!
    @IBOutlet weak var showpendingtableview: UITableView!
    
    var timerForToken:Timer!
    var Lat = ""
    var Lng = ""
    var checkmapmove = "0"
    var finddistancelat = ""
    var finddistancelng = ""
    var radiansBearing : Double = 0.0
    var checkonofflinevalue = 0
    var onoffstatus = ""
    var checkonoff = ""
    var vehicleid = ""
    var checkshowvalue = 0
    
    @IBOutlet weak var todayearningmainview: UIView!
    @IBOutlet weak var todaytripmainview: UIView!
    @IBOutlet weak var driverdetailsmainview: UIView!
    @IBOutlet weak var currentlocationimageview: UIImageView!
    @IBOutlet weak var currentlocview: UIView!
    @IBOutlet weak var settingsimageview: UIImageView!
    @IBOutlet weak var walletimageview: UIImageView!
    @IBOutlet weak var accountsimageview: UIImageView!
    @IBOutlet weak var earningsimafeview: UIImageView!
    @IBOutlet weak var tripsimageview: UIImageView!
    @IBOutlet weak var demandspotview: UIView!
    @IBOutlet weak var upcomingview: UIView!
    @IBOutlet weak var manualdispatchview: UIView!
    @IBOutlet weak var myswitch: UISwitch!
    @IBOutlet weak var mapview: GMSMapView!
    var path = GMSPath()
    var animationPath = GMSMutablePath()
    var bounds = GMSCoordinateBounds()

    var polyline = GMSPolyline()

    @IBOutlet weak var tripslbl: UILabel!
    @IBOutlet weak var earningslbl: UILabel!
    @IBOutlet weak var accountslbl: UILabel!
    @IBOutlet weak var walletlbl: UILabel!
    @IBOutlet weak var settingslbl: UILabel!
    @IBOutlet weak var notificationimageview: UIImageView!
    @IBOutlet weak var notificationlbl: UILabel!
    @IBOutlet weak var onofflinelbl: UILabel!
    @IBOutlet weak var livenowlbl: UILabel!
    @IBOutlet weak var drivercarimageview: UIImageView!
    @IBOutlet weak var carnamelbl: UILabel!
    @IBOutlet weak var carnolbl: UILabel!
    @IBOutlet weak var todaytripslbl: UILabel!
    @IBOutlet weak var todaytrip: UILabel!
    @IBOutlet weak var todayearninglbl: UILabel!
    @IBOutlet weak var todayearning: UILabel!
    @IBOutlet weak var manualdispatchtext: UIButton!
    @IBOutlet weak var notificationvalue: UILabel!
    @IBOutlet weak var demandspotbtntext: UIButton!
    @IBOutlet weak var upcomingbtntext: UIButton!
    @IBOutlet weak var currentlocimageview: UIImageView!
    @IBOutlet weak var expiredDocumentsView: UIView!
    @IBOutlet weak var expiredDocumentAlertLabel: UILabel!
    
    @IBOutlet weak var topNotificationView: UIView!
    @IBOutlet weak var topOnOfflineView: UIView!
    @IBOutlet weak var autoSwitch: UISwitch!
    @IBOutlet weak var autoSatusLabel: UILabel!
    var pickupLocations : [String] = []
    var dropLocations : [String] = []
    
    var autoStatus = ""
    var autoOnOffStatus = ""
    var onOfflineStatus = ""
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppConstants.player?.stop()
        geofenceareaview.layer.cornerRadius = geofenceareaview.frame.size.width/2
        geofenceareaview.clipsToBounds = true
        geofenceareaview.layer.masksToBounds = false
        geofenceareaview.layer.shadowRadius = 1.0
        geofenceareaview.layer.shadowOpacity = 0.5
        geofenceareaview.isHidden = true
        
        AppConstants.acceptrejectTimer.invalidate()
        AppConstants.helloWorldTimer.invalidate()
        AppConstants.trackingscreenvalue = ""
        
        Serviceselecthiddenview.isHidden = true
        selectedCells.removeAll()
        selectedCellsvaluename.removeAll()
        selectedCellsvalue.removeAll()
        
        self.expiredDocumentsView.isHidden = true
        AppConstants.screenfromaccept = ""
        AppConstants.viewcontrollerself = self
        
        if UserDefaultUtility.retrieveBoolForKey(AppConstants.UserDefaultKeys.Taxi_Company)
        {
            bottomearningview.isHidden = true
            bottomwalletview.isHidden = true
        }
        else
        {
            bottomearningview.isHidden = false
            if (AppConstants.driverconfiguredata.data?.navigationDrawer?.wallet)!
            {
                bottomwalletview.isHidden = false
            }
            else
            {
                bottomwalletview.isHidden = true
            }
        }
        
        hiddencancelbtntext.setTitle("Cancel".localized, for: .normal)
        hiddenokbtnclick.setTitle("Ok".localized, for: .normal)
        tripslbl.text = "Trips".localized
        earningslbl.text = "Earnings".localized
        accountslbl.text = "Accounts".localized
        walletlbl.text = "Wallet".localized
        settingslbl.text = "Settings".localized
        notificationlbl.text = "Notifications".localized
        livenowlbl.text = "Live Now".localized
        todaytripslbl.text = "Today Trips".localized
        todayearninglbl.text = "Today Earnings".localized
        notificationvalue.text = "0".localized
        manualdispatchtext.setTitle("Manual Dispatch".localized, for: .normal)
      //  demandspotbtntext.setTitle("Demand Spot".localized, for: .normal)
        upcomingbtntext.setTitle("Upcoming".localized, for: .normal)
        
        //AUTO ACCEPT VIEW VISIBILITY
        //===========================
        if AppConstants.driverconfiguredata.data?.generalConfig?.autoAcceptRide == true
        {
            self.autoAcceptView.isHidden = false
            self.autoAcceptWidthConstraint.constant = 100.0
            
            autoStatus = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.AUTO_ACCEPT_VALUE)
           
            
            if autoStatus == "1"{
                AppConstants.autoAcceptStatus = "1"
                autoSwitch.setOn(true, animated: true)
                self.autoSatusLabel.text = "Auto On".localized
                self.autoSatusLabel.textColor = UIColor.green
                autoOnOffStatus = "2"
            }
            else if autoStatus == "2" || autoStatus == ""
            {
                AppConstants.autoAcceptStatus = ""
                autoSwitch.setOn(false, animated: true)
                self.autoSatusLabel.text = "Auto Off".localized
                self.autoSatusLabel.textColor = UIColor.red
                autoOnOffStatus = "1"
            }
        }
        else
        {
            self.autoAcceptView.isHidden = true
            self.autoAcceptWidthConstraint.constant = 0.0
        }
        
        //MANUAL DISPATCH VISIBILITY
        //==========================
        if (AppConstants.driverconfiguredata.data?.generalConfig?.manualDispatch)!{
            manualdispatchview.isHidden = false
            
        }else{
            manualdispatchview.isHidden = true
        }
        
        if (AppConstants.driverconfiguredata.data?.generalConfig?.demandspotenable)!{
//            demandspotview.isHidden = false
            
        }else{
//            demandspotview.isHidden = true
        }
        showpendingrideview.isHidden = true
        todaytripmainview.edgeWithShadow(edge: 0.0)
        todayearningmainview.edgeWithShadow(edge: 0.0)
        driverdetailsmainview.edgeWithShadow(edge: 0.0)
        
        currentlocview.edgeWithShadow(edge: 4.0)
        
//        demandspotview.edgeWithOutShadow(edge: 17.0)
        upcomingview.edgeWithOutShadow(edge: 17.0)
        manualdispatchview.edgeWithOutShadow(edge: 17.0)
        
        todaytripslbl.textColor = UIColor.appTextMidLightColor()
        todayearninglbl.textColor = UIColor.appTextMidLightColor()
        
        tripsimageview.image = tripsimageview.image!.withRenderingMode(.alwaysTemplate)
        tripsimageview.tintColor = UIColor.appTextMidLightColor()
        
        earningsimafeview.image = earningsimafeview.image!.withRenderingMode(.alwaysTemplate)
        earningsimafeview.tintColor = UIColor.appTextMidLightColor()
        
        accountsimageview.image = accountsimageview.image!.withRenderingMode(.alwaysTemplate)
        accountsimageview.tintColor = UIColor.appTextMidLightColor()
        
        walletimageview.image = walletimageview.image!.withRenderingMode(.alwaysTemplate)
        walletimageview.tintColor = UIColor.appTextMidLightColor()
        
        settingsimageview.image = settingsimageview.image!.withRenderingMode(.alwaysTemplate)
        settingsimageview.tintColor = UIColor.appTextMidLightColor()
        
        currentlocationimageview.image = currentlocationimageview.image!.withRenderingMode(.alwaysTemplate)
        currentlocationimageview.tintColor = UIColor.appTextMidLightColor()
        
        self.checkonofflinevalue = 0
        
        onOfflineStatus = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
      
        if onOfflineStatus == "1"{
            AppConstants.checkvaluedriverpressonoffbtn = 1
            myswitch.setOn(true, animated: true)
            self.onofflinelbl.text = "Online".localized
            self.onofflinelbl.textColor = UIColor.green
            onoffstatus = "2"
        }else{
            AppConstants.checkvaluedriverpressonoffbtn = 0
            myswitch.setOn(false, animated: true)
            self.onofflinelbl.text = "Offline".localized
            self.onofflinelbl.textColor = UIColor.red
            onoffstatus = "1"
        }
        
        onOfflineWidthConstraint.constant = 0.0
        topOnOfflineView.isHidden = true
        
        
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
//        AppConstants.calculatedAccuracy = self.locationManager.desiredAccuracy
//        self.locationManager.pausesLocationUpdatesAutomatically = false
//        //  self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.requestAlwaysAuthorization()
//        if #available(iOS 9.0, *) {
//            locationManager.allowsBackgroundLocationUpdates = true
//        } else {
//            // Fallback on earlier versions
//        }
        
      //  self.locationManager.startUpdatingLocation()

//        mapview.delegate = self
        mapview.isMyLocationEnabled = true
        self.mapview.clear()
        receiveActiveTripsData()
        self.mapview.delegate = self

       // mapview.animate(toZoom: 15)

        self.MainScrrenApi()
        
        let carImageTap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(vehicleImageTapped(_:)))
        self.drivercarimageview.addGestureRecognizer(carImageTap)
        self.drivercarimageview.isUserInteractionEnabled = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @objc func vehicleImageTapped(_ sender: UITapGestureRecognizer)
    {
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        AppConstants.comefromonlinecartap = "cartap"
        self.presentVC("vehicleList")
    }
    
    @IBAction func notificationbtnclick(_ sender: Any) {
        self.presentVC("NotificationViewController")
    }
    
    @IBAction func btnScanCodeTapped(_ sender: Any) {
        self.presentVC("QRCodeController")
    }
    
    @IBAction func geofencebtnclick(_ sender: Any) {
        
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        
        let geofencevalue = UserDefaultUtility.retrievObjectWithKey("Geofence") as! String
        
        var value = "1"
        
        if geofencevalue == "1"{
            value  = "2"
        }else{
            value  = "1"
        }
        let dic1 = ["latitude": AppConstants.Lat,
                    "longitude": AppConstants.Lng,
                    "type": value
            
            ] as [String : AnyObject]
        
        //  self!.showLoaderWithoutBackground()
                
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.GeofenceQueue
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: GeoFenceModel.self)
    }
    
    func MainScrrenApi(){
        
        vehicleid =  UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID) as! String
        showLoaderWithoutBackground()
        
        var dic1 = [:] as [String : AnyObject]
        if vehicleid == "0"{
            dic1 = [:] as [String : AnyObject]
        }else{
            dic1 = ["vehicle_id": vehicleid
                ] as [String : AnyObject]
        }
        
         if UserDefaultUtility.retrieveBoolForKey(AppConstants.UserDefaultKeys.FIREBASE_ONESIGNAL_CHECK){
            
            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
            
            dic1["device"] = "2" as AnyObject
            
        }else{
            
            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID) as AnyObject
            
            dic1["device"] = "2" as AnyObject
        }
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.HOMESCREEN
        ServiceManager.sharedInstance.delegate = self
        
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverHomeScreenModel.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vehicleid =  UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID) as! String
        
        if AppConstants.isOrderListOnMapRouteNil == true{
            self.mapview.clear()
            let camera = GMSCameraPosition.camera(withLatitude: Double(AppConstants.Lat)!, longitude: Double(AppConstants.Lng)!, zoom: 16);
            self.mapview.camera = camera
        }

        showpendingrideview.isHidden = true
        
        AppConstants.screenfromaccept = ""
        AppConstants.finddistancelat = ""
        AppConstants.finddistancelng = ""
        
        if AppConstants.comefromonlinecartapvalue == 1{
            AppConstants.comefromonlinecartapvalue = 0
            
            if (AppConstants.driverconfiguredata.data?.generalConfig?.servicetypeselection)!
            {
        
                if onOfflineStatus == "2"
                {
                    self.MainScrrenApi()
                    selectvehiclevalue = 1
                }
                else
                {
                    let dic1 = ["status": onoffstatus,
                                "vehicle_id": vehicleid
                        ] as [String : AnyObject]
    
                    showLoaderWithoutBackground()
    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
                        }
                    }
            else
            {
                let dic1 = ["status": onoffstatus,
                    "vehicle_id": vehicleid
                    ] as [String : AnyObject]
        
                showLoaderWithoutBackground()
        
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
                }
        }
        else
        {
             AppConstants.comefromonlinecartapvalue = 0
        }
        createTimer()
        
        if AppConstants.checkfromvehicleactivate == 1 || AppConstants.checkfromsetting == "1"{
          self.MainScrrenApi()
        }
        else
        {
            
        }
    }
    
    func createTimer(){
    
    AppConstants.timer = DispatchSource.makeTimerSource(queue: .main)
    AppConstants.timer?.schedule(deadline: .now(), repeating: .seconds(5))
    
    AppConstants.timer?.setEventHandler(handler: { [weak self] in      // assuming you're referencing `self` in here, use
//        let dateFormatter : DateFormatter = DateFormatter()
//        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
//        let date = Date()
//        let dateString = dateFormatter.string(from: date)
//       // let interval = date.timeIntervalSince1970
//
//
//        self!.setvaluei = self!.setvaluei + 1
//
//
//        SocketManagerClass.sharedInstance.testingcall(Value: ("HelloManiIOS" + String(self!.setvaluei)), Counter: String(self!.setvaluei), senttime: dateString)
                
      //  SocketManagerClass.sharedInstance.EmitCode(Latitude: AppConstants.driverselectaddressLat, Longitude: AppConstants.drivertselectaddressLng, DriverId: self!.driverid, Bearning: String(AppConstants.radiansBearing), Accuracy: "10")
        
      //  SocketManagerClass.sharedInstance.savedrivertrackinglatlng()
    
    
        let dic1 = ["latitude": AppConstants.Lat,
                    "longitude": AppConstants.Lng,
                    "bearing": AppConstants.radiansBearing,
                    "accuracy": LocationManagerClass.sharedInstance.locationManager.desiredAccuracy
            ] as [String : AnyObject]

      //  self!.showLoaderWithoutBackground()

        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERLOCATION
        ServiceManager.sharedInstance.locationdelegate = self

        ServiceManager.sharedInstance.requestPostWithParameterLocationtimer(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverLocationModel.self)
    })
    AppConstants.timer?.resume()
    // note, timer is not yet started; you have to call `timer?.resume()`
    }
    
    func startTimer() {
        // timer?.resume()
        createTimer()
    }
    
    func stopTimer() {
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Tapped at location: (\(coordinate.latitude), \(coordinate.longitude))")
    }
    
    // MARK: Private
    func generateHeatmapItems() {
        let extent: Double = 0.2
        
//        var items: [GMUWeightedLatLng] = [Int(heatmapdata.details?.count)!]
//
//        var items: [GMUWeightedLatLng] = [Any]() as! [GMUWeightedLatLng]
        
        items.removeAll()
        
        var bounds = GMSCoordinateBounds()
        
        for index in 0..<Int((heatmapdata.data?.count)!) {
            let lat: Double = Double(heatmapdata.data![index].pickupLatitude!)! + extent * randomScale()
                        
            let lng: Double = Double(heatmapdata.data![index].pickupLongitude!)! + extent * randomScale()
            
//            let item = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat, lng), intensity: 1.0)
            bounds = bounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))
            // items[index] = item
//            items.append(item)
        }
        
        
        heatmap?.weightedData = items
        let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 50, left: 60, bottom: 50, right: 60))
        mapview.animate(with: update)
        heatmap?.map = mapview
    }
    
    // Returns a random value between -1.0 and 1.0.
    /* func randomScale() -> Double {
     
     
     return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
     }*/
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
                                                 zoom: mapview.camera.zoom + 1)
        let update = GMSCameraUpdate.setCamera(newCamera)
        mapview.moveCamera(update)
        return false
    }
    
    // MARK: - GMUMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let poiItem = marker.userData as? POIItem {
            NSLog("Did tap marker for cluster item \(String(describing: poiItem.name))")
        }
        else if let marker = marker as? CustomMarker{
            
            if marker.markerType == "pickup"
            {
                let pickupAddress = marker.markerAddress
                AppConstants.tripsByPickupAddress.removeAll()
                for index in 0...activeTripsData.count-1
                {
                    if pickupAddress == activeTripsData[index].pickup_location!
                    {
                        AppConstants.tripsByPickupAddress.append(activeTripsData[index])
                    }
                }
                self.presentVC("BookingsForPickupMarkerVC")
            }
            else
            {
                AppConstants.bookingid = marker.bookingID!
                AppConstants.IsOrderMultiPickup = true
                self.presentVC("FullTripDetailsViewController")
            }
        }
        else {
            NSLog("Did tap a normal marker")
        }
        return false
    }
    
    // MARK: - Private
    
    /// Randomly generates cluster items within some extent of the camera and adds them to the
    /// cluster manager.
    private func generateClusterItems() {
        let extent = 0.2
        
        var bounds = GMSCoordinateBounds()
        
        //  var item = POIItem(position: <#CLLocationCoordinate2D#>, name: <#String#>)
        
        for index in 1..<Int((heatmapdata.data?.count)!) {
            let lat = Double(heatmapdata.data![index].pickupLatitude!)! + extent * randomScale()
            let lng = Double(heatmapdata.data![index].pickupLongitude!)! + extent * randomScale()
            let name = "Item \(index)"
            let item = POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name, tracking_number: "")
            bounds = bounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))
            clusterManager.add(item)
        }
        
        let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 50, left: 60, bottom: 50, right: 60))
        mapview.animate(with: update)
        
        clusterManager.cluster()
        clusterManager.setDelegate(self, mapDelegate: self)
    }
    
    /// Returns a random value between -1.0 and 1.0.
    private func randomScale() -> Double {
        return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
    }

    @IBAction func expiredDocumentBtnTapped(_ sender: Any)
    {
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let expiredController = storyBoard.instantiateViewController(withIdentifier: "ExpiredDocumentsViewController") as! ExpiredDocumentsViewController
        self.present(expiredController, animated: true, completion: nil)
    }
    
    @IBAction func showpendingridebtnclick(_ sender: Any) {
        
        if tablecount == 0{
            
            showpendingrideview.isHidden = true
        }else{
        
        showpendingtableview.reloadData()
        if checkshowvalue == 0{
            checkshowvalue = 1
            showpendingrideview.isHidden = false
        }else{
            checkshowvalue = 0
            showpendingrideview.isHidden = true
        }
        }
    }
    
    func receiveActiveTripsData() {
        
        let dic1 = [:] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.CURRENTROUTETRIPS
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ActiveTripsRouteModel.self)
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//
//            print(location.coordinate)
//           // reverseGeocodeCoordinate(location.coordinate)
//
//
//            Lat = String(location.coordinate.latitude)
//            Lng = String(location.coordinate.longitude)
//
//            finddistancelat = String(location.coordinate.latitude)
//
//            finddistancelng = String(location.coordinate.longitude)
//
//
//            AppConstants.drivertselectaddressLng = String(location.coordinate.longitude)
//            AppConstants.driverselectaddressLat = String(location.coordinate.latitude)
//
//            SocketManagerClass.sharedInstance.EmitCode(Latitude: AppConstants.driverselectaddressLat, Longitude: AppConstants.drivertselectaddressLng, DriverId: UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DRIVER_ID), Bearning: String(AppConstants.radiansBearing), Accuracy: "10")
//
//
//
//            if self.checkmapmove == "1"{
//
//            }else{
//                let userLocation = locations.last
//                let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude, zoom: 16);
//                self.mapview.camera = camera
////                mapview.animate(toLocation: CLLocationCoordinate2DMake(Double(Lat)!, Double(Lng)!))
////                mapview.animate(toZoom: 15)
//            }
//
//        }
//
//    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        self.checkmapmove = "1"
    }
    
    func getBearing(toPoint point: CLLocationCoordinate2D) {
        
        func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
        func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
        
        let lat1 = degreesToRadians(Double(Lat)!)
        let lon1 = degreesToRadians(Double(Lng)!)
        
   
        let lat2 = degreesToRadians(point.latitude);
        let lon2 = degreesToRadians(point.longitude);
       
        let dLon = lon2 - lon1;
        
        let y = sin(dLon) * cos(lat2);
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
        
        let radiansBearing1 = atan2(y, x);
        
        radiansBearing = (radiansToDegrees(radiansBearing1))
        AppConstants.radiansBearing = (radiansToDegrees(radiansBearing1))
        
        // return radiansToDegrees(radiansBearing)
    }
    
    
    
//    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
//
//        // 1
//
//        let geocoder = GMSGeocoder()
//
//        // 2
//        print(coordinate)
//        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
//
//            if let address = response?.firstResult() {
//
//                   self.getBearing(toPoint: coordinate)
//                //print(address.lines)
//
//                let lines = address.lines
//                AppConstants.Location = lines!.joined(separator: "\n")
//                if let city = address.locality{
//
//                    AppConstants.drivercityname = String(city)
//                    print(AppConstants.drivercityname)
//                }
//                else{
//                    AppConstants.drivercityname = "Dummy City"
//
//                }
//
//                AppConstants.drivertselectaddressLng = String(coordinate.longitude)
//                AppConstants.driverselectaddressLat = String(coordinate.latitude)
//
//                SocketManagerClass.sharedInstance.EmitCode(Latitude: AppConstants.driverselectaddressLat, Longitude: AppConstants.drivertselectaddressLng, DriverId: self.driverid, Bearning: String(AppConstants.radiansBearing), Accuracy: "10")
//
//                print(AppConstants.driverselectaddressLat)
//                print(AppConstants.drivertselectaddressLng)
//            }
//        }
//    }

    @IBAction func Swichtapped(_ sender: Any) {
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        
                
        if onOfflineStatus == "1"{
            AppConstants.checkvaluedriverpressonoffbtn = 1
            myswitch.setOn(true, animated: true)
//            self.onofflinelbl.text = "Online".localized
//            self.onofflinelbl.textColor = UIColor.green
//            onoffstatus = "2"
        }else{
            AppConstants.checkvaluedriverpressonoffbtn = 0
            myswitch.setOn(false, animated: true)
//            self.onofflinelbl.text = "Offline".localized
//            self.onofflinelbl.textColor = UIColor.red
//            onoffstatus = "1"
        }
        
        if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
            
            if demologinvalue == "1"{
                
                if (AppConstants.driverconfiguredata.data?.generalConfig?.servicetypeselection)!{
                    
                    if onOfflineStatus == "2"{
                        
                        Serviceselecthiddenview.isHidden = false
                        Serviceselectinnerhiddenview.edgeWithShadow(edge: 4)
                        ServiceSelecttableview.reloadData()
                        
                    }else{
                        
                        let dic1 = ["status": onoffstatus,
                                    "vehicle_id": self.vehicleid
                            
                            ] as [String : AnyObject]
                        
                        showLoaderWithoutBackground()
                        
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
                        ServiceManager.sharedInstance.delegate = self
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
                    }
                }else{
                    
                    let dic1 = ["status": onoffstatus,
                                "vehicle_id": self.vehicleid
                        ] as [String : AnyObject]
                    
                    showLoaderWithoutBackground()
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
                }
            }else{
        
        if onOfflineStatus == "2"{

            AppConstants.comefromonlinecartap = "onlineoffline"
            self.presentVC("vehicleList")
            
        }else{
            
            if vehicleid == "0"{
                
                vehicleid = ("" as AnyObject) as! String
                
            }else{
               
            }
            let dic1 = ["status": onoffstatus,
                "vehicle_id": vehicleid
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
            }
        }
            
        }else{
        
        if (AppConstants.driverconfiguredata.data?.generalConfig?.servicetypeselection)!{

            if onOfflineStatus == "2"{

                Serviceselecthiddenview.isHidden = false
                Serviceselectinnerhiddenview.edgeWithShadow(edge: 4)
                ServiceSelecttableview.reloadData()

            }else{

                let dic1 = ["status": onoffstatus,
                            "vehicle_id": self.vehicleid
                    
                    ] as [String : AnyObject]

                showLoaderWithoutBackground()
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
            }
        }else{

        let dic1 = ["status": onoffstatus,
            "vehicle_id": self.vehicleid
            ] as [String : AnyObject]

        showLoaderWithoutBackground()

        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
        ServiceManager.sharedInstance.delegate = self
      

        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
        }
        }
    }
    
    
    @IBAction func hiddencancelbtnclick(_ sender: Any) {
        
        Serviceselecthiddenview.isHidden = true
        if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
            
            if demologinvalue == "1"{
                
            }else{
                                
                livenowlbl.text = "NO Vehicle Activated".localized
                
                carnamelbl.text = ""
                
                carnolbl.text = ""
                
                drivercarimageview.image = UIImage(named: "mandy")
                
                UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                
            }
            
        }else{
            
            
        }
        
        self.MainScrrenApi()
        
    }
    @IBAction func hiddenokbtnclick(_ sender: Any) {
        
        
        
//        selectedCells.removeAll()
//        selectedCellsvaluename.removeAll()
//        selectedCellsvalue.removeAll()
        
        if selectedCellsvalue.count == 0{
            
            self.showErrorAlert("Alert".localized, alertMessage: "Please Select Service First", VC: self)
        }else{
            
            
            let dic1 = ["status": onoffstatus,
                        "vehicle_id": vehicleid,
             "service_type":selectedCellsvalue.joined(separator: ",")
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
                        
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERONOFLINE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOnOffModel.self)
            
        }
    }
    
    
    @IBAction func autoSwitchTapped(_ sender: Any)
    {
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        
        let dic1 = ["status": autoOnOffStatus
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
                
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.AUTOACCEPTMODE
        ServiceManager.sharedInstance.delegate = self
 
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: AutoStatusModel.self)
    }
    
    @IBAction func tripsbtn_click(_ sender: Any) {
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        
        self.presentVC("AllYourTripsViewViewController")
    }
    @IBAction func earningsbtn_click(_ sender: Any) {
        //NewEarningScreenViewController
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        
        self.presentVC("NewEarningScreenViewController")
    }
    @IBAction func accountsbtn_click(_ sender: Any) {
        
       AppConstants.timer?.cancel()
        AppConstants.timer = nil
       // self.presentVC("SubscriptionDetailsViewController")
        self.presentVC("ProfileViewController")
    }
    @IBAction func walletbtn_click(_ sender: Any) {
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
    //    self.presentVC("SubscriptionListViewController")
        self.presentVC("WalletViewController")
        
    }
    @IBAction func settingsbtn_click(_ sender: Any) {
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
//
        self.presentVC("SettingsViewController")
    }
    
    
    @IBAction func manualdispatchbtn_click(_ sender: Any) {
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        
        if onOfflineStatus == "1"{
        
        self.presentVC("ManualUserDetailsViewController")
        }else{
            
            self.showErrorAlert("", alertMessage: "Please go online first.".localized, VC: self)
            
        }
        
    }
    @IBAction func demandspotbtn_click(_ sender: Any) {
        
        if demandspotvalue == 1{
            demandspotvalue = 0
            clusterManager.clearItems()
            
           mapview.clear()
            
          //  self.locationManager.startUpdatingLocation()
            
            mapview.animate(toLocation: CLLocationCoordinate2DMake(Double(AppConstants.Lat)!, Double(AppConstants.Lng)!))
            mapview.animate(toZoom: 16)
            
        }else{
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        
        showLoaderWithoutBackground()
        
        let dic1 = [:] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DEMANDSPOT
        ServiceManager.sharedInstance.delegate = self
        
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: HeatMapModel.self)
        }
    }
    
    @IBAction func upcomingbtn_click(_ sender: Any) {
        
//        AppConstants.timer?.cancel()
//        AppConstants.timer = nil
        
        self.presentVC("AllUpcomingTripsViewController")
    }
    
    @IBAction func currentlocbtn_click(_ sender: Any) {
        
        //items.removeAll()
        
        if demandspotvalue == 1{
            demandspotvalue = 0
             clusterManager.clearItems()
//            mapview.clear()
            
            self.locationManager.startUpdatingLocation()
            
            mapview.animate(toLocation: CLLocationCoordinate2DMake(Double(AppConstants.Lat)!, Double(AppConstants.Lng)!))
            mapview.animate(toZoom: 16)
            
        }else{
//            mapview.clear()
            
            self.locationManager.startUpdatingLocation()
            
            mapview.animate(toLocation: CLLocationCoordinate2DMake(Double(AppConstants.Lat)!, Double(AppConstants.Lng)!))
            mapview.animate(toZoom: 16)
        }
    }
        
    func callMapLoadAPI(){
        //this API will return the sorted locations to create a final route.
        
        let dic1 = ["start_point": AppConstants.Lat + "," + AppConstants.Lng,
                    "final_point": AppConstants.Lat + "," + AppConstants.Lng,
                    "way_point": wayPoints

            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.MapLoadURL
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DirectionModel.self)
    }
    
    func jaroDistance(_ s1: String, _ s2: String) -> Double {
        // If the strings are equal
        //if s1 == s2 {
        //    return 1.0
        //}
        
        // Length of two strings
        let len1 = s1.count,
            len2 = s2.count
        //
        if len1 == 0 || len2 == 0 {
            return 0.0
        }
        
        // Maximum distance upto which matching
        // is allowed
        let maxDist = max(len1, len2) / 2 - 1
        
        // Count of matches
        var match = 0
        
        // Hash for matches
        var hashS1: [Int] = Array(repeating: 0, count: s1.count)
        var hashS2: [Int] = Array(repeating: 0, count: s2.count)
        
        let s2Array = Array(s2)
        // Traverse through the first string
        for (i, ch1) in s1.enumerated() {
            
            // Check if there is any matches
            if max(0, i - maxDist) > min(len2 - 1, i + maxDist) {
                continue
            }
            for j in max(0, i - maxDist)...min(len2 - 1, i + maxDist) {
                
                // If there is a match
                if ch1 == s2Array[j] &&
                    hashS2[j] == 0 {
                    hashS1[i] = 1
                    hashS2[j] = 1
                    match += 1
                    break
                }
            }
        }
        
        // If there is no match
        if match == 0 {
            return 0.0
        }
        
        // Number of transpositions
        var t: Double = 0
        
        var point = 0
        
        // Count number of occurances
        // where two characters match but
        // there is a third matched character
        // in between the indices
        for (i, ch1) in s1.enumerated() {
            if hashS1[i] == 1 {
                
                // Find the next matched character
                // in second string
                while hashS2[point] == 0 {
                    point += 1
                }
                
                if ch1 != s2Array[point] {
                    t += 1
                }
                point += 1
            }
        }
        t /= 2
        print(s1.count, s2.count, match, t)
        
        // Return the Jaro Similarity
        return (Double(match) / Double(len1)
                    + Double(match) / Double(len2)
                    + (Double(match) - t) / Double(match))
            / 3.0
    }
}

extension OnlineViewController: DriverLocationUpdate {
    
    func onSuccessLocation<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverLocationModel{
            let data:DriverLocationModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
            
            }else if (data.result == "2"){
                
                hideLoaderWithoutBackground()
                
                if AppConstants.screenfromaccept == ""{
                    
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.mutiplestops.removeAll()
                    AppConstants.multipleVisable = data.data?.multipleVisable ?? false
                    
                    let tablecount = data.data?.multipleStopList?.count ?? 0
                    
                    if tablecount == 0{
                        
                    }else{
                        
                        for i in 0...tablecount - 1{
                            
                            AppConstants.mutiplestops.append((data.data?.multipleStopList![i].dropLocation)!)
                        }
                    }
                    
                    AppConstants.productDetailsData = data.data?.productDetails
                    AppConstants.productImages = data.data?.productImages
                    AppConstants.receiverDetails = data.data?.receiverDetails
                    
                    AppConstants.bookingid = String((data.data?.bookingId)!)
                   
                    AppConstants.servicetypeid = String((data.data?.serviceTypeId ?? -1))
                    AppConstants.vehiclename = (data.data?.vehicle!)!
                    AppConstants.service = (data.data?.service!)!
                    AppConstants.estimatedistance = data.data?.estimateDistance ?? ""
                    
                    AppConstants.estimateFare = data.data?.estimateBill ?? "0.0"
                    AppConstants.additionalNotes = (data.data?.additionalNotes!)!
                    AppConstants.dropLocation = (data.data?.dropLocation!)!
                    AppConstants.estimatetime = (data.data?.estimateTime!)!
                    AppConstants.paymentmethod = (data.data?.paymentMethod!)!
                    AppConstants.timestamp = String((data.data?.timestamp)!)
                    AppConstants.packagename = (data.data?.packageName!)!
                    AppConstants.pickuplocation = (data.data?.pickupLocation!)!
                    AppConstants.userphone = (data.data?.phone!)!
                    AppConstants.username = (data.data?.username!)!
                    AppConstants.driverrequesttimeout = String((data.data?.driverRequestTimeout!)!)
                    AppConstants.useremail = (data.data?.email!)!
                    AppConstants.vehicleimage = (data.data?.vehicleimage!)!
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptRideViewController") as! AcceptRideViewController
                    self.present(AcceptViewController, animated:true, completion:nil)
                    
                }else{
                    
                }
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                // showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
    }
    
    func onErrorLocation(_ errorResponse: String, errorObject: AnyObject?) {
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
    
    func onTimeOutErrorLocation(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
}


extension GMSMutablePath {

    func appendPath(path : GMSPath?) {
        if let path = path {
            for i in 0..<path.count() {
                self.add(path.coordinate(at: i))
            }
        }
    }
}

extension OnlineViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? GeoFenceModel{
            let data:GeoFenceModel = responseData
            
            if (data.result == "1") {
                
                self.createTimer()
                
                geofenceareaview.backgroundColor = PListUtility.getColorFromHex(hexString: (data.geofenceQueueColor ?? "#008000")!)
                geofenceareatext.text = (data.geofenceQueueText ?? "Geofence Area ON")
                
                UserDefaultUtility.saveStringWithKey(data.type!, key: "Geofence")
                self.showErrorAlert("", alertMessage: data.message ?? "", VC: self)
                
            }else{
                
                self.createTimer()
                geofenceareaview.backgroundColor = PListUtility.getColorFromHex(hexString: (data.geofenceQueueColor ?? "#FF0000")!)
                geofenceareatext.text = (data.geofenceQueueText ?? "Geofence Area OFF")
                self.showErrorAlert("", alertMessage: data.message ?? "", VC: self)
            }
        }
        
        if let responseData = response as? ActiveTripsRouteModel
        {
            let data:ActiveTripsRouteModel = responseData
            activeTripsData = data.data!
            
            wayPoints.removeAll()
            markersInRoutes.removeAll()
            markersNotInRoutes.removeAll()
            pickupLocations.removeAll()
            dropLocations.removeAll()
            
            activeTripBounds = GMSCoordinateBounds()
            activeTripBounds = activeTripBounds.includingCoordinate(CLLocationCoordinate2DMake(Double(AppConstants.Lat)!, Double(AppConstants.Lng)!))
            if activeTripsData.count > 0
            {
                AppConstants.isOrderListOnMapRouteNil = false
                for index in 0...activeTripsData.count-1
                {
                    //corporate_booking_status == 0 means order is not picked up, 1 means picked up.
                    if activeTripsData[index].corporate_booking_status == 0
                    {
                        if !pickupLocations.contains(activeTripsData[index].pickup_location!)
                        {
                            pickupLocations.append(activeTripsData[index].pickup_location!)
                            let lat: Double = Double(activeTripsData[index].pickup_latitude!) ?? 0.0
                            let lng: Double = Double(activeTripsData[index].pickup_longitude!) ?? 0.0
                            wayPoints += "\(lat),\(lng)|"
                            activeTripBounds = activeTripBounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))

                            let originMarker = CustomMarker(labelText: "\(index+1)", iconImage: UIImage(named:"pickup-marker-icon")!)
                            originMarker.markerAddress = activeTripsData[index].pickup_location!
                            originMarker.position = CLLocationCoordinate2D(latitude: lat, longitude:lng)
                            originMarker.bookingID = String("\(activeTripsData[index].booking_id!)")
                            originMarker.markerType = "pickup"
                            markersInRoutes.append(originMarker)
                        }
                        
                        if !dropLocations.contains(activeTripsData[index].drop_location!)
                        {
                            //markers of drop location with status "not picked" will be added to seperate array than route array.
                            dropLocations.append(activeTripsData[index].drop_location!)
                            let lat: Double = Double(activeTripsData[index].drop_latitude!) ?? 0.0
                            let lng: Double = Double(activeTripsData[index].drop_longitude!) ?? 0.0
                            activeTripBounds = activeTripBounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))

                            let destMarker = CustomMarker(labelText: "", iconImage: UIImage(named:"drop-marker-icon")!)
                            destMarker.markerAddress = activeTripsData[index].drop_location!
                            destMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                            destMarker.bookingID = String("\(activeTripsData[index].booking_id!)")
                            destMarker.markerType = "drop"
                            markersNotInRoutes.append(destMarker)
                        }
                    }
                    else
                    {
                        if !dropLocations.contains(activeTripsData[index].drop_location!)
                        {
                            //markers of drop location with status "picked" will be added to draw route.
                            dropLocations.append(activeTripsData[index].drop_location!)
                            let lat: Double = Double(activeTripsData[index].drop_latitude!) ?? 0.0
                            let lng: Double = Double(activeTripsData[index].drop_longitude!) ?? 0.0
                            wayPoints += "\(lat),\(lng)|"

                            activeTripBounds = activeTripBounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))
                            
                            let destMarker = CustomMarker(labelText: "\(index+1)", iconImage: UIImage(named:"drop-marker-icon")!)
                            destMarker.markerAddress = activeTripsData[index].drop_location!
                            destMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                            destMarker.bookingID = String("\(activeTripsData[index].booking_id!)")
                            destMarker.markerType = "drop"
                            markersInRoutes.append(destMarker)
                        }
                    }
                }
            }
            callMapLoadAPI()
        }
        
        if let responseData = response as? DirectionModel
        {
            let data:DirectionModel = responseData
            var routesArray: [Routes] = []
            if let routes = data.routes{
                routesArray = routes
            }
            let routeDict = routesArray[0]
            let fullPath : GMSMutablePath = GMSMutablePath()
            if let legs = routeDict.legs {
                for leg in legs {
                    if let steps = leg.steps {
                        for step in steps {
                            if let polyline = step.polyline{
                                if let points = polyline.points {
                                    fullPath.appendPath(path: GMSMutablePath(fromEncodedPath: points))
                                }
                            }
                        }
                    }
                }
            }
            let legs = routeDict.legs!
            let markerArray : [CustomMarker] = markersInRoutes
            markersInRoutes.removeAll()
            
            if markerArray.count > 0
            {
                for i in 0...legs.count-1
                {
                    let leg = legs[i]
                    let endAddress = leg.endAddress!
                    
                    for index in 0...markerArray.count-1
                    {
                        let marker = markerArray[index]
                        let similarityIndex = jaroDistance(endAddress, marker.markerAddress!) //address string similarity count
                        if endAddress == marker.markerAddress! || similarityIndex > 0.75
                        {
                            let newMarker = CustomMarker(labelText: "\(i+1)", iconImage:marker.imgView.image!)
                            newMarker.markerAddress = marker.markerAddress
                            newMarker.markerType = marker.markerType
                            newMarker.bookingID = marker.bookingID
                            newMarker.position = marker.position
                            markersInRoutes.append(newMarker)
                        }
                    }
                }
                
                self.polyline.path = fullPath
                self.polyline.strokeColor = UIColor.black
                self.polyline.strokeWidth = 3.0
                self.polyline.map = self.mapview
                
                if markersInRoutes.count > 0
                {
                    for index in 1...markersInRoutes.count
                    {
                        let marker = self.markersInRoutes[index-1]
                        marker.map = self.mapview
                    }
                }
                if markersNotInRoutes.count>0
                {
                    for index in 1...markersNotInRoutes.count
                    {
                        let marker = self.markersNotInRoutes[index-1]
                        marker.map = self.mapview
                    }
                }
                
                let update = GMSCameraUpdate.fit(activeTripBounds, with: UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40))
                self.mapview.animate(with: update)
            }
          
            
//            let routeOverviewPolyline = routeDict.overviewPolyline
//            let points = routeOverviewPolyline?.points ?? "Not Found"
//            self.path = GMSPath.init(fromEncodedPath: points)!
//            self.polyline.path = path

           
            
            //display marker on map and zoom camera on trips
            
//            let extent: Double = 0.2
//            items.removeAll()
//
//            var bounds = GMSCoordinateBounds()
//            let iconGenerator = GMUDefaultClusterIconGenerator()
//            let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
//            let renderer = GMUDefaultClusterRenderer(mapView: mapview,
//                                                             clusterIconGenerator: iconGenerator)
//            clusterManager = GMUClusterManager(map: mapview, algorithm: algorithm,
//                                                       renderer: renderer)
//            clusterManager.setDelegate(self, mapDelegate: self)
//
//            for index in 0...legs.count-1 {
//
//                let leg = legs[index]
//                let lat: Double = Double((leg.startLocation?.lat!)!) + extent * randomScale()
//
//                let lng: Double = Double((leg.startLocation?.lng!)!) + extent * randomScale()
//
//                let name = "Item \(index)"
//                let item = POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name, tracking_number:"1")
//                bounds = bounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))
//
//
//                print("test 1")
//                clusterManager.add(item)
//                print("test 2")
//
//            }
//
//            let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 50, left: 60, bottom: 50, right: 60))
//            mapview.animate(with: update)
//
//            clusterManager.cluster()
//
            
            
         
        }
        
        if let responseData = response as? DriverHomeScreenModel{
            let data:DriverHomeScreenModel = responseData
            
            self.driverhomescreenmodeldata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                tablecount = (data.data?.activeRides!.count)!
                
                notificationvalue.text = String(tablecount)
                
                if (data.data?.geofenceQueueEnable)!{
                    
                    geofenceareaview.isHidden = false
                    
                    if (data.data?.geofenceQueueActive)!{
                        
                        geofenceareaview.backgroundColor = PListUtility.getColorFromHex(hexString: (data.data?.geofencequeuecolor ?? "#008000")!)
                        geofenceareatext.text = (data.data?.geofencequeuetext ?? "Geofence Area ON")
                        UserDefaultUtility.saveStringWithKey("1", key: "Geofence")
                        
                    }else{
                        
                        geofenceareaview.backgroundColor =  PListUtility.getColorFromHex(hexString: (data.data?.geofencequeuecolor ?? "#FF0000")!)
                        geofenceareatext.text = (data.data?.geofencequeuetext ?? "Geofence Area OFF")
                        UserDefaultUtility.saveStringWithKey("2", key: "Geofence")
                    }
                }
                else
                {
                    geofenceareaview.isHidden = true
                }
                self.todaytrip.text = String((data.data?.todays?.todaysRides ?? 0)!)
                self.todaytrip.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.todays?.todaysRidesColor)!))
                self.todayearning.text = data.data?.todays?.todaysEarning
                self.todaytrip.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.todays?.todaysEarningColor)!))
                
                if data.data?.activeVehicle?.vehicleType ?? "" == ""{
                    
                    livenowlbl.text = "NO Vehicle Activated".localized
                    
                    carnamelbl.text = ""
                    
                    carnolbl.text = ""
                    
                    drivercarimageview.image = UIImage(named: "mandy")
                    
                }else{
                    
                    livenowlbl.text = "Live Now".localized
                       let newString = data.data?.activeVehicle?.vehicleTypeImage
                    
                                    AppConstants.downloadimage(imagename: newString!, imageview: drivercarimageview, placeholderimage: "mandy")
                                    self.carnamelbl.text = data.data?.activeVehicle?.vehicleType
                                    self.carnolbl.text = data.data?.activeVehicle?.vehicleNumber
                }
            
//                self.notificationvalue.text = data.data?.activeRides.
                AppConstants.poolenablestatus = String((data.data?.rideConfig?.poolEnableStatus)!)
                AppConstants.poolenable = data.data?.rideConfig?.poolEnable
                AppConstants.autoupgradationstatus = (data.data?.rideConfig?.autoUpgradetionStatus ?? "0")!
                AppConstants.autoupgradation = String((data.data?.rideConfig?.autoUpgradetion)!)
                AppConstants.currencysymbol = data.data?.currency ?? "INR"
                if (AppConstants.driverconfiguredata.data?.generalConfig?.servicetypeselection)!{
                    
                    serviceselecttablecount = data.data?.availableservices?.count ?? 0
                }
                
                let termStatus = data.data?.termStatus
//                let termStatus = 1
                if termStatus == 1
                {
//                    AppConstants.timer?.cancel()
//                    AppConstants.timer = nil
//                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                    let termsController = storyBoard.instantiateViewController(withIdentifier: "ExpiredDocumentsViewController") as! ExpiredDocumentsViewController
//                    self.present(termsController, animated: true, completion: nil)
                    let alertController = UIAlertController(title: "Alert".localized, message:"Terms and conditions has been changed.".localized, preferredStyle: .alert)

                    let OKAction = UIAlertAction(title: "ok".localized, style: .default)
                    { (action) in
                        
                        AppConstants.timer?.cancel()
                        AppConstants.timer = nil
                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                        let termsController = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsViewController") as! TermsConditionsViewController
                        termsController.source = "NOTIFICATION"
                        self.present(termsController, animated: true, completion: nil)
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true)
                }
                
                if let count = data.data?.adminMessages?.count
                {
                    if count > 0
                    {
                        for i in 0...count - 1
                        {
                            if data.data?.adminMessages?[i].show == true
                            {
                                if data.data?.adminMessages?[i].action == "SUBSCRIPTION_BUY" || data.data?.adminMessages?[i].action == "SUBSCRIPTION_EXPIRE"
                                {
                                    AppConstants.timer?.cancel()
                                    AppConstants.timer = nil
                                    UserDefaultUtility.saveStringWithKey("2", key: AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
                                    myswitch.setOn(false, animated: true)
                                    self.onofflinelbl.text = "Offline".localized
                                    self.onofflinelbl.textColor = UIColor.red
                                    onoffstatus = "1"
                                    onOfflineStatus = "2"
                                    
                                    if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
                                        
                                        if demologinvalue == "1"{
                                            
                                        }else{
                                            
                                            livenowlbl.text = "NO Vehicle Activated".localized
                                            
                                            carnamelbl.text = ""
                                            
                                            carnolbl.text = ""
                                            
                                            drivercarimageview.image = UIImage(named: "mandy")
                                            
                                            UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                                            
                                        }
                                        
                                    }else{
                                        
                                    }

                                    break
                                }
                                if data.data?.adminMessages?[i].action == "VEHICLE_DOCUMENT_EXPIRE" || data.data?.adminMessages?[i].action == "PERSONAL_DOCUMENT_EXPIRE"
                                {
                                    AppConstants.timer?.cancel()
                                    AppConstants.timer = nil
                                    UserDefaultUtility.saveStringWithKey("2", key: AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
                                    myswitch.setOn(false, animated: true)
                                    self.onofflinelbl.text = "Offline".localized
                                    self.onofflinelbl.textColor = UIColor.red
                                    onoffstatus = "1"
                                    onOfflineStatus = "2"
                                    
                                    if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
                                        
                                        if demologinvalue == "1"{
                                            
                                        }else{
                                                                                        
                                            livenowlbl.text = "NO Vehicle Activated".localized
                                            
                                            carnamelbl.text = ""
                                            
                                            carnolbl.text = ""
                                            
                                            drivercarimageview.image = UIImage(named: "mandy")
                                            
                                            UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                                            
                                        }
                                        
                                    }else{
                                        
                                    }
                                    
                                    let alertController = UIAlertController(title: "Alert".localized, message: data.data?.adminMessages?[i].message ?? "Not Found", preferredStyle: .alert)
                                    let okAction = UIAlertAction(title: "OK".localized, style: .default) { (action) in
                                        self.presentVC("ExpiredDocumentsViewController")
                                    }
                                    alertController.addAction(okAction)
                                    self.present(alertController, animated: true)
                                    break
                                }
                                 if data.data?.adminMessages?[i].action == "DOCUMENT_STATUS"{
                                
                                    AppConstants.timer?.cancel()
                                    AppConstants.timer = nil
                                    UserDefaultUtility.saveStringWithKey("2", key: AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
                                    myswitch.setOn(false, animated: true)
                                    self.onofflinelbl.text = "Offline".localized
                                    self.onofflinelbl.textColor = UIColor.red
                                    onoffstatus = "1"
                                    onOfflineStatus = "2"
                                                                        
                                    if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
                                        
                                        if demologinvalue == "1"{
                                            
                                        }else{
                                                                                        
                                            livenowlbl.text = "NO Vehicle Activated".localized
                                            
                                            carnamelbl.text = ""
                                            
                                            carnolbl.text = ""
                                            
                                            drivercarimageview.image = UIImage(named: "mandy")
                                            
                                            UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                                            
                                        }
                                        
                                    }else{
                                        
                                        
                                    }
                                    
                                    let alertController = UIAlertController(title: "Alert".localized, message: data.data?.adminMessages?[i].message ?? "Not Found", preferredStyle: .alert)
                                    let okAction = UIAlertAction(title: "OK".localized, style: .default) { (action) in
                                        self.presentVC("ExpiredDocumentsViewController")
                                    }
                                    alertController.addAction(okAction)
                                    self.present(alertController, animated: true)
                                    break
                                
                                }
                                if data.data?.adminMessages?[i].action == "GENDER_UPDATE"{
                                    AppConstants.timer?.cancel()
                                    AppConstants.timer = nil
                                    
                                    
                                    let alertController = UIAlertController(title: "Alert".localized, message: data.data?.adminMessages?[i].message ?? "Not Found", preferredStyle: .alert)
                                    let okAction = UIAlertAction(title: "OK".localized, style: .default) { (action) in
                                        self.presentVC("ProfileViewController")
                                    }
                                    alertController.addAction(okAction)
                                    self.present(alertController, animated: true)
                                    
                                
                                break
                                }
                                if data.data?.adminMessages?[i].action == "WALLET_BALANCE"{
                                    AppConstants.timer?.cancel()
                                    AppConstants.timer = nil
                                    
                                    myswitch.setOn(false, animated: true)
                                    self.onofflinelbl.text = "Offline".localized
                                    self.onofflinelbl.textColor = UIColor.red
                                    onoffstatus = "1"
                                    onOfflineStatus = "2"
                                   
                                    if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
                                        
                                        if demologinvalue == "1"{
                                            
                                        }else{
                                           
                                            livenowlbl.text = "NO Vehicle Activated".localized
                                            
                                            carnamelbl.text = ""
                                            
                                            carnolbl.text = ""
                                            
                                            drivercarimageview.image = UIImage(named: "mandy")
                                            
                                            UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                                            
                                        }
                                        
                                    }else{
                                        
                                        
                                    }
                                    
                                    
                                    let alertController = UIAlertController(title: "Alert".localized, message: data.data?.adminMessages?[i].message ?? "Not Found", preferredStyle: .alert)
                                    let okAction = UIAlertAction(title: "OK".localized, style: .default) { (action) in
                                       
                                    }
                                    alertController.addAction(okAction)
                                    self.present(alertController, animated: true)
                                    
                                    break
                                }
                            }
                        }
                    }
                }
                
            if selectvehiclevalue == 1{
                selectvehiclevalue = 0
                Serviceselecthiddenview.isHidden = false
                Serviceselectinnerhiddenview.edgeWithShadow(edge: 4)
                ServiceSelecttableview.reloadData()
            }else{
                selectvehiclevalue = 0
                
            }
                
                
//            else if data.result == "0"
//            {
//                hideLoaderWithoutBackground()
//                let alertController = UIAlertController(title: "Alert".localized, message: data.message ?? "Not Found", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "OK".localized, style: .default) { (action) in
//                    
//                }
//                alertController.addAction(okAction)
//                self.present(alertController, animated: true)
//            }
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
            hideLoaderWithoutBackground()
          //  showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
        
        if let responseData = response as? DriverOnOffModel
        {
            let data:DriverOnOffModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                Serviceselecthiddenview.isHidden = true
                 self.createTimer()
                checkonoff = (data.data?.onlineOffline)!
                
                UserDefaultUtility.saveStringWithKey(checkonoff, key: AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
                
                if checkonoff == "1"
                {
                    myswitch.setOn(true, animated: true)
                    self.onofflinelbl.text = "Online".localized
                    self.onofflinelbl.textColor = UIColor.green
                    onoffstatus = "2"
                    onOfflineStatus = "1"
                    receiveActiveTripsData()

                }else{
                    
                    myswitch.setOn(false, animated: true)
                    self.onofflinelbl.text = "Offline".localized
                    self.onofflinelbl.textColor = UIColor.red
                    onoffstatus = "1"
                    onOfflineStatus = "2"
                    mapview.clear()
                    
                    if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
                        
                        if demologinvalue == "1"{
                        
                        }else{
                             UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                            
                        }
                        
                    }else{
                    }
                }
                
                self.MainScrrenApi()
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)! || (AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable)!{
                    
                    if demologinvalue == "1"{
                    
                    }else{
                        UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                    }
                    
                }else{
                    
                }
                
                //  UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                myswitch.setOn(false, animated: true)
                self.onofflinelbl.text = "Offline".localized
                self.onofflinelbl.textColor = UIColor.red
                onoffstatus = "1"
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
                self.MainScrrenApi()
            }
        }
        if let responseData = response as? AutoStatusModel
        {
            let data:AutoStatusModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                checkonoff = data.autoAccept ?? ""
                AppConstants.autoAcceptStatus = data.autoAccept ?? ""
                
                self.createTimer()
                 UserDefaultUtility.saveStringWithKey(AppConstants.autoAcceptStatus, key: AppConstants.UserDefaultKeys.AUTO_ACCEPT_VALUE)
                
                if checkonoff == "1"
                {
                    autoSwitch.setOn(true, animated: true)
                    self.autoSatusLabel.text = "Auto On".localized
                    self.autoSatusLabel.textColor = UIColor.green
                    autoOnOffStatus = "2"
                    autoStatus = "1"
                    
                }else{
                    
                    autoSwitch.setOn(false, animated: true)
                    self.autoSatusLabel.text = "Auto Off".localized
                    self.autoSatusLabel.textColor = UIColor.red
                    autoOnOffStatus = "1"
                    autoStatus = "2"
                }
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }
            else
            {
                autoSwitch.setOn(false, animated: true)
                self.autoSatusLabel.text = "Offline".localized
                self.autoSatusLabel.textColor = UIColor.red
                autoOnOffStatus = "1"
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
    
        
//        if let responseData = response as? DriverLocationModel{
//            let data:DriverLocationModel = responseData
//
//            if (data.result == "1") {
//
//                hideLoaderWithoutBackground()
//
//
//
//            }else if (data.result == "2"){
//
//                 hideLoaderWithoutBackground()
//
//                if AppConstants.screenfromaccept == ""{
//
//                AppConstants.timer?.cancel()
//                AppConstants.timer = nil
//                    AppConstants.mutiplestops.removeAll()
//                    AppConstants.multipleVisable = data.data?.multipleVisable ?? false
//
//                    let tablecount = data.data?.multipleStopList?.count ?? 0
//
//                    if tablecount == 0{
//
//
//                    }else{
//
//                        for i in 0...tablecount - 1{
//
//                            AppConstants.mutiplestops.append((data.data?.multipleStopList![i].dropLocation)!)
//
//
//                        }
//
//
//                    }
//
//                AppConstants.bookingid = String((data.data?.bookingId)!)
//                print(AppConstants.bookingid)
//                AppConstants.servicetypeid = String((data.data?.serviceTypeId ?? -1))
//                AppConstants.vehiclename = (data.data?.vehicle!)!
//                AppConstants.service = (data.data?.service!)!
//                AppConstants.estimatedistance = data.data?.estimateDistance ?? ""
//
//                AppConstants.estimateFare = data.data?.estimateBill ?? "0.0"
//                AppConstants.additionalNotes = (data.data?.additionalNotes!)!
//                AppConstants.dropLocation = (data.data?.dropLocation!)!
//                AppConstants.estimatetime = (data.data?.estimateTime!)!
//                AppConstants.paymentmethod = (data.data?.paymentMethod!)!
//                AppConstants.timestamp = String((data.data?.timestamp)!)
//                AppConstants.packagename = (data.data?.packageName!)!
//                AppConstants.pickuplocation = (data.data?.pickupLocation!)!
//                AppConstants.userphone = (data.data?.phone!)!
//                AppConstants.username = (data.data?.username!)!
//                AppConstants.driverrequesttimeout = String((data.data?.driverRequestTimeout!)!)
//                AppConstants.useremail = (data.data?.email!)!
//                AppConstants.vehicleimage = (data.data?.vehicleimage!)!
//
//
//
//
//                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                let AcceptViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptRideViewController") as! AcceptRideViewController
//                self.present(AcceptViewController, animated:true, completion:nil)
//
//                }else{
//
//
//                }
//            }
//            else if data.result == "999" {
//
//                UserDefaultUtility.removeAllUserDefault()
//
//                self.presentVC("SplashViewController")
//            }else{
//                hideLoaderWithoutBackground()
//               // showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
//            }
//        }
//
        if let responseData = response as? HeatMapModel{
            let data:HeatMapModel = responseData
            
            self.heatmapdata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                demandspotvalue = 1
                
                let iconGenerator = GMUDefaultClusterIconGenerator()
                let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
                let renderer = GMUDefaultClusterRenderer(mapView: mapview, clusterIconGenerator: iconGenerator)
                clusterManager = GMUClusterManager(map: mapview, algorithm: algorithm, renderer: renderer)
                
                // Generate and add random items to the cluster manager.
                generateClusterItems()
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                // showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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


extension OnlineViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1{
        
        return tablecount
            
        }else{
            
            return serviceselecttablecount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1{
        
        let cell = showpendingtableview.dequeueReusableCell(withIdentifier: "pendingride", for: indexPath) as! ShowPendingRideTableViewCell

        cell.maiview.edgeWithShadow(edge: 0)
        cell.gotorideview.edgeWithOutShadow(edge: 16)
        
        cell.ongoningridetext.text = "On Going Ride #".localized + (driverhomescreenmodeldata.data?.activeRides![indexPath.row].bookingId)!
        
        cell.namephonetext.text = (driverhomescreenmodeldata.data?.activeRides![indexPath.row].userName)! + "|" + (driverhomescreenmodeldata.data?.activeRides![indexPath.row].userPhone)!
        
        cell.ratingispendingtext.text = driverhomescreenmodeldata.data?.activeRides![indexPath.row].rideStatusText
        
        cell.ratingispendingtext.textColor = PListUtility.getColorFromHex(hexString: "#" + (driverhomescreenmodeldata.data?.activeRides![indexPath.row].rideStatusColor!)!)
        
        cell.gotoridebtn.tag = indexPath.row
        cell.gotoridebtn.setTitle("Go to Ride".localized, for: .normal)
        cell.gotoridebtn.addTarget(self, action: #selector(OnlineViewController.DeleteCard(_:)), for: .touchUpInside)
        
        let tableheight = showpendingtableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 300.0{
            
            showpendingviewheight.constant = tableheight + 45.0
        }
        else
        {
            showpendingviewheight.constant = AppConstants.screenframeheight - 300.0
        }
            return cell
        }
        else
        {
            let cell1: VehicleModelDataTableViewCell = ServiceSelecttableview.dequeueReusableCell(withIdentifier: "vehiclemodeldatacell", for: indexPath) as! VehicleModelDataTableViewCell
                
                cell1.vehiclemodeldatalbl.text = driverhomescreenmodeldata.data?.availableservices![indexPath.row].serviceName
                
                let tableheight = ServiceSelecttableview.contentSize.height
                
                
                if tableheight < AppConstants.screenframeheight - 200.0{
                    
                    Serviceselectinnerhiddenheight.constant = tableheight + 60.0
                    
                }else{
                    
                    Serviceselectinnerhiddenheight.constant = AppConstants.screenframeheight - 200.0
                }
                if self.selectedCells.contains(indexPath.row){
                    
                    cell1.vehiclemodeldataimageview.image = UIImage(named: "icons8-checked-checkbox-filled-50") as UIImage?
                }else{
                    cell1.vehiclemodeldataimageview.image = UIImage(named: "icons8-unchecked-checkbox-filled-50") as UIImage?
                }
                
            return cell1
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.tag == 1{
        showpendingtableview.deselectRow(at: indexPath, animated: false)
            
        }else{
            ServiceSelecttableview.deselectRow(at: indexPath, animated: false)
            
            if self.selectedCells.contains(indexPath.row) {
                
                self.selectedCells.remove(at: self.selectedCells.firstIndex(of: indexPath.row)!)
                self.selectedCellsvalue.remove(at: self.selectedCellsvalue.firstIndex(of: (String((driverhomescreenmodeldata.data?.availableservices![indexPath.row].serviceId ?? 0)!)))!)
                self.selectedCellsvaluename.remove(at: self.selectedCellsvaluename.firstIndex(of: ((driverhomescreenmodeldata.data?.availableservices![indexPath.row].serviceName ?? "")!))!)
                
            }else{
                
                self.selectedCellsvalue.append(String((driverhomescreenmodeldata.data?.availableservices![indexPath.row].serviceId ?? 0)!))
                self.selectedCells.append(indexPath.row)
                self.selectedCellsvaluename.append((driverhomescreenmodeldata.data?.availableservices![indexPath.row].serviceName ?? "")!)
            }
            
            ServiceSelecttableview.reloadData()
        }
    }
    
    @objc func DeleteCard(_ Sender: UIButton){
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        AppConstants.bookingid = (driverhomescreenmodeldata.data?.activeRides![Sender.tag].bookingId)!
        self.presentVC("TrackRideViewController")
    }
}


