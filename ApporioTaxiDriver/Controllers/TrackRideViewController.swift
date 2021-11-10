//
//  TrackRideViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import GoogleMaps
import StarryStars
import ObjectMapper
import GooglePlaces
import SkyFloatingLabelTextField
import SwiftySignature


class TrackRideViewController: BaseViewController, GMSMapViewDelegate,CLLocationManagerDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
//    @IBOutlet weak var signatureBackView: UIView!
//    @IBOutlet weak var signView: SignatureView!
    @IBOutlet weak var receiverDetailsHiddenView: UIView!
    @IBOutlet weak var receiverDetailsTopHeading: UILabel!
    @IBOutlet weak var receiverDetailsInnerView: UIView!
    @IBOutlet weak var dialogValueNameLabel: UILabel!
    @IBOutlet weak var dialogReceiverNameLabel: UILabel!
    @IBOutlet weak var receiverDetailsLabel: UIButton!
    @IBOutlet weak var cancelReceiverDialogButton: UIButton!
    @IBOutlet weak var dialogKeyContactLabel: UILabel!
    @IBOutlet weak var dialogValueContactLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
//    @IBOutlet weak var addreceiverSignLabel: UILabel!
    //@IBOutlet weak var signatureView: UIView!
    @IBOutlet weak var consignmentSubmutBtn: UIButton!
    @IBOutlet weak var enterOtpTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var receiverNameTextField: SkyFloatingLabelTextField!
    //@IBOutlet weak var consignmentImageView: UIImageView!
    @IBOutlet weak var imageBackView: UIView!
    @IBOutlet weak var topUploadConsignmentLabel: UILabel!
    @IBOutlet weak var consignmentInnerView: UIView!
    @IBOutlet weak var consignmentHiddenView: UIView!
    
    var checkSignature = 0
    
    @IBOutlet weak var waitingbtnview: UIView!
    
    @IBOutlet weak var waitingbtnimage: UIImageView!
    
    var manualtollcharges = false
    
    @IBOutlet weak var segmentOTPorQR: UISegmentedControl!
    @IBOutlet weak var hiddentollfirstview: UIView!
    @IBOutlet weak var hiddentollinnerview: UIView!
    @IBOutlet weak var hiddentollfstendridelbl: UILabel!
    @IBOutlet weak var hiddenanytollchargeview: UIView!
    @IBOutlet weak var hiddennotollchargeview: UIView!
    @IBOutlet weak var hiddenanytollbtn: UIButton!
    @IBOutlet weak var hiddennotollbtn: UIButton!
    @IBOutlet weak var hiddentollsecondview: UIView!
    @IBOutlet weak var hiddeninnertollsecondview: UIView!
    @IBOutlet weak var hiddensecendridelbl: UILabel!
    @IBOutlet weak var hiddenentertollchargetxtfld: UITextField!
    @IBOutlet weak var hiddentollsecdonebtn: UIButton!
    
     var checkDeliveryDropOtp = false
    
    @IBOutlet weak var childdetailstextmain: UILabel!
    
    @IBOutlet weak var childhiddenview: UIView!
    
    
    @IBOutlet weak var childdetailsinnerhiddenview: UIView!
    
    @IBOutlet weak var childdeatilshiddenview: UIView!
    
    @IBOutlet weak var childphonetext: UILabel!
    @IBOutlet weak var childnametext: UILabel!
    @IBOutlet weak var childdetailstextlbl: UILabel!
    
    @IBOutlet weak var topuserimageview: UIImageView!
    
    var checkupdownvalue = 1
    var tablecount: Int?
    var cancelReasonId:Int?
    var check2 = 0
    var selectindexvalue2 = 0
    var dropchange = 0
    var checkdroplocationedit = 0
    
    var drivercancelreasondata: DriverCancelReasonModel!
    var boolingdetailsdata: DriverBookingDetailoneModel!
    var trackingdata: DriverTrackingModel!
    var arrivedata: DriverArriveModel!
    var originCordinate: CLLocationCoordinate2D!
    var destinationcordinate: CLLocationCoordinate2D!
    var originMarker: GMSMarker!
    var destinationMarker: GMSMarker!
    var marker = GMSMarker()
    var markerList = [GMSMarker]()
    var Lat = ""
    var Lng = ""
    var checkmapmove = "0"
    var statusofbooking = 0
    var destinationmarkeriamge = "car"
    var finddistancelat = ""
    var finddistancelng = ""
    var radiansBearing : Double = 0.0
    
    @IBOutlet weak var btnScanCustomerQR: UIButton!
    
    @IBOutlet weak var infobtnclick: UIButton!
    @IBOutlet weak var topinfoview: UIView!
    
    @IBOutlet weak var topinfoinnerview: UIView!
    
    @IBOutlet weak var infotextlbl: UILabel!
    
    @IBOutlet weak var topinfoimageview: UIImageView!
    let driverid =   UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DRIVER_ID)
    
    
    @IBOutlet weak var slideimageview: UIView!
    
    var pickuplat = ""
    var pickuplong = ""
    var bearingfactor = ""
    
    var driverstartlat = ""
    var driverstartlong = ""
    
    var dropchangelat = ""
    var dropchangelong = ""
    
    var checkwaitingvalue = "0"
    var checkwaitingbtnvisibility: Bool?
    var checksendmeterimage: Bool?
    var checklocationaction: Bool?
    
     var installedNavigationApps : [String] = ["Apple Maps"]

    @IBOutlet weak var topchangelocbtn: UIButton!
    @IBOutlet weak var locationviewheight: NSLayoutConstraint!
    @IBOutlet weak var updownbtnimageview: UIImageView!
    @IBOutlet weak var mapview: GMSMapView!
    @IBOutlet weak var cancelbtnview: UIView!
    @IBOutlet weak var cancelbtn: UIButton!
    
    @IBOutlet weak var cancelbtnviewwidth: NSLayoutConstraint!
    
    @IBOutlet weak var arrivelblbtntext: UILabel!
    
    @IBOutlet weak var Arrivestartendview: UIView!
    
    @IBOutlet weak var Arrivestartendbtnview: UIView!
    //    @IBOutlet weak var Arrivestartendview: MMSlidingButton!
    @IBOutlet weak var arrivelbl: UILabel!
    @IBOutlet weak var sosview: UIView!
    @IBOutlet weak var sosimageview: UIImageView!
    @IBOutlet weak var trackhiddenview: UIView!
    @IBOutlet weak var trackinnerview: UIView!
    @IBOutlet weak var cancellbl: UILabel!
    @IBOutlet weak var tracktableview: UITableView!
    @IBOutlet weak var cancelhiddenlbl: UIButton!
    @IBOutlet var topslideview: UIView!
    @IBOutlet weak var topslidemainview: UIView!
    @IBOutlet weak var topmainaboveview: UIView!
    @IBOutlet weak var topmainbelowview: UIView!
    @IBOutlet weak var topviewnamelbl: UILabel!
    @IBOutlet weak var topviewcontactlbl: UILabel!
    @IBOutlet weak var topratingview: RatingView!
    @IBOutlet weak var topratinglbl: UILabel!
    @IBOutlet weak var toppaymentlbl: UILabel!
    @IBOutlet weak var toppaymenttext: UILabel!
    @IBOutlet weak var topstackview: UIStackView!
    @IBOutlet weak var topcallview: UIView!
    @IBOutlet weak var topchatview: UIView!
    @IBOutlet weak var topnavigateview: UIView!
    @IBOutlet weak var topcalllbl: UILabel!
    //@IBOutlet weak var topcallimageview: UIView!
    @IBOutlet weak var topchatinnerview: UIView!
    @IBOutlet weak var topchatimageview: UIImageView!
    @IBOutlet weak var topcallimageview: UIImageView!
    @IBOutlet weak var topcallinnerview: UIView!
    @IBOutlet weak var topchatlbl: UILabel!
    @IBOutlet weak var topnavigateinnerview: UIView!
    @IBOutlet weak var topnavigateimageview: UIImageView!
    @IBOutlet weak var topnavigatelbl: UILabel!
    @IBOutlet weak var toplocationview: UIView!
    @IBOutlet weak var topslidebtnview: UIView!
    @IBOutlet weak var toplocationlbl: UILabel!
    @IBOutlet weak var innerviewheight: NSLayoutConstraint!
    @IBOutlet weak var chatCountLabel: UILabel!
    
    @IBOutlet weak var dropOffImageUploadView: UIView!
    var selectedSegmentIndex = 0
    
    
    let locationManager = CLLocationManager()
    
    //to get drop off image
//    var receiverSignatureValue:[Data] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.signView.delegate = self
        
        receiverDetailsHiddenView.isHidden = true
        childhiddenview.isHidden = true
        childdeatilshiddenview.isHidden = true
        childdetailsinnerhiddenview.edgeWithShadow(edge: 12)
    
//        signatureBackView.layer.borderWidth = 2
//        signatureBackView.layer.borderColor = UIColor.appThemeColor().cgColor
//        self.signView.layer.borderWidth = 2
//        self.signView.b = UIColor.red.cgColor
//        self.signatureBackView.edgeWithOutShadow(edge: 5.0)
//        self.signView.edgeWithOutShadow(edge: 5.0)
        receiverDetailsLabel.edgeWithShadow(edge: 5.0)
        
//        addreceiverSignLabel.text = "Add Receiver's Signature Below".localized
        noteLabel.text = "Note: OTP Received on User App / Message".localized
        dialogKeyContactLabel.text = "Contact".localized
        cancelReceiverDialogButton.setTitle("CANCEL".localized, for: .normal)
        receiverDetailsLabel.setTitle("Receiver Details".localized, for: .normal)
        dialogReceiverNameLabel.text = "Name".localized
        receiverDetailsTopHeading.text = "Receiver Details".localized
        consignmentHiddenView.isHidden = true
        consignmentSubmutBtn.setTitle("Submit".localized, for: .normal)
        receiverNameTextField.placeholder = "Enter Receiver's Name".localized
        enterOtpTextField.placeholder = "Enter OTP".localized

        topUploadConsignmentLabel.text = "Receiver Details".localized
        AppConstants.customerQRcodeForTrackRiderVC = ""
        
        childhiddenview.makeViewCircular()
        
        checkdroplocationedit = 0
        
        AppConstants.player?.stop()
       
        AppConstants.acceptrejectTimer.invalidate()
        AppConstants.helloWorldTimer.invalidate()
        
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
       
        topinfoview.isHidden = true
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(TrackingData),
//            name: NSNotification.Name(rawValue: "trackingdata"),
//            object: nil)
//
        
         AppConstants.screenfromaccept = ""
        
         self.waitingbtnview.isHidden = true
        hiddentollfirstview.isHidden = true
        hiddentollsecondview.isHidden = true
        
        hiddentollinnerview.edgeWithShadow(edge: 5.0)
        hiddenanytollchargeview.edgeWithShadow(edge: 5.0)
        hiddennotollchargeview.edgeWithShadow(edge: 5.0)
        hiddentollsecdonebtn.edgeWithShadow(edge: 5.0)
        hiddenanytollbtn.edgeWithShadow(edge: 5.0)
        hiddennotollbtn.edgeWithShadow(edge: 5.0)
        hiddeninnertollsecondview.edgeWithShadow(edge: 5.0)
        hiddenentertollchargetxtfld.edgeWithShadow(edge: 5.0)
        hiddentollsecdonebtn.edgeWithShadow(edge: 5.0)
        
        
        chatCountLabel.layer.cornerRadius = chatCountLabel.frame.width/2
        chatCountLabel.clipsToBounds = true
        if AppConstants.chatCount == 0 {
            chatCountLabel.isHidden = true
        } else {
            chatCountLabel.isHidden = false
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showtrack),
            name: NSNotification.Name(rawValue: "trackride"),
            object: nil)

        
        if(AppConstants.driverconfiguredata.data?.generalConfig?.chat ?? false){
            
         topchatview.isHidden = false
        }
        else{
            topchatview.isHidden = true
        }

        
        if (AppConstants.driverconfiguredata.data?.rideConfig?.slidebutton)!{
            
            Arrivestartendview.isHidden = false
            Arrivestartendbtnview.isHidden = true
        }else{
            Arrivestartendview.isHidden = true
            Arrivestartendbtnview.isHidden = false
        }
        
//        Arrivestartendview.delegate = self
//         Arrivestartendview.buttonText = "Unlocked"
//        Arrivestartendview.buttonTextColor = UIColor.clear
        cancelbtn.setTitle("Cancel".localized, for: .normal)
        cancellbl.text = "Cancel".localized
        cancelhiddenlbl.setTitle("CANCEL".localized, for: .normal)
        topcalllbl.text = "Call".localized
        topchatlbl.text = "Chat".localized
        topnavigatelbl.text = "Navigate".localized
        
        self.updownbtnimageview.image = UIImage(named: "icons8-sort-down-filled-48 (1)")
        
//        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture")
//        swipeRight.direction = UISwipeGestureRecognizerDirection.right
//        self.Arrivestartendview.addGestureRecognizer(swipeRight)

        dropchange = 0
        tablecount = 0
        
        self.toppaymentlbl.text = "Payment".localized
        self.trackhiddenview.isHidden = true
        
        sosview.makeViewCircular()
        topslidemainview.edgeWithShadow(edge: 0.0)
        toplocationview.edgeWithShadow(edge: 5.0)
        topslidebtnview.edgeWithShadow(edge: 12.0)
        self.topcallinnerview.makeViewCircular()
//        self.topcallinnerview.layer.backgroundColor = PListUtility.getColorFromHex(hexString: AppConstants.driverconfiguredata.data?.themeConfig?.callButtonColorDriver ?? "#0000ff")
        self.topcallinnerview.backgroundColor = PListUtility.getColorFromHex(hexString: AppConstants.driverconfiguredata.data?.themeConfig?.callButtonColorDriver ?? "#0000ff")
        self.topchatinnerview.makeViewCircular()
//        self.topchatinnerview.layer.backgroundColor = UIColor.appThemeColor().cgColor
        self.topchatinnerview.backgroundColor = PListUtility.getColorFromHex(hexString: AppConstants.driverconfiguredata.data?.themeConfig?.chatButtonColorDriver ?? "#0000ff")
        self.topnavigateinnerview.makeViewCircular()
        self.topnavigateinnerview.layer.backgroundColor = UIColor.appDarkThemeColor().cgColor

        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(wasSwiped(gestureRecognizer:)))
        rightGesture.direction = .right
        Arrivestartendview.addGestureRecognizer(rightGesture)
        rightGesture.delegate = self
        view.addSubview(Arrivestartendview)
        
        view.addSubview(topslideview)
        topslideview.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: UIScreen.main.bounds.size.width, height: 220)
        topslideview.isHidden = false
        
        if consignmentHiddenView.isHidden == false {
            receiverNameTextField.text = boolingdetailsdata.data?.user?.userName ?? ""
            topslideview.isHidden = true
            Arrivestartendbtnview.isHidden = true
        }
        
        let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(wasSwiped(gestureRecognizer:)))
        upGesture.direction = .up
        topslideview.addGestureRecognizer(upGesture)
        upGesture.delegate = self
        
        let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(wasSwiped(gestureRecognizer:)))
        downGesture.direction = .down
        topslideview.addGestureRecognizer(downGesture)
        downGesture.delegate = self
        
        topslideview.isUserInteractionEnabled = true
        
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
//        AppConstants.calculatedAccuracy = self.locationManager.desiredAccuracy
//        self.locationManager.pausesLocationUpdatesAutomatically = false
//        self.locationManager.requestAlwaysAuthorization()
//        if #available(iOS 9.0, *) {
//            locationManager.allowsBackgroundLocationUpdates = true
//        } else {
//            // Fallback on earlier versions
//        }
        
       // self.locationManager.startUpdatingLocation()
        
        mapview.delegate = self
        mapview.isMyLocationEnabled = true
        
        let camera = GMSCameraPosition.camera(withLatitude: Double(AppConstants.Lat)!, longitude: Double(AppConstants.Lng)!, zoom: 16);
        self.mapview.camera = camera
        
       // mapview.animate(toZoom: 15)
        
       riderChangesDropLocApi()
        
    }
    //uttam
    @IBAction func dropOffImageUploader(_ sender: UIButton) {
        
        AppConstants.UploadDropoffImagesFromVC = "TrackRideViewController"
        presentVC("UploadDropoffImagesController")
    }

    @IBAction func cancelReceiverDetailsViewClicked(_ sender: UIButton) {
        
    }
    
//    func SignatureViewDidCaptureSignature(view: SignatureView, signature: Signature?) {
//
//
////        var currentIndex = 0
////        var receiverSignatureIndex = 0
////        for index in imagestring{
////            if index == "receiver_image"{
////                receiverSignatureIndex = currentIndex
////                print("Receiver image Index is \(receiverSignatureIndex)")
////            }
////            currentIndex += 1
////
////            imagestring.remove(at: receiverSignatureIndex)
////            imagearray.remove(at: receiverSignatureIndex)
////        }
//
//        print("Receiver array \(receiverSignatureValue)")
//        receiverSignatureValue.removeAll()
//        let imageData = (signature?.image)!.jpegData(compressionQuality: 0.5)
//        receiverSignatureValue.append(imageData!)
//
//    }
    
//    func SignatureViewDidBeginDrawing(view: SignatureView) {
//        print("qwerty")
//    }
//
//    func SignatureViewIsDrawing(view: SignatureView) {
//        print("qwerty")
//    }
    
//    func SignatureViewDidFinishDrawing(view: SignatureView) {
//        signView.captureSignature()
//    }
    
//    func SignatureViewDidCancelDrawing(view: SignatureView) {
//        print("qwerty")
//    }
    
    
    @IBAction func waitingtimebtnclick(_ sender: Any) {
        
        var dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                    "latitude": AppConstants.Lat as AnyObject,
                    "longitude": AppConstants.Lng as AnyObject,
                   
            ] as [String : AnyObject]
        
        if (checkwaitingvalue == "0") {
            dic1["type"] = "2" as AnyObject
        } else {
            dic1["type"] = checkwaitingvalue as AnyObject
        }
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.WaitingPauseResumeURL
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
       ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: WaitingTimeModel.self)
    }
    
    @IBAction func hiddentollsecondbtnclick(_ sender: Any) {
        
        hiddentollfirstview.isHidden = true
        hiddentollsecondview.isHidden = true
        
        if hiddenentertollchargetxtfld.text == ""{
            
            showErrorAlert("Alert", alertMessage: "Please enter any amount".localized, VC: self)
            
        }else{
            
            self.showLoaderWithoutBackground()
            AppConstants.driverlocationtimer?.cancel()
            
            AppConstants.trackingscreenvalue = ""
            SocketManagerClass.sharedInstance.endrideevent(BookingId: AppConstants.bookingid, BookingStatus: "1005")
            
            AppConstants.driverlocationtimer = nil
            var dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                        "latitude": AppConstants.driverselectaddressLat as AnyObject,
                        "longitude": AppConstants.drivertselectaddressLng as AnyObject,
                        "accuracy": String(AppConstants.calculatedAccuracy),
                        "send_meter_value": AppConstants.meterreadingvalue,
                        "manual_toll_charge": hiddenentertollchargetxtfld.text!
                ] as [String : AnyObject]
            
            //uttam
            
            if ((boolingdetailsdata.data?.deliveryDropOtp)!){
                dic1["receiver_otp"] = enterOtpTextField.text! as AnyObject
                dic1["receiver_name"] = receiverNameTextField.text! as AnyObject
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
                ServiceManager.sharedInstance.delegate = self
                print(apiRequestUrl)
                
                ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverEndRideModel.self)
                
            }else{
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverEndRideModel.self)
            }
        }
    }
    
    @IBAction func hiddennotollbtnclick(_ sender: Any) {
        
        hiddentollfirstview.isHidden = true
        hiddentollsecondview.isHidden = true
        
        self.showLoaderWithoutBackground()
        AppConstants.driverlocationtimer?.cancel()
        
        AppConstants.trackingscreenvalue = ""
        SocketManagerClass.sharedInstance.endrideevent(BookingId: AppConstants.bookingid, BookingStatus: "1005")
        
        AppConstants.driverlocationtimer = nil
        var dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                    "latitude": AppConstants.driverselectaddressLat as AnyObject,
                    "longitude": AppConstants.drivertselectaddressLng as AnyObject,
                    "accuracy": String(AppConstants.calculatedAccuracy),
                    "send_meter_value": AppConstants.meterreadingvalue] as [String : AnyObject]
        
        if ((boolingdetailsdata.data?.deliveryDropOtp)!){
            dic1["receiver_otp"] = enterOtpTextField.text! as AnyObject
            dic1["receiver_name"] = receiverNameTextField.text! as AnyObject
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverEndRideModel.self)
            
        }else{
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            print("imagedata count \(AppConstants.imagearray)")
            ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverEndRideModel.self)
        }
    }
    
    @IBAction func hiddenanytollbtnclick(_ sender: Any) {
        
        hiddentollfirstview.isHidden = true
        hiddentollsecondview.isHidden = false
    }
    
    @IBAction func hiddenconsignmentCancelBtn_Click(_ sender: Any) {
        
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.consignmentHiddenView.isHidden = true
            self.topslideview.isHidden = false
            self.Arrivestartendbtnview.isHidden = false
            })
        
//        if (AppConstants.driverconfiguredata.data?.rideConfig?.slidebutton)!{
//            Arrivestartendview.isHidden = false
//            Arrivestartendbtnview.isHidden = true
//        }
        
        receiverNameTextField.text = ""
//        signView.clearCanvas()
        enterOtpTextField.text = ""
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
            case 0:
            enterOtpTextField.text = ""
            enterOtpTextField.placeholder = "Enter OTP".localized
            noteLabel.text = "Note: OTP Received on User App / Message".localized
            btnScanCustomerQR.isHidden = true
            
            case 1:
            enterOtpTextField.text = ""
            enterOtpTextField.placeholder = "Enter QR code".localized
            noteLabel.text = "Note: QR code sent to user via Message".localized
            btnScanCustomerQR.isHidden = false
            btnScanCustomerQR.layer.cornerRadius = 5.0
                        
            default:
            enterOtpTextField.text = ""
            enterOtpTextField.placeholder = "Enter OTP".localized
            noteLabel.text = "Note: OTP Received on User Application or Message".localized
            btnScanCustomerQR.isHidden = true
        }
    }
    
    @IBAction func btnScanCustomerQRClicked(_ sender: UIButton) {
        
        presentVC("QRCodeController")
    }
    
//    @objc func TrackingData(notification: NSNotification){
//
//
//        if AppConstants.trackingdata.data?.stillLatitude == ""{
//
//            pickuplat = "0.0"
//            pickuplong = "0.0"
//
//
//        }else{
//
//            pickuplat = (AppConstants.trackingdata.data?.stillLatitude ?? "0.0")!
//            pickuplong = (AppConstants.trackingdata.data?.stillLongitude ?? "0.0")!
//        }
//
//        AppConstants.emergencylatitude = (AppConstants.trackingdata.data?.movableLatitude ?? "0.0")!
//
//        AppConstants.emergencylongitude = (AppConstants.trackingdata.data?.movableLongitude ?? "0.0")!
//
//        driverstartlat = (AppConstants.trackingdata.data?.movableLatitude ?? "0.0")!
//        driverstartlong = (AppConstants.trackingdata.data?.movableLongitude ?? "0.0")!
//
//        bearingfactor = (AppConstants.trackingdata.data?.bearing ?? "0.0")!
//
//        let markerimage = (data.data?.movableMarkerType?.drivermarkerName ?? "car.png")!
//
//
//      //  let markerimage = "car.png"
//
//        let markervalue = markerimage.components(separatedBy: ".")
//
//        destinationmarkeriamge = markervalue[0]
//
//
//        mapview.clear()
//
//        self.drawRoute()
//
//
//    }
    @IBAction func receiverDetailsButton_Click(_ sender: Any) {
        topslideview.isHidden = true
        receiverDetailsHiddenView.isHidden = false
    }
    
    @IBAction func receiverDialogCancelBtn_Click(_ sender: Any) {
        receiverDetailsHiddenView.isHidden = true
        topslideview.isHidden = false
    }
    
    @IBAction func childcallbtnclick(_ sender: Any) {
        
        if let url = URL(string: "telprompt://\(boolingdetailsdata.data?.familyMemberDetails?.familyMemberPhoneNumber! ?? "345678")") {
            
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
        }
    }
    
    @IBAction func childhiddencancelbtn(_ sender: Any) {
        childdeatilshiddenview.isHidden = true
    }
    
    @IBAction func childmainviewbtnclick(_ sender: Any) {
        childdeatilshiddenview.isHidden = false
        
    }
    
//    @IBAction func consignmentImageBtn_Click(_ sender: Any) {
//
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
//            let imagePicker = UIImagePickerController()
//
//            imagePicker.delegate = self
//            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
//            imagePicker.allowsEditing = false
//            self.present(imagePicker, animated: true, completion: nil)
//        }
//
//    }
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//
//        imagearray.removeAll()
//        imagestring.removeAll()
//
//        //consignmentImageView.image = image
//
//        //AppConstants.meterimage = self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height: 70))
//
//        let imageData = UIImageJPEGRepresentation(consignmentImageView.image!, 0.5)
//
//        imagearray.append(imageData!)
//        imagestring.append(" receiver_image")
//
//        self.dismiss(animated: true, completion: nil)
//
//    }
    
    //uttam DROP OFF IMAGE

    @objc func imageIconTapped()
    {
        let alertView = UIAlertController(title: "Select Option".localized, message: "", preferredStyle: .alert)
        let Camerabutton = UIAlertAction(title: "Camera".localized, style: .default, handler: { (alert) in

            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()

                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        let Gallerybutton = UIAlertAction(title: "Gallery".localized, style: .default, handler: { (alert) in

            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum){
                print("Button capture")
                let imagePicker = UIImagePickerController()

                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
                imagePicker.allowsEditing = false

                self.present(imagePicker, animated: true, completion: nil)
            }

        })
        let cancelAction = UIAlertAction(title: "Cancel".localized,
                style: .cancel, handler: nil)
        alertView.addAction(Camerabutton)
        alertView.addAction(Gallerybutton)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    
    @IBAction func consignmentSubmitBtn_Click(_ sender: Any) {
        
//        if signView.signaturePresent == false {
//          showErrorAlert("Alert", alertMessage: "Signature field is blank".localized , VC: self)
//        }
        if receiverNameTextField.text == "" {
            showErrorAlert("Alert", alertMessage: "Please enter receiver name" , VC: self)
        }else if enterOtpTextField.text == ""{
            showErrorAlert("Alert", alertMessage: "Please enter OTP first" , VC: self)
        }else{
            
            self.locationManager.startUpdatingLocation()
            UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.consignmentHiddenView.isHidden = true
                self.topslideview.isHidden = false
                self.Arrivestartendbtnview.isHidden = false
                })
            
            if (AppConstants.driverconfiguredata.data?.rideConfig?.slidebutton)!{
                        Arrivestartendview.isHidden = false
            }
            if (self.checklocationaction!){
                
                var dic1 = ["booking_id": AppConstants.bookingid,
                            "latitude": AppConstants.driverselectaddressLat,
                            "longitude": AppConstants.drivertselectaddressLng,
                            "accuracy": AppConstants.calculatedAccuracy] as [String : AnyObject]
                
                if ((segmentOTPorQR.selectedSegmentIndex == 0)){
                    dic1["receiver_otp"] = enterOtpTextField.text! as AnyObject
                    dic1["validation_type"] = "0" as AnyObject
                   
                    dic1["receiver_name"] = receiverNameTextField.text! as AnyObject
                }
                else
                {
                    dic1["receiver_otp"] = enterOtpTextField.text! as AnyObject
                    dic1["validation_type"] = "1" as AnyObject
                   
                    dic1["receiver_name"] = receiverNameTextField.text! as AnyObject
                }
                
                print("consin submit dict \(dic1)")
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERMULTIPLEPICK
                ServiceManager.sharedInstance.delegate = self
                print(apiRequestUrl)
                
                ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverMultiplePickModel.self)
                
                //ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverMultiplePickModel.self)
                
            }else{
                
                 let checkTollCharge = UserDefaults.standard.bool(forKey: "CheckTollCharges")
                
                if AppConstants.checkfromcamera == 1{
                    
//                    let newArray = AppConstants.imagearray + imagearray
//                    let newStringArray = AppConstants.imagestring + imagestring
                    
                    AppConstants.checkfromcamera = 0
                    
                    self.showLoaderWithoutBackground()
                    AppConstants.driverlocationtimer?.cancel()
                    AppConstants.driverlocationtimer = nil
                    AppConstants.trackingscreenvalue = ""
                    SocketManagerClass.sharedInstance.endrideevent(BookingId: AppConstants.bookingid, BookingStatus: "1005")
                    
                    var dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                                "latitude": AppConstants.driverselectaddressLat as AnyObject,
                                "longitude": AppConstants.drivertselectaddressLng as AnyObject,
                                "accuracy": String(AppConstants.calculatedAccuracy),
                                "send_meter_value": AppConstants.meterreadingvalue,
                                //            "receiver_otp": enterOtpTextField.text!,
                        //            "receiver_name": receiverNameTextField.text!,
                        //"receiver_image":
                        ] as [String : AnyObject]
                    
                    if ((boolingdetailsdata.data?.deliveryDropOtp)!){
                        
                        if segmentOTPorQR.selectedSegmentIndex == 0
                        {
                            dic1["receiver_otp"] = enterOtpTextField.text! as AnyObject
                            dic1["validation_type"] = "0" as AnyObject
                        }
                        else
                        {
                            dic1["customer_qrcode"] = enterOtpTextField.text! as AnyObject
                            dic1["validation_type"] = "1" as AnyObject
                        }
                        dic1["receiver_name"] = receiverNameTextField.text! as AnyObject
                    }
                    
//                    AppConstants.imagearray.append(receiverSignatureValue[0])
//                    AppConstants.imagestring.append("receiver_image")
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
                    ServiceManager.sharedInstance.delegate = self
                    
                    ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName:AppConstants.imagestring, returningClass: DriverEndRideModel.self)
                    
                }else if (checkTollCharge){
                    
                    AppConstants.driverlocationtimer?.cancel()
                    AppConstants.driverlocationtimer = nil
                    hiddentollfirstview.isHidden = false
                    
                }else{
                    
                    self.showLoaderWithoutBackground()
                    AppConstants.driverlocationtimer?.cancel()
                    AppConstants.driverlocationtimer = nil
                    AppConstants.trackingscreenvalue = ""
                    SocketManagerClass.sharedInstance.endrideevent(BookingId: AppConstants.bookingid, BookingStatus: "1005")
                    
                    var dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                                "latitude": AppConstants.driverselectaddressLat as AnyObject,
                                "longitude": AppConstants.drivertselectaddressLng as AnyObject,
                                "accuracy": String(AppConstants.calculatedAccuracy),
                                //"send_meter_value": AppConstants.meterreadingvalue,
                        //            "receiver_otp": enterOtpTextField.text!,
                        //            "receiver_name": receiverNameTextField.text!,
                        //"receiver_image":
                        ] as [String : AnyObject]
                    
                    if ((boolingdetailsdata.data?.deliveryDropOtp)!){
                        if segmentOTPorQR.selectedSegmentIndex == 0
                        {
                            dic1["receiver_otp"] = enterOtpTextField.text! as AnyObject
                            dic1["validation_type"] = "0" as AnyObject
                        }
                        else
                        {
                            dic1["customer_qrcode"] = enterOtpTextField.text! as AnyObject
                            dic1["validation_type"] = "1" as AnyObject
                        }
                        dic1["receiver_name"] = receiverNameTextField.text! as AnyObject
                    }
                    
                    //add updated signature over here
                    
//                    AppConstants.imagearray.append(receiverSignatureValue[0])
//                    AppConstants.imagestring.append("receiver_image")
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
                    ServiceManager.sharedInstance.delegate = self
                    print(apiRequestUrl)
     //uttam
                    ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverEndRideModel.self)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let camera = GMSCameraPosition.camera(withLatitude: Double(AppConstants.Lat)!, longitude: Double(AppConstants.Lng)!, zoom: 16);
        self.mapview.camera = camera
        AppConstants.finddistancelat = ""
        AppConstants.finddistancelng = ""
        AppConstants.trackingscreenvalue = "1"
        
        if AppConstants.chatCount == 0 {
            chatCountLabel.isHidden = true
        } else {
            chatCountLabel.isHidden = false
        }
        
        if (AppConstants.customerQRcodeForTrackRiderVC! != "")
        {
            segmentOTPorQR.selectedSegmentIndex = 1
            enterOtpTextField.text = AppConstants.customerQRcodeForTrackRiderVC
            enterOtpTextField.placeholder = "Enter QR code"
            noteLabel.text = "Note: QR code sent to user via Message".localized
            btnScanCustomerQR.isHidden = false
        }
        else{
            segmentOTPorQR.selectedSegmentIndex = 0
            enterOtpTextField.text = ""
            enterOtpTextField.placeholder = "Enter OTP".localized
            noteLabel.text = "Note: OTP Received on User App / Message".localized
            btnScanCustomerQR.isHidden = true
        }
        hideLoaderWithoutBackground()
        
        if AppConstants.checkfromotp == 1{
            
            AppConstants.checkfromotp = 0
            
            if (checksendmeterimage)!{
                
                let next: CameraViewController = self.storyboard!.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
                next.viewcontrollerself = self
                // next.movefrom = "documentphoto"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
                
            }  else{
                
                if self.toplocationlbl.text == ""{
                    self.showErrorAlert("Alert".localized, alertMessage: "Please select drop location first".localized, VC: self)
                }else{
                    
                    AppConstants.driverlocationtimer?.cancel()
                    AppConstants.driverlocationtimer = nil
                    
                    self.showLoaderWithoutBackground()
                    
                    let dic1 = ["booking_id": AppConstants.bookingid,
                                "latitude": AppConstants.driverselectaddressLat,
                                "longitude": AppConstants.drivertselectaddressLng,
                                "accuracy": AppConstants.calculatedAccuracy,
                                "send_meter_image": ""] as [String : AnyObject]
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSTARTRIDE
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverStartRideModel.self)
                }
            }
        }
        
        if AppConstants.checkfromchat == 1{
            AppConstants.checkfromchat = 0
            AppConstants.finddistancelat = ""
            self.timerForDriverLocation()
        }else
        {
            
        }
        
        if dropchange == 1{
            
            AppConstants.driverlocationtimer?.cancel()
            AppConstants.driverlocationtimer = nil
            
            showLoaderWithoutBackground()
            
            let dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                        "location": self.toplocationlbl.text!,
                        "latitude": self.dropchangelat,
                        "longitude": self.dropchangelong
                ] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHANGEDROP
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverDropChangeModel.self)
            
        }
        
        if AppConstants.checkfromcamera == 1{
            AppConstants.checkfromcamera = 0
            AppConstants.driverlocationtimer?.cancel()
            AppConstants.driverlocationtimer = nil
            
            if statusofbooking == 1003{
            
            self.showLoaderWithoutBackground()
            
                let dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                            "latitude": AppConstants.driverselectaddressLat as AnyObject,
                            "longitude": AppConstants.drivertselectaddressLng as AnyObject,
                            "accuracy": String(AppConstants.calculatedAccuracy),
                        "send_meter_value": AppConstants.meterreadingvalue] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSTARTRIDE
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverStartRideModel.self)
        }
            if statusofbooking == 1004{
                
                if (checkDeliveryDropOtp){
                    
                    AppConstants.driverlocationtimer?.cancel()
                    AppConstants.driverlocationtimer = nil
                    
                    UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                        self.consignmentHiddenView.isHidden = true
                        self.topslideview.isHidden = false
                        self.Arrivestartendbtnview.isHidden = false
                        
                    })
//                    topslideview.isHidden = true
//                    Arrivestartendview.isHidden = true

                }else{
                
                 let checkTollCharge = UserDefaults.standard.bool(forKey: "CheckTollCharges")
                
                 if (checkTollCharge)
                {
                    AppConstants.driverlocationtimer?.cancel()
                    AppConstants.driverlocationtimer = nil
                    
                    hiddentollfirstview.isHidden = false
                    
                 }else{
                
                self.showLoaderWithoutBackground()
                AppConstants.driverlocationtimer?.cancel()
                
                AppConstants.trackingscreenvalue = ""
                SocketManagerClass.sharedInstance.endrideevent(BookingId: AppConstants.bookingid, BookingStatus: "1005")
                
                AppConstants.driverlocationtimer = nil
                let dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                            "latitude": AppConstants.driverselectaddressLat as AnyObject,
                            "longitude": AppConstants.drivertselectaddressLng as AnyObject,
                            "accuracy": String(AppConstants.calculatedAccuracy),
                            "send_meter_value": AppConstants.meterreadingvalue] as [String : AnyObject]
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
                ServiceManager.sharedInstance.delegate = self
                print(apiRequestUrl)
                
                ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName: AppConstants.imagestring, returningClass: DriverEndRideModel.self)
                    
                }
            }
            }
            
        }else
        {
        }
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
            default:
                break
            }
        }
    }
    
    
    @IBAction func infobtnclick(_ sender: Any) {
        
         self.showErrorAlert("Additional Notes".localized, alertMessage: boolingdetailsdata.data?.additionalnotes ?? "", VC: self)
    }
    
    
    func riderChangesDropLocApi() {
        showLoaderWithoutBackground()
        
        let dic1 = ["booking_id":AppConstants.bookingid as AnyObject,
                    "latitude": AppConstants.driverselectaddressLat,
                    "longitude": AppConstants.drivertselectaddressLng
            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERBOOKINGDETAILS
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverBookingDetailoneModel.self)
    }
    
    func openChatViewController() {
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        AppConstants.chatCount = 0
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginView = storyboard.instantiateViewController(withIdentifier: "ChatViewController")
        let navController = UINavigationController(rootViewController: LoginView)
        self.present(navController, animated: true, completion: nil)
    }
    
    func timerForDriverLocation(){
        
        AppConstants.driverlocationtimer = DispatchSource.makeTimerSource(queue: .main)
       
        AppConstants.driverlocationtimer?.schedule(deadline: .now(), repeating: .seconds(3))
        
        AppConstants.driverlocationtimer?.setEventHandler(handler: { [weak self] in      // assuming you're referencing `self` in here, use
            
            
            if AppConstants.finddistancelat == ""{
                
                AppConstants.finddistancelat = AppConstants.Lat
                AppConstants.finddistancelng = AppConstants.Lng
                
                let dic1 = ["booking_id": AppConstants.bookingid,
                            "latitude":AppConstants.Lat,
                            "longitude":AppConstants.Lng,
                            "bearing":String(AppConstants.radiansBearing),
                            "accuracy":LocationManagerClass.sharedInstance.locationManager.desiredAccuracy
                    
                    ] as [String : AnyObject]
                
                //  self!.showLoaderWithoutBackground()
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERTRACKING
                ServiceManager.sharedInstance.delegate = self
                
                ServiceManager.sharedInstance.requestPostWithParameterLocationtimer1(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverTrackingModel.self)
            }
            
            let coordinateTo = CLLocation(latitude: Double(AppConstants.Lat)!, longitude: Double(AppConstants.Lng)!)
            
            let pickuplat = Double(AppConstants.finddistancelat)
            let pickuplng = Double(AppConstants.finddistancelng)
            
            let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
            
            let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
            
            
            if distanceInMeter < 20.0 {
                
                print("fgdwhfjekrlv")
                
            }else{
                
                AppConstants.finddistancelat = AppConstants.Lat
                AppConstants.finddistancelng = AppConstants.Lng
            
            let dic1 = ["booking_id": AppConstants.bookingid,
                        "latitude":AppConstants.Lat,
                        "longitude":AppConstants.Lng,
                        "bearing":String(AppConstants.radiansBearing),
                        "accuracy":LocationManagerClass.sharedInstance.locationManager.desiredAccuracy

                ] as [String : AnyObject]

            //  self!.showLoaderWithoutBackground()

            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERTRACKING
            ServiceManager.sharedInstance.delegate = self

            ServiceManager.sharedInstance.requestPostWithParameterLocationtimer1(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverTrackingModel.self)
                
            }
        })
        AppConstants.driverlocationtimer?.resume()
        // note, timer is not yet started; you have to call `timer?.resume()`
    }
    
    func stopTimer1() {
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
    }

//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//
//            print(location.coordinate)
//            reverseGeocodeCoordinate(location.coordinate)
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
//            if self.checkmapmove == "1"{
//
//            }else{
//
//                 let userLocation = locations.last
//                let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude, zoom: 16);
//                self.mapview.camera = camera
//
////                mapview.animate(toLocation: CLLocationCoordinate2DMake(Double(Lat)!, Double(Lng)!))
////                mapview.animate(toZoom: 15)
//            }
//
//        }
//
//    }
//
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        self.checkmapmove = "1"
        
        
    }
   
//    func getBearing(toPoint point: CLLocationCoordinate2D) {
//
//
//        func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
//        func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
//
//        let lat1 = degreesToRadians(Double(Lat)!)
//        let lon1 = degreesToRadians(Double(Lng)!)
//
//        print(Lat)
//
//        let lat2 = degreesToRadians(point.latitude);
//        let lon2 = degreesToRadians(point.longitude);
//
//        print(point.latitude)
//
//        let dLon = lon2 - lon1;
//
//        let y = sin(dLon) * cos(lat2);
//        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
//
//        let radiansBearing1 = atan2(y, x);
//
//
//        radiansBearing = (radiansToDegrees(radiansBearing1))
//        AppConstants.radiansBearing = (radiansToDegrees(radiansBearing1))
//
//        // return radiansToDegrees(radiansBearing)
//    }
//
//    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
//
//        // 1
//
//        let geocoder = GMSGeocoder()
//
//        // 2
//        print(coordinate)
//        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
////            print(error)
////            print(response)
//            if let address = response?.firstResult() {
//
//                  self.getBearing(toPoint: coordinate)
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
//
//
//
//
//
//                print(AppConstants.driverselectaddressLat)
//                print(AppConstants.drivertselectaddressLng)
//            }
//        }
//    }
   
    @IBAction func topcallbtnclick(_ sender: Any) {
        
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        
        if let url = URL(string: "telprompt://\(boolingdetailsdata.data?.user?.userPhone ?? "345678")") {
            
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
        }
    }
    
    @IBAction func topchatbtn_click(_ sender: Any) {
        openChatViewController()
    }
    
    @IBAction func Arrivestartendbtnclick(_ sender: Any) {
        
        if self.statusofbooking == 1002{
            
            AppConstants.driverlocationtimer?.cancel()
            AppConstants.driverlocationtimer = nil
            
            self.showLoaderWithoutBackground()
            
            let dic1 = ["booking_id": AppConstants.bookingid,
                        "latitude": AppConstants.driverselectaddressLat,
                        "longitude": AppConstants.drivertselectaddressLng,
                        "accuracy": AppConstants.calculatedAccuracy] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERARRIVE
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverArriveModel.self)
        }
        
        if self.statusofbooking == 1003{
            if (self.boolingdetailsdata.data!.rideOtpVerify == 1){
                
                self.presentVC("OTPVerificationViewController")
            }
            else
            {
                if (self.checksendmeterimage)!{
                    
                    AppConstants.driverlocationtimer?.cancel()
                    AppConstants.driverlocationtimer = nil
                    
                    let next: CameraViewController = self.storyboard!.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
                    next.viewcontrollerself = self
                    // next.movefrom = "documentphoto"
                    next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                    next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    self.present(next, animated: true, completion: nil)
                }else{
                    
                    if self.toplocationlbl.text == ""{
                        self.showErrorAlert("Alert".localized, alertMessage: "Please select drop location first".localized, VC: self)
                    }else{
                        
                        AppConstants.driverlocationtimer?.cancel()
                        AppConstants.driverlocationtimer = nil
                        self.showLoaderWithoutBackground()
                        let dic1 = ["booking_id": AppConstants.bookingid,
                                    "latitude": AppConstants.driverselectaddressLat,
                                    "longitude": AppConstants.drivertselectaddressLng,
                                    "accuracy": AppConstants.calculatedAccuracy,
                                    "send_meter_image": ""] as [String : AnyObject]
                        
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSTARTRIDE
                        ServiceManager.sharedInstance.delegate = self
                        print(apiRequestUrl)
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverStartRideModel.self)
                    }
                }
            }
        }
        
        if self.statusofbooking == 1004{
            
             let checkTollCharge = UserDefaults.standard.bool(forKey: "CheckTollCharges")
            
             if (self.checksendmeterimage)!
             {
                AppConstants.driverlocationtimer?.cancel()
                AppConstants.driverlocationtimer = nil
                
                let next: CameraViewController = self.storyboard!.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
                next.viewcontrollerself = self
                // next.movefrom = "documentphoto"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
            }
             else if ((self.checklocationaction)!){
                
                AppConstants.driverlocationtimer?.cancel()
                AppConstants.driverlocationtimer = nil
                self.showLoaderWithoutBackground()
                
                let dic1 = ["booking_id": AppConstants.bookingid,
                            "latitude": AppConstants.driverselectaddressLat,
                            "longitude": AppConstants.drivertselectaddressLng,
                            "accuracy": AppConstants.calculatedAccuracy] as [String : AnyObject]
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERMULTIPLEPICK
                ServiceManager.sharedInstance.delegate = self
                print(apiRequestUrl)
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverMultiplePickModel.self)
                
             }else if (checkDeliveryDropOtp) {
                
                AppConstants.driverlocationtimer?.cancel()
                AppConstants.driverlocationtimer = nil
//                 UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
//                     self.consignmentHiddenView.isHidden = false
//                     self.receiverNameTextField.text = self.boolingdetailsdata.data?.user?.userName ?? ""
//                     self.topslideview.isHidden = true
//                     self.Arrivestartendbtnview.isHidden = true
//                     })

                 AppConstants.receiverData = self.boolingdetailsdata.data?.user
                
                 self.presentVC("FinishTripViewController")
                 
             }else if (checkTollCharge)
             {
                AppConstants.driverlocationtimer?.cancel()
                AppConstants.driverlocationtimer = nil
                
                hiddentollfirstview.isHidden = false
             }
             else
            {
                AppConstants.driverlocationtimer?.cancel()
                AppConstants.driverlocationtimer = nil
                
                AppConstants.trackingscreenvalue = ""
                SocketManagerClass.sharedInstance.endrideevent(BookingId: AppConstants.bookingid, BookingStatus: "1005")
                
                self.showLoaderWithoutBackground()
                
                let dic1 = ["booking_id": AppConstants.bookingid,
                            "latitude": AppConstants.driverselectaddressLat,
                            "longitude": AppConstants.drivertselectaddressLng,
                            "accuracy": AppConstants.calculatedAccuracy,
                            "send_meter_image": ""] as [String : AnyObject]
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
                ServiceManager.sharedInstance.delegate = self
                print(apiRequestUrl)
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverEndRideModel.self)
            }
        }
    }
    
    @IBAction func topnavigatebtn_click(_ sender: Any) {
        
        let selectedNavigationType = UserDefaults.standard.string(forKey:AppConstants.UserDefaultKeys.NAVIGATIONTYPE) ?? ""
        
        if self.toplocationlbl.text == ""{
            self.showErrorAlert("Alert", alertMessage: "Please select drop location first".localized, VC: self)
        }else{
            
            if selectedNavigationType == ""
            {
                self.installedNavigationApps.removeAll()
                
                self.installedNavigationApps.append("Apple Map")
                
                if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)){
                    
                    self.installedNavigationApps.append("Google Map")
                    
                }
                
                // if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.waze.com")! as URL)){
                
                if(UIApplication.shared.canOpenURL(URL(string:"waze://")!)){
                    
                    self.installedNavigationApps.append("Waze")
                }
                
                let alert = UIAlertController(title: NSLocalizedString("Selection".localized, comment: ""), message: NSLocalizedString("Select Navigation App".localized, comment: ""), preferredStyle: .actionSheet)
                for app in self.installedNavigationApps {
                    let button = UIAlertAction(title: app, style: .default, handler: { (action) in
                        
                        
                        if(app == "Google Map"){
                         
                                UIApplication.shared.open(NSURL(string:
                                    "comgooglemaps-x-callback://?saddr=&daddr=\(Float(self.pickuplat)!),\(Float(self.pickuplong)!)&directionsmode=driving")! as URL, completionHandler: { (success) in
                                        print("Settings opened: \(success)") // Prints true
                                    UserDefaults.standard.set("Google Map", forKey: AppConstants.UserDefaultKeys.NAVIGATIONTYPE)
                                })
                            }
                       
                         else if(app == "Waze"){
                            
                                let latitude:Double = Double(self.pickuplat)!
                                let longitude:Double = Double(self.pickuplong)!
                                let urlStr:NSString = NSString(format: "waze://?ll=%f,%f&navigate=yes",latitude, longitude)
                                print(urlStr)
                                
                                UIApplication.shared.open(NSURL(string: (urlStr as String) as String)! as URL, completionHandler: { (success) in
                                    print("Settings opened: \(success)") // Prints true
                                    UserDefaults.standard.set("Waze", forKey: AppConstants.UserDefaultKeys.NAVIGATIONTYPE)
                                })
                                
                                //  UIApplication.shared.openURL(NSURL(string: (urlStr as String) as String)! as URL)
                            
                            }
                            
                            else if(app == "Apple Map"){
                                
                                UIApplication.shared.open(NSURL(string:
                                    "http://maps.apple.com/?saddr=&daddr=\(Float(self.pickuplat)!),\(Float(self.pickuplong)!)&directionsmode=driving")! as URL, completionHandler: { (success) in
                                        print("Settings opened: \(success)") // Prints true
                                    UserDefaults.standard.set("Apple Map", forKey: AppConstants.UserDefaultKeys.NAVIGATIONTYPE)
                                })
                            
                        } else{
                                
                            }
                })
                
                alert.addAction(button)
                }
                
                let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""),
                                                 style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                alert.popoverPresentationController?.sourceView = self.view
                alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
                alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                
                self.present(alert, animated: true){
                    print("option menu presented")
                }
            }
            else
            {
                if selectedNavigationType == "Apple Map"{
                    //open applemap
                    UIApplication.shared.open(NSURL(string:
                        "http://maps.apple.com/?saddr=&daddr=\(Float(self.pickuplat)!),\(Float(self.pickuplong)!)&directionsmode=driving")! as URL, completionHandler: { (success) in
                            print("Settings opened: \(success)") // Prints true
                    })
                    
                }else if selectedNavigationType == "Google Map"{
                    UIApplication.shared.open(NSURL(string:
                        "comgooglemaps-x-callback://?saddr=&daddr=\(Float(self.pickuplat)!),\(Float(self.pickuplong)!)&directionsmode=driving")! as URL, completionHandler: { (success) in
                            print("Settings opened: \(success)") // Prints true
                    })
                    
                }else if selectedNavigationType == "Waze"{
                    let latitude:Double = Double(self.pickuplat)!
                    let longitude:Double = Double(self.pickuplong)!
                    let urlStr:NSString = NSString(format: "waze://?ll=%f,%f&navigate=yes",latitude, longitude)
                    print(urlStr)
                    
                    UIApplication.shared.open(NSURL(string: (urlStr as String) as String)! as URL, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                }
            }
        }
    }
    
    @IBAction func sosbtn_click(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title:  "EMERGENCY FOR CALL".localized, message: "Are You in problem ?".localized, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes".localized , style: .default, handler: { (action: UIAlertAction!) in
            
           self.presentVC("EmergencyViewController")
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func cancelbtn_click(_ sender: Any) {
        
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
       
        self.trackhiddenview.isHidden = false
       
        showLoaderWithoutBackground()
        
        let dic1 = [:] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCANCELREASON
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCancelReasonModel.self)
        }
    
    @IBAction func hiddencancelbtn_click(_ sender: Any) {
         AppConstants.finddistancelat = ""
        self.trackhiddenview.isHidden = true
        self.timerForDriverLocation()
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        AppConstants.trackingscreenvalue = ""
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        self.presentVC("OnlineViewController")
       // self.dismissVC()
    }
    
    @IBAction func topslidebtn_click(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            
            if self.checkupdownvalue == 0{
                
                //self.toplocationview.isHidden = false
                self.updownbtnimageview.image = UIImage(named: "icons8-sort-up-filled-48")
                self.checkupdownvalue = 1
                self.locationviewheight.constant = 60
                self.toplocationview.isHidden = false
                self.topslidemainview.isHidden = false
                self.topslideview.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: UIScreen.main.bounds.size.width, height: 220)
                //self.toplocationview.frame = CGRect(x: 0, y: 125, width: UIScreen.main.bounds.size.width, height: 55)
            } else{
                self.updownbtnimageview.image = UIImage(named: "icons8-sort-down-filled-48 (1)")
                self.checkupdownvalue = 0
                self.locationviewheight.constant = 0
                self.toplocationview.isHidden = true
                self.topslidemainview.isHidden = true
                self.topslideview.frame = CGRect(x: 0, y: -65, width: UIScreen.main.bounds.size.width, height: 220)
                //self.toplocationview.frame = CGRect(x: 0, y: 65, width: UIScreen.main.bounds.size.width, height: 55)
            }
        }
        self.topslideview.layoutIfNeeded()
        self.topslideview.setNeedsDisplay()
    }
    
    @IBAction func topchangelobtn_click(_ sender: Any) {
        
        if checkdroplocationedit == 0{
            
          self.showErrorAlert("Alert".localized, alertMessage: AppConstants.boolingdetailsdata.data!.location?.locationMessage ?? "You Cannot Change Drop Location", VC: self)
            
        }else{
            let center = CLLocationCoordinate2DMake(Double(AppConstants.driverselectaddressLat)!, Double(AppConstants.drivertselectaddressLng)!)
            let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
            let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
            let bounds = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
    
        let autocompleteController = GMSAutocompleteViewController()
            autocompleteController.autocompleteBounds = bounds
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
            
        }
    }
    
 @objc func showtrack(notification: NSNotification){
    if AppConstants.chatCount == 1 {
            chatCountLabel.isHidden = false
    } else {
        riderChangesDropLocApi()
    }
}
    
    
func drawRoute(){
    
    markerList.removeAll()
    
    var bounds = GMSCoordinateBounds()
    
    if self.pickuplat == "0.0"{
        
    }else{
        
        self.originCordinate = CLLocationCoordinate2DMake(Double(self.pickuplat)!, Double(self.pickuplong)!)
        
        originMarker = GMSMarker(position: self.originCordinate)
        
        self.markerList.append(originMarker)
        if trackingdata.data?.stilMarker?.markerType == "PICK"{
            originMarker.icon = UIImage(named: "marker_locate")
        }else{
            
            originMarker.icon = UIImage(named: "marker-new_,home")
        }
        originMarker.map = self.mapview
    }
    
    self.destinationcordinate = CLLocationCoordinate2DMake(Double(self.driverstartlat)! , Double(self.driverstartlong)!)
    
    destinationMarker = GMSMarker(position: self.destinationcordinate)
    
    
    self.markerList.append(destinationMarker)
    destinationMarker.icon = UIImage(named: destinationmarkeriamge)
    //  destinationMarker.icon = UIImage(named: "ic_home_locaion_marker")
    // destinationMarker.map = self.mapview
    
    for marker in markerList {
        bounds = bounds.includingCoordinate(marker.position)
    }
    
    let coordinates = CLLocationCoordinate2D(latitude: Double(self.driverstartlat)!, longitude: Double(self.driverstartlong)!)
    
    CATransaction.begin()
    CATransaction.setAnimationDuration(1.0)
    destinationMarker.rotation = Double(bearingfactor)!
    CATransaction.commit()
    
    CATransaction.begin()
    CATransaction.setAnimationDuration(1.0)
    destinationMarker.position =  coordinates
    CATransaction.commit()
    destinationMarker.map = mapview
    
    let polydatavalue = trackingdata.data?.polydata?.polyline ?? ""
    
    if polydatavalue == ""{
        
        
    }else{
        let polyline12 = GMSPolyline(path: GMSPath.init(fromEncodedPath: (trackingdata.data?.polydata?.polyline)!))
        
        polyline12.strokeColor = PListUtility.getColorFromHex(hexString: "#" + (trackingdata.data?.polydata?.polylineColor)!)
        
        if let n = NumberFormatter().number(from: (trackingdata.data?.polydata?.polylineWidth)!) {
            let f = CGFloat(truncating: n)
            polyline12.strokeWidth = f
        }
        //            polyline12.strokeWidth = CGFloat(bookingtrackingdata.data?.polydata?.polylineWidth)
        polyline12.map = self.mapview
    }
    
    if self.pickuplat == "0.0"{
        let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 220, left: 30, bottom: 100, right: 30))
        mapview.animate(with: update)
        mapview.animate(toZoom: 15)
    }else{
        
        let coordinateTo = CLLocation(latitude: Double(self.pickuplat)!, longitude: Double(self.pickuplong)!)
        
        let newlat = Double(self.driverstartlat)
        let newlong = Double(self.driverstartlong)
        
        let coordinateFrom = CLLocation(latitude: newlat! , longitude: newlong!)
        
        let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
        
        print(distanceInMeter)
        
        if distanceInMeter < 50.0{
            
            let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 220, left: 30, bottom: 100, right: 30))
            mapview.animate(with: update)
            
            mapview.animate(toZoom: 15)
        }else{
            let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 220, left: 30, bottom: 100, right: 30))
            mapview.animate(with: update)
            
        }
    }
    }
}


extension TrackRideViewController: UIGestureRecognizerDelegate {
  
    @objc func wasSwiped(gestureRecognizer: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 0.5) {
            
            switch gestureRecognizer.direction {
           
            case .up:
                //            gestureRecognizer.view?.frame.origin.y += 80
                self.checkupdownvalue = 0
                self.topslideview.frame = CGRect(x: 0, y: -65, width: UIScreen.main.bounds.size.width, height: 220)
                //self.toplocationview.frame = CGRect(x: 0, y: 65, width: UIScreen.main.bounds.size.width, height: 55)
                self.topslidemainview.isHidden = true
                self.toplocationview.isHidden = true
                self.locationviewheight.constant = 0
                self.updownbtnimageview.image = UIImage(named: "icons8-sort-down-filled-48 (1)")

            case .down:
                //            gestureRecognizer.view?.frame.origin.y -= 80
                
                self.checkupdownvalue = 1
                self.topslideview.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: UIScreen.main.bounds.size.width, height: 220)
                //self.toplocationview.frame = CGRect(x: 0, y: 125, width: UIScreen.main.bounds.size.width, height: 55)
                self.topslidemainview.isHidden = false
                self.toplocationview.isHidden = false
                self.locationviewheight.constant = 60
                self.updownbtnimageview.image = UIImage(named: "icons8-sort-up-filled-48")

            case .right:
                
                    print("Swiped right")
                    
                    if self.statusofbooking == 1002{
                        
                        AppConstants.driverlocationtimer?.cancel()
                        AppConstants.driverlocationtimer = nil
                     
                        self.showLoaderWithoutBackground()
                        let dic1 = ["booking_id": AppConstants.bookingid,
                            "latitude": AppConstants.driverselectaddressLat,
                            "longitude": AppConstants.drivertselectaddressLng,
                            "accuracy": AppConstants.calculatedAccuracy] as [String : AnyObject]
                        
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERARRIVE
                        ServiceManager.sharedInstance.delegate = self
                        print(apiRequestUrl)
                        
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverArriveModel.self)
                      
                    }
                    if self.statusofbooking == 1003{
                        
                        if (self.boolingdetailsdata.data!.rideOtpVerify == 1){
                            
                            self.presentVC("OTPVerificationViewController")
                        }
                        
                        else
                        {
                            if (self.checksendmeterimage)!{
                         
                            AppConstants.driverlocationtimer?.cancel()
                            AppConstants.driverlocationtimer = nil
                            
                            
                            let next: CameraViewController = self.storyboard!.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
                            next.viewcontrollerself = self
                            // next.movefrom = "documentphoto"
                            next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                            next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                            self.present(next, animated: true, completion: nil)
                            }else{
                         
                            if self.toplocationlbl.text == ""{
                                self.showErrorAlert("Alert".localized, alertMessage: "Please select drop location first".localized, VC: self)
                            }else{
                                
                                AppConstants.driverlocationtimer?.cancel()
                                AppConstants.driverlocationtimer = nil
                                
                                self.showLoaderWithoutBackground()
                                
                                let dic1 = ["booking_id": AppConstants.bookingid,
                                            "latitude": AppConstants.driverselectaddressLat,
                                            "longitude": AppConstants.drivertselectaddressLng,
                                            "accuracy": AppConstants.calculatedAccuracy,
                                            "send_meter_image": ""] as [String : AnyObject]
                                
                                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSTARTRIDE
                                ServiceManager.sharedInstance.delegate = self
                                print("")
                                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverStartRideModel.self)
                            }
                        }
                        }
                    }
                    if self.statusofbooking == 1004{
                        
                         let checkTollCharge = UserDefaults.standard.bool(forKey: "CheckTollCharges")
                        
                       if (self.checksendmeterimage)!{
                            
                            AppConstants.driverlocationtimer?.cancel()
                            AppConstants.driverlocationtimer = nil
                            
                            
                            let next: CameraViewController = self.storyboard!.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
                            next.viewcontrollerself = self
                            // next.movefrom = "documentphoto"
                            next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                            next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                            self.present(next, animated: true, completion: nil)
                        }else if ((self.checklocationaction)!){
                            
                            AppConstants.driverlocationtimer?.cancel()
                            AppConstants.driverlocationtimer = nil
                            
                            self.showLoaderWithoutBackground()
                            
                            let dic1 = ["booking_id": AppConstants.bookingid,
                                        "latitude": AppConstants.driverselectaddressLat,
                                        "longitude": AppConstants.drivertselectaddressLng,
                                        "accuracy": AppConstants.calculatedAccuracy] as [String : AnyObject]
                            
                            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERMULTIPLEPICK
                            ServiceManager.sharedInstance.delegate = self
                            print(apiRequestUrl)
                            
                            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverMultiplePickModel.self)
                            
                            
                       }else if (self.checkDeliveryDropOtp) {
                        
                        AppConstants.driverlocationtimer?.cancel()
                        AppConstants.driverlocationtimer = nil
                           
                           
//                           UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
//                               self.consignmentHiddenView.isHidden = false
//                               self.receiverNameTextField.text = self.boolingdetailsdata.data?.user?.userName ?? ""
//                               self.topslideview.isHidden = true
//                               self.Arrivestartendbtnview.isHidden = true
//
//                               })
                           
                           AppConstants.receiverData = self.boolingdetailsdata.data?.user
                           self.presentVC("FinishTripViewController")


                       }else if (checkTollCharge)
                       {
                        
                        AppConstants.driverlocationtimer?.cancel()
                        AppConstants.driverlocationtimer = nil
                        
                        self.hiddentollfirstview.isHidden = false
                        
                       }else
                        {
                        
                        AppConstants.driverlocationtimer?.cancel()
                        AppConstants.driverlocationtimer = nil
                            
                        AppConstants.trackingscreenvalue = ""
                        SocketManagerClass.sharedInstance.endrideevent(BookingId: AppConstants.bookingid, BookingStatus: "1005")
                        
                        self.showLoaderWithoutBackground()
                        
                        let dic1 = ["booking_id": AppConstants.bookingid,
                                    "latitude": AppConstants.driverselectaddressLat,
                                    "longitude": AppConstants.drivertselectaddressLng,
                                    "accuracy": AppConstants.calculatedAccuracy,
                                    "send_meter_image": ""] as [String : AnyObject]
                        
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE
                        ServiceManager.sharedInstance.delegate = self
                        print(apiRequestUrl)
                        
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverEndRideModel.self)
                            
                        }
                }
                
                default:
                    break
            
            }
        }
        
        self.topslideview.layoutIfNeeded()
        self.topslideview.setNeedsDisplay()
    }
}

extension TrackRideViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tablecount!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tracktableview.dequeueReusableCell(withIdentifier: "cancelchargecell", for: indexPath) as! CancelChargeTableViewCell
        cell.cancelchargetypelbl.text = drivercancelreasondata.data![indexPath.row].reason
        
       
        let tableheight = tracktableview.contentSize.height
        print(tableheight)
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            innerviewheight.constant = tableheight + 100.0
            
        }else{
            
            innerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        if(check2 == indexPath.row)
        {
            
            cell.cancelchargeimageview.image = UIImage(named: "icons8-0-percent-filled-50")
            
        }else{
            cell.cancelchargeimageview.image = UIImage(named: "icons8-0-percent-filled-50")
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tracktableview.deselectRow(at: indexPath, animated: true)
        check2 = indexPath.row
        selectindexvalue2 = indexPath.row
        print(selectindexvalue2)
        tracktableview.reloadData()
        trackhiddenview.isHidden = true
        
        cancelReasonId = drivercancelreasondata.data![selectindexvalue2].id
       
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        
        showLoaderWithoutBackground()
        
        let dic1 = ["cancel_reason_id": cancelReasonId!,
            "booking_id": AppConstants.bookingid
                   ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCANCELRIDE
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCancelRideModel.self)
    }
}

extension TrackRideViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverBookingDetailoneModel{
            let data:DriverBookingDetailoneModel = responseData
            
            boolingdetailsdata = data
            AppConstants.boolingdetailsdata = data
            if (boolingdetailsdata.result == "1") {
          
                hideLoaderWithoutBackground()
                
                self.dialogValueContactLabel.text = data.data?.receiverDetails?.contact ?? ""
                
                self.dialogValueNameLabel.text = data.data?.receiverDetails?.name ?? ""
                
                checkDeliveryDropOtp = data.data?.deliveryDropOtp ?? false
                
                AppConstants.bookingid = String((data.data!.id ?? Int(AppConstants.bookingid))!)
                
                print(AppConstants.bookingid)
                
              SocketManagerClass.sharedInstance.listentrackingdata(BookingId: AppConstants.bookingid)
                
                self.arrivelbl.text = data.data?.location?.tripStatusText ?? ""
                
                AppConstants.statusofbooking = (data.data?.bookingStatus ?? 0)!
                
                checkwaitingbtnvisibility = data.data?.onridepausebutton ?? false
                
                checkwaitingvalue = String(data.data?.onridewaitingtype ?? 0)
                
                if AppConstants.statusofbooking == 1004{
                
                if checkwaitingbtnvisibility!{
                    
                    self.waitingbtnview.isHidden = false
                    
                    if checkwaitingvalue == "2"{
                        
                        waitingbtnimage.image = UIImage(named: "icons_on_64")
                        
                    }else{
                        
                        waitingbtnimage.image = UIImage(named: "icons_off_64")
                        
                    }
                }else{
                    
                    self.waitingbtnview.isHidden = true
                    
                }
                    
                    
                }else{
                    self.waitingbtnview.isHidden = true
                    
                }
               self.arrivelblbtntext.text = data.data?.location?.tripStatusText ?? ""
                
                
                if data.data?.user?.userProfileImage ?? "" == ""{
                    
                    topuserimageview.image = UIImage(named: "profileeee")
                    
                }else{
                    
                    AppConstants.downloadimage(imagename: (data.data?.user?.userProfileImage)!, imageview: topuserimageview, placeholderimage: "profileeee")
                    
                }
                if (data.data?.familyMemberDetails?.familyVisibility)!{
                    
                    childhiddenview.isHidden = false
                    
                    childnametext.text = "Name : " + (data.data?.familyMemberDetails?.familyMemberName ?? "")
                    
                    childphonetext.text = "Phone : " + (data.data?.familyMemberDetails?.familyMemberPhoneNumber ?? "")
                    
                }else{
                    
                    childhiddenview.isHidden = true
                }
                self.topviewnamelbl.text = data.data?.user?.userName ?? ""
                self.topviewcontactlbl.text = data.data?.user?.userPhone ?? ""
                self.toppaymenttext.text = data.data?.paymentMethod?.paymentMethod ?? ""
                self.toplocationlbl.text = data.data?.location?.locationText ?? ""
                self.topratinglbl.text = data.data?.user?.rating ?? ""
                self.toppaymentlbl.text = "Payment".localized
                
                checksendmeterimage = data.data?.sendMeterImage
                self.checklocationaction = data.data?.location?.locationAction
                
                if (data.data?.additionalnotes ?? "" == ""){
                    
                    topinfoview.isHidden = true
                   
                }else{
                    
                    topinfoview.isHidden = false
                    
                    self.topinfoinnerview.makeViewCircular()
                    //        self.topchatinnerview.layer.backgroundColor = UIColor.appThemeColor().cgColor
                    self.topinfoinnerview.backgroundColor = PListUtility.getColorFromHex(hexString: "#e67e22")
                }
                
                if ((data.data!.location?.locationEditable)!){
                    
                    checkdroplocationedit = 1
                    
                // self.topchangelocbtn.isUserInteractionEnabled = true
                }else{
                    
                    checkdroplocationedit = 0
                // self.topchangelocbtn.isUserInteractionEnabled = false
                }
                self.topratingview.isUserInteractionEnabled = false
                if data.data?.user?.rating == ""{
                
                }else{
                    
                    self.topratingview.rating = Float((data.data?.user?.rating)!)!
                }
                
                if data.data?.stillMarker?.markerLat == ""{
                
                    AppConstants.pickdroplat = "0.0"
                    AppConstants.pickdroplng = "0.0"
                }else
                {
                    
                    AppConstants.pickdroplat = (data.data?.stillMarker?.markerLat ?? "0.0")!
                    
                    AppConstants.pickdroplng = (data.data?.stillMarker?.markerLong ?? "0.0")!
                    
                pickuplat = (data.data?.stillMarker?.markerLat ?? "0.0")!
                pickuplong = (data.data?.stillMarker?.markerLong ?? "0.0")!
                }
                driverstartlat = (data.data?.movableMarker?.driverMarkerLat ?? "0.0")!
                driverstartlong = (data.data?.movableMarker?.driverMarkerLong ?? "0.0")!
                bearingfactor = (data.data?.movableMarker?.driverMarkerBearing ?? "0.0")!
                statusofbooking = (data.data?.bookingStatus ?? 0)!
                
                if (data.data?.cancelable)!{
//                    self.cancelbtnview.isHidden = false
//                    self.cancelbtnviewwidth.constant = 100.0
                   // self.cancelbtn.isUserInteractionEnabled = true
                }else{
                     self.cancelbtnview.isHidden = true
                    self.cancelbtnviewwidth.constant = 0.0
                   // self.cancelbtn.isUserInteractionEnabled = false
                }
                
                if (data.data?.sosVisibility)!{
                    
                    sosview.isHidden = false
                    
                }else{
                    sosview.isHidden = true
                }
           
              //  mapview.clear()
                
                if statusofbooking == 1005{
                    self.presentVC("RideFareViewController")
                }else{
                    AppConstants.finddistancelat = ""
                    self.timerForDriverLocation()
                }
            }
        
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
             //   showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverTrackingModel{
            let data: DriverTrackingModel = responseData
            
            trackingdata = data
            if (data.result == "1") {
                
               // hideLoaderWithoutBackground()
                
              //  self.toplocationlbl.text = data.data?.location?.locationText
                
                if data.data?.stilMarker?.markerLat == ""{
                  
                    pickuplat = "0.0"
                    pickuplong = "0.0"
                }else{
                
     //           self.arrivelbl.text = data.data?.location?.tripStatusText
//                self.topviewnamelbl.text = data.data?.user?.userName
//                self.topviewcontactlbl.text = data.data?.user?.userPhone
//                self.toppaymenttext.text = data.data?.paymentMethod?.paymentMethod
//
//                self.topratinglbl.text = data.data?.user?.rating
//                self.topratingview.rating = Float((data.data?.user?.rating)!)!
                    
                    
//
                pickuplat = (data.data?.stilMarker?.markerLat ?? "0.0")!
                pickuplong = (data.data?.stilMarker?.markerLong ?? "0.0")!
                }
                
                AppConstants.emergencylatitude = (data.data?.movableMarkerType?.driverMarkerLat ?? "0.0")!
                
                AppConstants.emergencylongitude = (data.data?.movableMarkerType?.driverMarkerLong ?? "0.0")!
                
                driverstartlat = (data.data?.movableMarkerType?.driverMarkerLat ?? "0.0")!
                driverstartlong = (data.data?.movableMarkerType?.driverMarkerLong ?? "0.0")!
                
                bearingfactor = (data.data?.movableMarkerType?.driverMarkerBearing ?? "0.0")!
                
                let markerimage = (data.data?.movableMarkerType?.drivermarkerName ?? "car.png")!
                
                let markervalue = markerimage.components(separatedBy: ".")
                
                destinationmarkeriamge = markervalue[0]
              
                AppConstants.finddistancelat = ""
                
                let accuracyvalue = Float(data.data?.movableMarkerType?.drivermarkerAccuracy ?? "0.0")!
                
                if accuracyvalue < 100.0{
                    
                    mapview.clear()
                    
                    self.drawRoute()
                    
                }else{
                }
                
               // self.timerForDriverLocation()
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
              //  showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        
        if let responseData = response as? DriverCancelReasonModel{
            let data:DriverCancelReasonModel = responseData
            
            drivercancelreasondata = data
            
            if (drivercancelreasondata.result == "1") {
                
                hideLoaderWithoutBackground()
                
                tablecount = drivercancelreasondata.data?.count
                tracktableview.reloadData()
             
            }else if drivercancelreasondata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
              //  showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverCancelRideModel{
            let data:DriverCancelRideModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                self.presentVC("OnlineViewController")

            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverArriveModel{
            let data:DriverArriveModel = responseData
            
            arrivedata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                AppConstants.bookingid = String((data.data!.id ?? Int(AppConstants.bookingid))!)
                
                self.arrivelbl.text = data.data?.location?.tripStatusText ?? ""
                
                 self.arrivelblbtntext.text = data.data?.location?.tripStatusText ?? ""
                
                if data.data?.user?.userProfileImage ?? "" == ""{
                    
                    topuserimageview.image = UIImage(named: "profileeee")
                    
                }else{
                    
                    AppConstants.downloadimage(imagename: (data.data?.user?.userProfileImage)!, imageview: topuserimageview, placeholderimage: "profileeee")
                    
                }
                self.topviewnamelbl.text = data.data?.user?.userName ?? ""
                self.topviewcontactlbl.text = data.data?.user?.userPhone ?? ""
                self.toppaymenttext.text = data.data?.paymentMethod?.paymentMethod ?? ""
                self.toplocationlbl.text = data.data?.location?.locationText ?? ""
                self.topratinglbl.text = data.data?.user?.rating ?? ""
                self.toppaymentlbl.text = "Payment".localized
                
                checksendmeterimage = data.data?.sendMeterImage
//                checklocationaction = data.data?.location?.locationAction
                
                if data.data?.user?.rating == ""{
                    
                }else{
                    
                    self.topratingview.rating = Float((data.data?.user?.rating)!)!
                    
                }
                
                statusofbooking = (data.data?.bookingStatus)!
                
                AppConstants.statusofbooking = (data.data?.bookingStatus ?? 0)!
                
                
            //    LocationManagerClass.sharedInstance.trackingemit()
                
                if (data.data?.cancelable)!{
//                    self.cancelbtnview.isHidden = false
//                    self.cancelbtnviewwidth.constant = 100.0
                }else{
                     self.cancelbtnview.isHidden = true
                    self.cancelbtnviewwidth.constant = 0.0
                }
                
                if (data.data?.sosVisibility)!{
                    
                    sosview.isHidden = false
                    
                }else{
                    sosview.isHidden = true
                }
                if ((data.data!.location?.locationEditable)!){
                    
                    checkdroplocationedit = 1
                    
                   // self.topchangelocbtn.isUserInteractionEnabled = true
                }else{
                    checkdroplocationedit = 0
                  //  self.topchangelocbtn.isUserInteractionEnabled = false
                }
                AppConstants.finddistancelat = ""
                self.timerForDriverLocation()
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverStartRideModel{
            let data:DriverStartRideModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                AppConstants.bookingid = String((data.data!.id ?? Int(AppConstants.bookingid))!)
                
                self.arrivelbl.text = data.data?.location?.tripStatusText ?? ""
                 self.arrivelblbtntext.text = data.data?.location?.tripStatusText ?? ""
                
                if data.data?.user?.userProfileImage ?? "" == ""{
                    
                    topuserimageview.image = UIImage(named: "profileeee")
                    
                }else{
                    
                    AppConstants.downloadimage(imagename: (data.data?.user?.userProfileImage)!, imageview: topuserimageview, placeholderimage: "profileeee")
                }
                
                if checkwaitingbtnvisibility!{
                    
                    self.waitingbtnview.isHidden = false
                    
                    if checkwaitingvalue == "2"{
                        
                        waitingbtnimage.image = UIImage(named: "icons_on_64")
                        
                    }else{
                        
                        waitingbtnimage.image = UIImage(named: "icons_off_64")
                    }
                }else{
                    
                    self.waitingbtnview.isHidden = true
                }
                
                self.topviewnamelbl.text = data.data?.user?.userName ?? ""
                self.topviewcontactlbl.text = data.data?.user?.userPhone ?? ""
                self.toppaymenttext.text = data.data?.paymentMethod?.paymentMethod ?? ""
                self.toplocationlbl.text = data.data?.location?.locationText ?? ""
                self.topratinglbl.text = data.data?.user?.rating ?? ""
                self.toppaymentlbl.text = "Payment".localized
                 checksendmeterimage = data.data?.sendMeterImage
                 self.checklocationaction = data.data?.location?.locationAction
                
                self.manualtollcharges = data.data?.manualtollenable ?? false
                UserDefaults.standard.set(self.manualtollcharges, forKey: "CheckTollCharges")
               
                if data.data?.user?.rating == ""{
                    
                }else{
                    
                    self.topratingview.rating = Float((data.data?.user?.rating)!)!
                }
                
                statusofbooking = (data.data?.bookingStatus)!
                
                AppConstants.statusofbooking = (data.data?.bookingStatus ?? 0)!
                
               //  LocationManagerClass.sharedInstance.trackingemit()
                
                if (data.data?.cancelable)!{
//                    self.cancelbtnview.isHidden = false
//                    self.cancelbtnviewwidth.constant = 100.0
                }else{
                   self.cancelbtnview.isHidden = true
                    self.cancelbtnviewwidth.constant = 0.0
                }
                
                if (data.data?.sosVisibility)!{
                    
                    sosview.isHidden = false
                    
                }else{
                    sosview.isHidden = true
                    
                }
                
                if ((data.data!.location?.locationEditable)!){
                    
                    checkdroplocationedit = 1
                    
                    //self.topchangelocbtn.isUserInteractionEnabled = true
                }else{
                    checkdroplocationedit = 0
                    //self.topchangelocbtn.isUserInteractionEnabled = false
                }
                
                cancelbtnview.isHidden = true
                AppConstants.finddistancelat = ""
               self.timerForDriverLocation()
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? WaitingTimeModel{
            let data:WaitingTimeModel = responseData
            
            if (data.result == "1"){
                hideLoaderWithoutBackground()
                checkwaitingvalue = String(data.type ?? 0)
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverDropChangeModel{
            let data:DriverDropChangeModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                AppConstants.bookingid = String((data.data!.id ?? Int(AppConstants.bookingid))!)
           
                self.arrivelbl.text = data.data?.location?.tripStatusText ?? ""
                 self.arrivelblbtntext.text = data.data?.location?.tripStatusText ?? ""
                
                if data.data?.user?.userProfileImage ?? "" == ""{
                    
                    topuserimageview.image = UIImage(named: "profileeee")
                    
                }else{
                    
                    AppConstants.downloadimage(imagename: (data.data?.user?.userProfileImage)!, imageview: topuserimageview, placeholderimage: "profileeee")
                    
                }
                
                self.topviewnamelbl.text = data.data?.user?.userName ?? ""
                self.topviewcontactlbl.text = data.data?.user?.userPhone ?? ""
                self.toppaymenttext.text = data.data?.paymentMethod?.paymentMethod ?? ""
                self.toplocationlbl.text = data.data?.location?.locationText ?? ""
                self.topratinglbl.text = data.data?.user?.rating ?? ""
                self.toppaymentlbl.text = "Payment".localized
                if data.data?.user?.rating == ""{
                    
                }else{
                    self.topratingview.rating = Float((data.data?.user?.rating)!)!
                }
                
                statusofbooking = (data.data?.bookingStatus)!
                
                AppConstants.statusofbooking = (data.data?.bookingStatus ?? 0)!
                
              //   LocationManagerClass.sharedInstance.trackingemit()
                
                if (data.data?.cancelable)!{
//                     self.cancelbtnview.isHidden = false
//                    self.cancelbtnviewwidth.constant = 100.0
                }else{
                      self.cancelbtnview.isHidden = true
                    self.cancelbtnviewwidth.constant = 0.0
                }
                
                if (data.data?.sosVisibility)!{
                    sosview.isHidden = false
                }
                else{
                    sosview.isHidden = true
                }
                
                if ((data.data!.location?.locationEditable)!){
                    checkdroplocationedit = 1
                    
                   // self.topchangelocbtn.isUserInteractionEnabled = true
                }else{
                    checkdroplocationedit = 0
                  //  self.topchangelocbtn.isUserInteractionEnabled = false
                }
                
                AppConstants.finddistancelat = ""
                self.timerForDriverLocation()
    
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverEndRideModel{
            let data:DriverEndRideModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                self.presentVC("OnlineViewController")
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
                UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    self.consignmentHiddenView.isHidden = true
                    self.receiverNameTextField.text = self.boolingdetailsdata.data?.user?.userName ?? ""
                    self.Arrivestartendbtnview.isHidden = false
                    self.topslideview.isHidden = false
                    })
                }
            }
        
        if let responseData = response as? DriverMultiplePickModel{
            let data:DriverMultiplePickModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                AppConstants.bookingid = String((data.data!.id ?? Int(AppConstants.bookingid))!)
                
                self.arrivelbl.text = data.data?.location?.tripStatusText ?? ""
                 self.arrivelblbtntext.text = data.data?.location?.tripStatusText ?? ""
                
                if data.data?.user?.userProfileImage ?? "" == ""{
                    
                    topuserimageview.image = UIImage(named: "profileeee")
                    
                }else{
                    
                    AppConstants.downloadimage(imagename: (data.data?.user?.userProfileImage)!, imageview: topuserimageview, placeholderimage: "profileeee")
                    
                }
                
                self.topviewnamelbl.text = data.data?.user?.userName ?? ""
                self.topviewcontactlbl.text = data.data?.user?.userPhone ?? ""
                self.toppaymenttext.text = data.data?.paymentMethod?.paymentMethod ?? ""
                self.toplocationlbl.text = data.data?.location?.locationText ?? ""
                self.topratinglbl.text = data.data?.user?.rating ?? ""
                self.toppaymentlbl.text = "Payment".localized
                
                
              self.checklocationaction = data.data?.location?.locationAction
                
                
                if data.data?.user?.rating == ""{
                    
                }else{
                    
                    self.topratingview.rating = Float((data.data?.user?.rating)!)!
                    
                }
                
                statusofbooking = (data.data?.bookingStatus)!
                
                AppConstants.statusofbooking = (data.data?.bookingStatus ?? 0)!
                
             //    LocationManagerClass.sharedInstance.trackingemit()
                
                if (data.data?.cancelable)!{
//                     self.cancelbtnview.isHidden = false
//                    self.cancelbtnviewwidth.constant = 100.0
                }else{
                    self.cancelbtnview.isHidden = true
                    self.cancelbtnviewwidth.constant = 0.0

                }
                
                if (data.data?.sosVisibility)!{
                    
                    sosview.isHidden = false
                    
                }else{
                    sosview.isHidden = true
                    
                }
                
                if ((data.data!.location?.locationEditable)!){
                    checkdroplocationedit = 1
                  
                    
                  //  self.topchangelocbtn.isUserInteractionEnabled = true
                }else{
                    checkdroplocationedit = 0
                   // self.topchangelocbtn.isUserInteractionEnabled = false
                }
                AppConstants.finddistancelat = ""
               self.timerForDriverLocation()
                
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
         hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
    
}

extension TrackRideViewController: GMSAutocompleteViewControllerDelegate{
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
       
        
        self.toplocationlbl.text = place.formattedAddress
        
        dropchangelat = String(place.coordinate.latitude)
        dropchangelong = String(place.coordinate.longitude)
        
        self.dropchange = 1
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}




@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
