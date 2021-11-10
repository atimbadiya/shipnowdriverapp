//
//  FullTripDetailsViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import StarryStars
import ObjectMapper
import AlamofireImage

class FullTripDetailsViewController: BaseViewController {
    
    @IBOutlet weak var childdetailsviewheight: NSLayoutConstraint!
    var drivercancelreasondata: DriverCancelReasonModel!
    @IBOutlet weak var childnametext: UILabel!
    @IBOutlet weak var childphonetext: UILabel!
    @IBOutlet weak var childdetailstextlbl: UILabel!
    @IBOutlet weak var childdetailsview: UIView!
    @IBOutlet weak var tblviewChangeStatus: UITableView!
    
//    @IBOutlet weak var forcancellingchargetext: UILabel!
//
//    @IBOutlet weak var forcancelchargeheight: NSLayoutConstraint!
    
    var checkcancelprice = "0"
    var reasontablecount:Int?
    var check2 = 0
    var selectindexvalue2 = 0
    
    var cancelReasonId:Int?
    @IBOutlet weak var navBtnDropoff: UIButton!
    @IBOutlet weak var navBtnPickup: UIButton!
    @IBOutlet weak var hiddeninnerviewheight: NSLayoutConstraint!
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var hiddeninnerview: UIView!
    @IBOutlet weak var hiddencancelridelbl: UILabel!
    @IBOutlet weak var tableview: UITableView!
    // var cancelreasondata: CancelReasonModel!
    @IBOutlet weak var hiddencancelbtn: UIButton!
    @IBOutlet weak var orderStatusHiddenView: UIView!
    @IBOutlet weak var orderStatusInnerView: UIView!
    var orderStatusList : [String] = []
    var statusRowsIcons : [String] = []
    var orderStatusCodeList: [String] = []
    //   @IBOutlet weak var hiddenview: UIView!
    
    
 //   @IBOutlet weak var innerhiddenview: UIView!
    
  //  @IBOutlet weak var hiddentableview: UITableView!
    
 //   @IBOutlet weak var hiddenviewcancelbtntext: UIButton!
//    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    
  //  @IBOutlet weak var hiddenviewokbtntext: UIButton!
    
    
 //   @IBOutlet weak var tophiddenviewcancelridetextlbl: UILabel!
    @IBOutlet weak var canceltopbtnview: UIView!
    @IBOutlet weak var canceltopbtn: UIButton!
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var firsttextlbl: UILabel!
    
    var check = 1000
    var selectcancelreasonid = ""
    
    var newtablecount = 0
    var installedNavigationApps: [String] = ["Apple Maps"]
    @IBOutlet weak var toptripdetailstextlbl: UILabel!
    @IBOutlet weak var Detailstableview: UITableView!
    @IBOutlet weak var topviewheight: NSLayoutConstraint!//410
    
    var ridedetailsdata: RideDetailsModel!
  
    @IBOutlet weak var corporateDetailsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tripIdView: UIView!
    @IBOutlet weak var mapimageview: UIView!
    @IBOutlet weak var scanCodeView: UIView!
    @IBOutlet weak var mapimageviewheight: NSLayoutConstraint!//150
    @IBOutlet weak var mapimage: UIImageView!
    @IBOutlet weak var dateview: UIView!
    
    var tablecount = 0
    
    @IBOutlet weak var dateviewheight: NSLayoutConstraint!//50
    @IBOutlet weak var datetext: UILabel!
    @IBOutlet weak var cartypenametext: UILabel!
    @IBOutlet weak var estmitatepricetext: UILabel!
    @IBOutlet weak var locationview: UIView!
    @IBOutlet weak var locationviewheight: NSLayoutConstraint!//160
    
    @IBOutlet weak var lblBookingStatus: UILabel!
    @IBOutlet weak var dropupimage: UIImageView!
    @IBOutlet weak var droptext: UILabel!
    @IBOutlet weak var pickuptext: UILabel!
    @IBOutlet weak var pickupimage: UIImageView!
    @IBOutlet weak var droplocationview: UIView!
    
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var imgviewEditStatus: UIImageView!
    @IBOutlet weak var driverdetailsview: UIView!
    @IBOutlet weak var ratingvalue: RatingView!
    @IBOutlet weak var ratingtext: UILabel!
    
    @IBOutlet weak var driverdetailsheight: NSLayoutConstraint!//60
    @IBOutlet weak var drivernametext: UILabel!
    @IBOutlet weak var ratedrivertextlbl: UILabel!
    @IBOutlet weak var driverimageview: UIImageView!
    @IBOutlet weak var pickuplocationview: UIView!
    
    @IBOutlet weak var distancetimeview: UIView!
    @IBOutlet weak var distancetimeviewheight: NSLayoutConstraint!
    @IBOutlet weak var distancetimeimage: UIImageView!
    @IBOutlet weak var totalpricetext: UILabel!
    @IBOutlet weak var distancetext: UILabel!
    @IBOutlet weak var corporateDetailsView: UIView!
    @IBOutlet weak var timetext: UILabel!
    var bookingStatus = ""
    
    var totalheight = 750.0
    
    @IBOutlet weak var lblTrackingID: UILabel!
    @IBOutlet weak var lblCorporateName: UILabel!
    @IBOutlet weak var lblTotalProducts: UILabel!
    @IBOutlet weak var lblScannedProducts: UILabel!
    
    @IBOutlet weak var additionalInfoView: UIView!
    @IBOutlet weak var lblAdditionalInfo: UILabel!
    @IBOutlet weak var additionalInfoViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reasontablecount = 0
        
        AppConstants.cancelbtnvaluematch = "2"
        self.hiddenview.isHidden = true
        hiddencancelbtn.setTitle("Cancel".localized, for: .normal)
        toptripdetailstextlbl.text = "Trip Details".localized
//        tophiddenviewcancelridetextlbl.text = "Cancel Ride".localized
//        hiddenviewcancelbtntext.setTitle("Cancel".localized, for: UIControlState.normal)
//        hiddenviewokbtntext.setTitle("OK".localized, for: UIControlState.normal)
        
        // AppConstants.cancelbtnvaluematch  = "2"
        
        showLoaderWithoutBackground()
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.callApi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func callApi(){
        
        let dic1 = ["booking_id":AppConstants.bookingid
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERBOOKINGHISTORYDetail
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideDetailsModel.self)
    }
    
    @IBAction func hiddencancelbtn_clcik(_ sender: Any) {
        
        hiddenview.isHidden = true
        //tableview.reloadData()
    }
    
    @IBAction func canceltopbtn_click(_ sender: Any) {
        
        self.hiddenview.isHidden = false
        //tableview.reloadData()
        
        showLoaderWithoutBackground()
        
        let dic1 = [:] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCANCELREASON
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCancelReasonModel.self)
    }
    
    @IBAction func firstbtnclick(_ sender: Any)
    {
        if ridedetailsdata.data?.buttonVisibility?.action == "PARTIAL_ACCEPT_API"
        {
            let dic1 = ["booking_id":AppConstants.bookingid
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERPARTIALACCEPT
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverBookingDetailoneModel.self)
            
        }else if ridedetailsdata.data?.buttonVisibility?.action == "START_TO_PICK"
        {
            let dic1 = ["latitude":AppConstants.driverselectaddressLat,
                        "longitude":AppConstants.drivertselectaddressLng,
                        "booking_id":AppConstants.bookingid,
                        "accuracy":AppConstants.calculatedAccuracy
                ] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERACCEPTRIDE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverAcceptModels.self)
            
        }else if ridedetailsdata.data?.buttonVisibility?.action == "OPEN_TRACKSCREEN"
        {
           self.presentVC("TrackRideViewController")
            
        }else{
            
        }
    }
    
    @IBAction func ratedriverbtn_click(_ sender: Any) {
        
        if (ridedetailsdata.data?.holderUser?.holderuserdata!.ratingButtonEnable)!{
            
         self.presentVC("RideFareViewController")
            
        }else
        {
            
        }
    }
    
    @objc func changeOrderStatusClicked(_ sender: Any) {
        
        if AppConstants.triptypeid != 3
        {
            orderStatusHiddenView.isHidden = false
            orderStatusInnerView.isHidden = false
            
            orderStatusList = ["Driver Arrived", "Delivery Started", "Order is not ready", "Customer not available"]
            orderStatusCodeList = ["1003","1004","1021","1020"]
            bookingStatus = (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata?.bookingstatus!)!
            if bookingStatus == "1001" || bookingStatus == "1002"
            {
                orderStatusList = ["Driver Arrived", "Order is not ready", "Customer not available"]
                orderStatusCodeList = ["1003","1021","1020"]
            }
            statusRowsIcons.removeAll()
            for index in orderStatusList
            {
                statusRowsIcons.append("icons8-0-percent-filled-50")
            }
            tblviewChangeStatus.reloadData()
        }
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    func removeSpecialCharsFromString(_ text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_@/%?//&[]")
        return String(text.filter {okayChars.contains($0) })
    }
    
    @IBAction func navigationBtnClicked(_ sender: UIButton) {
        
        var location_latitude = ""
        var location_longitude = ""
        
        if sender.tag == 101
        {
            if let lat = ridedetailsdata.data?.holderPickdropLocation?.holderpickdroplocationdata!.pick_latitude {
                location_latitude = lat
            }
            if let long = ridedetailsdata.data?.holderPickdropLocation?.holderpickdroplocationdata!.pick_longitude{
                location_longitude = long
            }
        }
        else
        {
            if let lat = ridedetailsdata.data?.holderPickdropLocation?.holderpickdroplocationdata!.drop_latitude {
                location_latitude = lat
            }
            if let long = ridedetailsdata.data?.holderPickdropLocation?.holderpickdroplocationdata!.drop_longitude{
                location_longitude = long
            }
        }
        self.installedNavigationApps.removeAll()
            
        if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.apple.com")! as URL)){
            
            self.installedNavigationApps.append("Apple Maps")

        }
//            if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)){
//
//                self.installedNavigationApps.append("Google Maps")
//            }
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)){
            
            self.installedNavigationApps.append("Google Maps")
        }
            
            // if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.waze.com")! as URL)){
            
            if(UIApplication.shared.canOpenURL(URL(string:"waze://")!)){
                
                self.installedNavigationApps.append("Waze")
            }
            
            let alert = UIAlertController(title: NSLocalizedString("Selection".localized, comment: ""), message: NSLocalizedString("Select Navigation App".localized, comment: ""), preferredStyle: .actionSheet)
            for app in self.installedNavigationApps {
                let button = UIAlertAction(title: app, style: .default, handler: { (action) in
                    
            if(app == "Google Maps"){
           
            UIApplication.shared.open(NSURL(string:"comgooglemaps-x-callback://?saddr=&daddr=\(location_latitude),\(location_longitude)&directionsmode=driving")! as URL, completionHandler: { (success) in
                                    print("Settings opened: \(success)") // Prints true
                            })
                        }
                   
                     else if(app == "Waze"){
                        
                            let urlStr:NSString = NSString(format: "waze://?ll=%f,%f&navigate=yes",location_latitude, location_longitude)
                            print(urlStr)
                            
                        UIApplication.shared.open(NSURL(string: urlStr as String)! as URL, completionHandler: { (success) in
                                print("Settings opened: \(success)") // Prints true
                            })
                            
                            //  UIApplication.shared.openURL(NSURL(string: (urlStr as String) as String)! as URL)
                        }
                    
                        else if(app == "Apple Maps"){
                            
                            UIApplication.shared.open(NSURL(string:
                                "http://maps.apple.com/?saddr=&daddr=\(location_latitude),\(location_longitude)&directionsmode=driving")! as URL, completionHandler: { (success) in
                                    print("Settings opened: \(success)") // Prints true
                            })
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
   
    func setdata()
       {
           canceltopbtnview.edgeWithShadow(edge: 4.0)
           if (ridedetailsdata.data?.cancelButtonVisiblity?.visibility)!{
            
               canceltopbtnview.isHidden = false
               canceltopbtn.setTitle(ridedetailsdata.data?.cancelButtonVisiblity?.buttonText ?? "", for: .normal)
               canceltopbtn.setTitleColor(PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.cancelButtonVisiblity?.textColor)!), for: .normal)
               canceltopbtnview.backgroundColor =
                   PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.cancelButtonVisiblity?.textBackGround)!)
               
           }else
           {
               canceltopbtnview.isHidden = true
           }
           
           if ridedetailsdata.data?.holderfamilymember?.name ?? "" == ""{
               
               childdetailsview.isHidden = true
               childdetailsviewheight.constant = 0
               totalheight = totalheight - 65.0
               topviewheight.constant = CGFloat(totalheight)
               
           }else{
               
               childdetailsview.isHidden = false
               childdetailsviewheight.constant = 65.0
               childdetailstextlbl.text = "Child Details :".localized
               childnametext.text = ridedetailsdata.data?.holderfamilymember?.name ?? ""
               childphonetext.text = ridedetailsdata.data?.holderfamilymember?.phoneNumber ?? ""
           }
           
           if (ridedetailsdata.data?.holderMapImage?.visibility)!{
               
               mapimageview.isHidden = false
               mapimageviewheight.constant = 150.0
               
               let phonewidth = Int(self.mapimageview.frame.width)
               let newString1 = (ridedetailsdata.data?.holderMapImage?.holdermapimagedata?.mapImage)! + "&size=\(phonewidth)x\(150)"
               let url12 = removeSpecialCharsFromString(newString1)
               AppConstants.downloadimage(imagename: url12, imageview: mapimage, placeholderimage: "mandy")
               
           }else{
               mapimageview.isHidden = true
               mapimageviewheight.constant = 0.0
               totalheight = totalheight - 150.0
               topviewheight.constant = CGFloat(totalheight)
           }
           
           if (ridedetailsdata.data?.holderBookingDescription?.visibility)!{
               
               dateview.isHidden = false
               dateviewheight.constant = 70.0
               dateview.layer.borderWidth = 1.0
               dateview.layer.borderColor = UIColor.gray.cgColor
               datetext.text = ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.highlightedLeftText ?? ""
               datetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.highlightedLeftTextColor)!)
               
               cartypenametext.text = ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.smallLeftText ?? ""
//               cartypenametext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.smallLeftTextColor)!)
               
//               estmitatepricetext.text = ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.highlightedRightText
//
//               estmitatepricetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.highlightedRightTextColor)!)
               
               lblBookingStatus.text = "Status: " + (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata?.bookingstatustext ?? "")
               
               lblBookingStatus.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.smallrighttextcolor)!)
               
               
           }else{
               dateview.isHidden = true
               dateviewheight.constant = 0.0
               totalheight = totalheight - 50.0
               topviewheight.constant = CGFloat(totalheight)
           }
           
           if (ridedetailsdata.data?.holderPickdropLocation?.visibility)!{
               
               locationview.isHidden = false
               locationviewheight.constant = 120.0
               locationview.layer.borderWidth = 1.0
               locationview.layer.borderColor = UIColor.gray.cgColor
               pickuptext.text = ridedetailsdata.data?.holderPickdropLocation?.holderpickdroplocationdata!.pickText ?? ""
               droptext.text = ridedetailsdata.data?.holderPickdropLocation?.holderpickdroplocationdata!.dropText ?? ""
               let booking_status = ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata?.bookingstatus
               
               if booking_status == "1001" || booking_status == "1002"{
                   navBtnPickup.isHidden = false
               }else{
                   navBtnPickup.isHidden = true
               }
               
               if booking_status == "1005"{
                   navBtnDropoff.isHidden = true
               }else{
                   navBtnDropoff.isHidden = false
               }
                
           }else{
               
               locationview.isHidden = true
               locationviewheight.constant = 0.0
               totalheight = totalheight - 120.0
               topviewheight.constant = CGFloat(totalheight)
           }
           
           if (ridedetailsdata.data?.holderBookingDetails?.visibility)!
            {
                corporateDetailsView.isHidden = false
                corporateDetailsViewHeight.constant = 90.0
                corporateDetailsView.layer.borderWidth = 1.0
                corporateDetailsView.layer.borderColor = UIColor.gray.cgColor
                
                let corporateBookingData = ridedetailsdata.data?.holderBookingDetails!
                lblTrackingID.text = "Order ID: " + (corporateBookingData?.tracking_id ?? "")
               AppConstants.OngoingTripTrackingID = corporateBookingData?.tracking_id ?? ""
                lblTrackingID.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata!.highlightedLeftTextColor)!)
                lblCorporateName.text = "Pick from: " + (corporateBookingData?.name ?? "")
                lblTotalProducts.text = "Total Items: \(String(describing: corporateBookingData!.product ?? "0"))"
                lblScannedProducts.text = "Scanned Items: \(String(describing: corporateBookingData!.scanned_product ?? "0"))"
            }
            else
            {
                corporateDetailsViewHeight.constant = 0.0
                corporateDetailsView.isHidden = true
                totalheight = totalheight - 100.0
            }
           
           if (ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata?.additionalInfo)! != ""
           {
               additionalInfoView.isHidden = false
               additionalInfoViewHeight.constant = 100.0
               lblAdditionalInfo.text = ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata?.additionalInfo! ?? ""
           }
           else
           {
               additionalInfoView.isHidden = true
               additionalInfoViewHeight.constant = 0.0
               totalheight = totalheight - 100
           }

           if (ridedetailsdata.data?.holderMetering?.visibility)!{
               
               distancetimeview.isHidden = false
               distancetimeviewheight.constant = 40.0
               totalpricetext.text = ridedetailsdata.data?.holderMetering?.holdermeteringdata!.textOne ?? ""
               distancetext.text = ridedetailsdata.data?.holderMetering?.holdermeteringdata!.textTwo ?? ""
               timetext.text = ridedetailsdata.data?.holderMetering?.holdermeteringdata!.textThree ?? ""
               
           }else{
               
               distancetimeview.isHidden = true
               distancetimeviewheight.constant = 0.0
               
               totalheight = totalheight - 40.0
               topviewheight.constant = CGFloat(totalheight)
               
           }
           
           if (ridedetailsdata.data?.holderUser?.visibility)!{
               
               driverdetailsview.isHidden = false
               driverdetailsheight.constant = 60.0
               driverdetailsview.layer.borderWidth = 1.0
               driverdetailsview.layer.borderColor = UIColor.gray.cgColor
               driverimageview.makeViewCircular()
               
               let newString1 = ridedetailsdata.data?.holderUser?.holderuserdata?.circularImage ?? ""
               if newString1 == ""
               {
                   
               }
               else
               {
                   AppConstants.downloadimage(imagename: newString1, imageview: driverimageview, placeholderimage: "mandy")
               }
               
               drivernametext.text = ridedetailsdata.data?.holderUser?.holderuserdata!.highlightedText ?? ""
//               driveremailtext.text = ridedetailsdata.data?.holderUser?.holderuserdata!.smallText ?? ""
               
               if (ridedetailsdata.data?.holderUser?.holderuserdata!.ratingVisibility)!{
                   
                   ratingvalue.isHidden = false
                   
                   //if (ridedetailsdata.data?.holderUser?.holderuserdata!.ratingButtonEnable)!{
                    
                    ratingvalue.editable = false
                    ratedrivertextlbl.text = ridedetailsdata.data?.holderUser?.holderuserdata!.ratingButtonText ?? ""
                    ratingtext.text = ridedetailsdata.data?.holderUser?.holderuserdata!.rating ?? ""
                    ratingvalue.rating = Float(((ridedetailsdata.data?.holderUser?.holderuserdata!.rating)!)) ?? 0.00
                    
   //                }else{
   //                    ratingvalue.editable = false
   //                    ratedrivertextlbl.text = ridedetailsdata.data?.holderUser?.holderuserdata!.ratingButtonText
   //
   //                    ratingtext.text = ridedetailsdata.data?.holderUser?.holderuserdata!.rating
   //
   //                    ratingvalue.rating = Float((ridedetailsdata.data?.holderUser?.holderuserdata!.rating)!)!
                   
     //              }
                   
   //                ratedrivertextlbl.text = ridedetailsdata.data?.holderUser?.userData?.ratingButtonText
   //
   //                ratingtext.text = ridedetailsdata.data?.holderUser?.userData?.rating
   //
   //                ratingvalue.rating = Float((ridedetailsdata.data?.holderUser?.userData?.rating)!)!
                   
               }else{
                   
                   ratingvalue.isHidden = true
                   ratedrivertextlbl.isHidden = true
                   ratingtext.isHidden = true
              }
           }else{
               
               driverdetailsview.isHidden = true
               driverdetailsheight.constant = 0.0
               totalheight = totalheight - 60.0
               topviewheight.constant = CGFloat(totalheight)
           }
           
           if (ridedetailsdata.data?.holderReceipt?.visibility)!{
               
               tablecount = ridedetailsdata.data?.holderReceipt?.holderreceiptdata!.count ?? 0
               Detailstableview.reloadData()
           }else{
               
               tablecount = 0
               Detailstableview.reloadData()
           }
        
           if (ridedetailsdata.data?.buttonVisibility?.visibility)!{
               
               let bookingStatus = ridedetailsdata.data?.holderBookingDescription?.holderbookingdescriptiondata?.bookingstatus ?? ""
               if bookingStatus == "1001" || bookingStatus == "1002"
               {
                   firstview.isHidden = true
                   scanCodeView.isHidden = false
               }
               else
               {
                   firstview.isHidden = false
                   firsttextlbl.text = ridedetailsdata.data?.buttonVisibility?.buttonText ?? ""
                   firstview.backgroundColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.buttonVisibility?.textBackGround)!)
                   firsttextlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.buttonVisibility?.textColor)!)
                   scanCodeView.isHidden = true
               }
               
               if AppConstants.triptypeid == 3
               {
                   firstview.isHidden = true
                   scanCodeView.isHidden = true
                   totalheight = totalheight - 100.0
               }
               
               firstview.isHidden = false

           }else{
                firstview.isHidden = true

           }
           
   //        if (ridedetailsdata.data?.buttonVisibility?.cancel)!{
   //
   //            secondview.isHidden = false
   //            secondtextlbl.text = "Cancel".localized
   //        }else{
   //            secondview.isHidden = true
   //
   //        }
   //
   //        if (ridedetailsdata.data?.buttonVisibility?.track)!{
   //
   //            thirdview.isHidden = false
   //            thirdtextlbl.text = "Track Ride".localized
   //        }else{
   //            thirdview.isHidden = true
   //
   //        }
   //
   //        if (ridedetailsdata.data?.buttonVisibility?.support)!{
   //             fourthview.isHidden = false
   //            fourthtextlbl.text = "Support".localized
   //
   //        }else{
   //
   //            fourthview.isHidden = true
   //        }
   //
   //
           
           let headerView = Detailstableview.tableHeaderView!
           headerView.setNeedsLayout()
           headerView.layoutIfNeeded()
           
           var frame = headerView.frame
           frame.size.height = CGFloat(totalheight + 10.0)
           headerView.frame = frame
           Detailstableview.tableHeaderView = headerView
       }
    
    @IBAction func saveOrderStatusClicked(_ sender: Any) {
        let dic1 = ["booking_id":AppConstants.bookingid,
                    "booking_status":bookingStatus
            ] as [String : AnyObject]
        showLoaderWithoutBackground()
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ORDERSTATUSUPDATE
        ServiceManager.sharedInstance.delegate = self
//        print("status dic1 \(dic1)")
//        print("status header \(AppConstants.dicauthorization)")

        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ConsignmentDataModel.self)
    }
    
    @IBAction func cancelOrderStatusClicked(_ sender: Any) {
        orderStatusHiddenView.isHidden = true
    }
    
    @IBAction func btnScanCodeClicked(_ sender: Any) {
        presentVC("QRCodeController")
    }
}


extension FullTripDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            print(Detailstableview.tag)
            if tableView.tag == 1{
            return tablecount
        }
        else if tableView == tblviewChangeStatus{
            return orderStatusList.count
        }
        else{
            print(reasontablecount!)
            return reasontablecount!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1{
        
        let cell = Detailstableview.dequeueReusableCell(withIdentifier: "ridecell", for: indexPath)
        
//        let firsttext: UILabel = cell.contentView.viewWithTag(1) as! UILabel
//
//        let secondtext: UILabel = cell.contentView.viewWithTag(2) as! UILabel
        
        
        
//        if (ridedetailsdata.data?.holderReceipt?.holderreceiptdata![indexPath.row].highlightedVisibility)!{
//
//            cell.textLabel!.text = ridedetailsdata.data?.holderReceipt?.holderreceiptdata![indexPath.row].highlightedText
//
//            cell.textLabel!.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderReceipt?.holderreceiptdata![indexPath.row].highlightedTextColor)!)
//        }else{
//
//        }
//        if (ridedetailsdata.data?.holderReceipt?.holderreceiptdata![indexPath.row].valueTextvisibility)!{
//
//            cell.detailTextLabel!.text = ridedetailsdata.data?.holderReceipt?.holderreceiptdata![indexPath.row].valueText
//
//            cell.detailTextLabel!.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderReceipt?.holderreceiptdata![indexPath.row].valueTextColor)!)
//        }else{
//
//        }
        return cell
        }
        
        else if tableView == tblviewChangeStatus
        {
            let cell = tblviewChangeStatus.dequeueReusableCell(withIdentifier: "OrderStatusChangeViewCell", for: indexPath) as! OrderStatusChangeViewCell
            cell.lblOrderStatus.text = orderStatusList[indexPath.row]
            cell.imgCellSelected.image = UIImage(named: statusRowsIcons[indexPath.row])
            
            return cell
        }
        
        else {
            
            let cell = tableview.dequeueReusableCell(withIdentifier: "fulltripcancelreason", for: indexPath) as! FulltripCancelReasonTableViewCell
            
            cell.cancelreasonlbl.text = drivercancelreasondata.data![indexPath.row].reason
            let tableheight = tableview.contentSize.height
            
            if tableheight < AppConstants.screenframeheight - 200.0{
                
                hiddeninnerviewheight.constant = tableheight + 100.0
                
            }else{
                hiddeninnerviewheight.constant = AppConstants.screenframeheight - 200.0
            }
            
            if(check2 == indexPath.row)
            {
                
                cell.cancelreasonimage.image = UIImage(named: "icons8-0-percent-filled-50")
                
            }else{
                cell.cancelreasonimage.image = UIImage(named: "icons8-0-percent-filled-50")
                
            }
            return cell
        }
}
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        if tableView.tag == 1{
            
        }
        else if tableView == tblviewChangeStatus
        {
            statusRowsIcons.removeAll()
            for index in orderStatusList
            {
                statusRowsIcons.append("icons8-0-percent-filled-50")
            }
            statusRowsIcons.insert("radio-on-button", at: indexPath.row)
            tblviewChangeStatus.reloadData()
            bookingStatus = orderStatusCodeList[indexPath.row]
        }
        
        else {
            
            tableview.deselectRow(at: indexPath, animated: true)
            check2 = indexPath.row
            selectindexvalue2 = indexPath.row
            print(selectindexvalue2)
            //tracktableview.reloadData()
            hiddenview.isHidden = true
            
            cancelReasonId = drivercancelreasondata.data![selectindexvalue2].id
           
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
}



extension FullTripDetailsViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverBookingDetailoneModel
        {
            let data:DriverBookingDetailoneModel = responseData
            
            if data.result == "1"
            {
                 hideLoaderWithoutBackground()
                self.callApi()
                
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverAcceptModels{
            let data:DriverAcceptModels = responseData
            
            if (data.result == "1")
            {
                
                hideLoaderWithoutBackground()
                
                
                self.presentVC("TrackRideViewController")
                
//                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let nextController: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
//
//                if let window = self.view.window{
//                    window.rootViewController = nextController
//                }
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
        
        if let responseData = response as? RideDetailsModel
        {
            let data:RideDetailsModel = responseData
            
            ridedetailsdata = data
            
            if ridedetailsdata.result == "1"
            {
                hideLoaderWithoutBackground()
                
                self.setdata()
            }
            else if ridedetailsdata.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
        
        if let responseData = response as? DriverCancelReasonModel
        {
            let data:DriverCancelReasonModel = responseData
            
            drivercancelreasondata = data
            
            if (drivercancelreasondata.result == "1")
            {
                hideLoaderWithoutBackground()
                
                reasontablecount = drivercancelreasondata.data?.count
                tableview.reloadData()
                
            }
            else if drivercancelreasondata.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                hideLoaderWithoutBackground()
                //  showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? ConsignmentDataModel
        {
            orderStatusHiddenView.isHidden = true
            hideLoaderWithoutBackground()

            let data:ConsignmentDataModel = responseData
            if data.result == "1"
            {
                showErrorAlert("Success".localized, alertMessage: data.message!, VC: self)
            }
            else
            {
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        
//        if let responseData = response as? CancelRideModel{
//            
//            let data:CancelRideModel = responseData
//            
//            
//            
//            if data.result == "1" {
//                
//                hideLoaderWithoutBackground()
//              
//                self.dismissVC()
//                
//                
//                
//            }else if data.result == "999" {
//                
//                UserDefaultUtility.removeAllUserDefault()
//                
//                self.presentVC("SplashViewController")
//                
//            } else {
//                hideLoaderWithoutBackground()
//                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
//                
//            }
//            
//            
//        }
        
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



