//
//  File.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import AVFoundation

struct AppConstants {
    
    static  func downloadimage1(imagename:String,imageview:UIImageView,placeholderimage:String)// -> UIImage
    {
        let image = UIImage (imageLiteralResourceName: placeholderimage)
        let combineurl = AppConstants.APIURL.IMAGE_URL + "/" + imagename
        
        
        let url = URL(string: combineurl)!
        //imageview.isHidden  = true
        imageview.af_setImage(withURL: url, placeholderImage: image, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true) { (image) in
            print("helloo")
            //imageview.isHidden  = false
        }
    }
    
    
    static  func downloadimage(imagename:String,imageview:UIImageView,placeholderimage:String)// -> UIImage
    {
        if imagename == ""{
            
            imageview.image = UIImage(named: "mandy")
            
        }else{
        
        let image = UIImage (imageLiteralResourceName: placeholderimage)
        //let combineurl = Session.imageurl + "/" + imagename
        let url = URL(string: imagename)!
        //imageview.isHidden  = true
        imageview.af_setImage(withURL: url, placeholderImage: image, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true) { (image) in
            print("helloo")
            //imageview.isHidden  = false
        }
        }
    }
    
    
    static  func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            print(url)
            completion(UIApplication.shared.openURL(url))
            return
        }
        print(url)
        UIApplication.shared.open(url, options: [:]
            , completionHandler: completion)
    }
    
    static var dicwithpublic = ["Accept": "application/json",
                                "publicKey": AppConstants.publickey,
                                "secretKey": AppConstants.secretkey,
                                "locale": AppConstants.languagecode
        ] as [String : AnyObject]
    
    static var productDetailsData: [ProductDetailsData]!
    static var productImages: [String]?
    static var receiverDetails: DriverLocationReceiverDetails!
    static var cancelbtnvaluematch: String = ""
    static var driverlogindata: DriverLoginModel!
    static var trackingdata: ListenTrackingModel!
    static var dicauthorization = [:] as [String : AnyObject]
    static var boolingdetailsdata: DriverBookingDetailoneModel!
    static var mutiplestops:[String] = []
    static var multipleVisable: Bool? = false
    static var appversion: String = ""
    static var estimateFare = ""
    static var additionalNotes = ""
    static var dropLocation = ""
    static var drivervehicleid: String = ""
    static var googlemapkey = "AIzaSyBeSXEpjR4eSAol-2HcUT_dMNXz-GGefuc"
    static var publickey = "PMnDBx0Sq3ALpoT9Qws8v2ty74ujl6"
    static var secretkey = "Skoi9q42EfuDMJX8mKBv1yUgthlYAV"
    static var driverconfiguredata: DriverAppConfigureModel!
    static var DROPOFFIMAGESARRAY : [Data] = []
    static var DROPOFFIMAGESTRING : [String] = []
    static var ORDERSINCONSIGNMENT : [String] = []
    static var TypeOfCodeToScan = ""
    static var allActiveTripDataForRoute : [CorporateBookingData] = []
    
    //2CGO7Aq6PNy8uKxlMDvStn1oQrRiBm
    //h7ZUyR6V84NILQKrP9mpM3iC01jEku
    
    //EIAPt7JOD0uw3xsmynpNT96K5CL4GR
    //Woghx5OG28ENmJQ0y9V4tlY3ZAwfR6
    
    //static var googlemapkey = "AIzaSyCdsS7d2HHMvWuwiSOXGlbf2yRlPztHXc0"
    static var tripstype = ""
    static var selectvehicleid: String = ""
    static var comefromonlinecartapvalue = 0
    static var comefromonlinecartap: String = ""
    static var acceptrejectTimer: Timer = Timer()
    static var helloWorldTimer: Timer = Timer()
    static var player: AVAudioPlayer?
    static var branchversion = "Version20_09"
    static var backgroundforeground = ""
    static var statusofbooking = 0
    static var pickdroplat = ""
    static var pickdroplng = ""
    static var trackingscreenvalue = ""
    static var notificationvalue = ""
    static var documentscreenapi: String = "1"
    static var dialogopen: String = "0"
    static var checkphonenumber: Int = 0
    static var enterdriverphonenumber:String = ""
    static var enterDriverEmailAddress: String = ""
    static var Lat = "28.4135"
    static var Lng = "77.0415"
    static var finddistancelat = ""
    static var finddistancelng = ""
    static var drivertselectaddressLng = ""
    static var driverselectaddressLat = ""
    static var servicecityname = ""
    static var Location = ""
    static var drivercityname = ""
    static var languagecode = "en"
    static var languageCodeSelectInMenu = 0
    static var currencysymbol = "INR"
    static var modelname = ""
    static var splashscreenoptions = 0
    static var appbundleid = ""
    static var screenframeheight: CGFloat = 0.0
    static var screenframewidth: CGFloat = 0.0
    static var radiansBearing : Double = 0.0
    static var checkvaluedriverpressonoffbtn: Int = 0
    static var  timer: DispatchSourceTimer?
    static var  driverlocationtimer: DispatchSourceTimer?
    static var viewcontrollerself : UIViewController!
    static var bookingid = ""
    static var trackingID = ""
    static var orderDetailsData : CorporateBookingData!
    static var receiverData: DriverBookingDetailoneUser!
    static var screenfromaccept = ""
    static var servicetypeid = ""
    static var vehiclename = ""
    static var estimatedistance = ""
    static var estimatetime = ""
    static var bookingtypeid = ""
    static var userphone = ""
    static var service = ""
    static var packagename = ""
    static var pickuplocation = ""
    static var username = ""
    static var useremail = ""
    static var paymentmethod = ""
    static var timestamp = ""
    static var driverrequesttimeout = ""
    static var vehicleimage = ""
    static var calculatedAccuracy:Double = 0.0
    static var trackdatausername = ""
    static var checkfromchat = 0
    static var poolenablestatus = ""
    static var poolenable: Bool? = false
    static var autoupgradationstatus = ""
    static var autoupgradation = ""
    static var dateselected: String = "0"
    static var checkweekdatetext: String = "0"
    static var checkmovefromcalenderearning = "0"
    static var checkdate = "0"
    static var selectedcellvalue = ""
    static var meterimage: UIImage = UIImage()
    static var meterimagevelue: String = ""
    static var meterreadingvalue = ""
    static var selectindexvalue4 = 0
    static var selectedhomeaddress = ""
    static var homelocationactivestats: Bool?
    static var checkfromcamera = 0
    static var movefromcalender: Int = 0
    static var documentdateselected: String = "DD MM YYYY"
    static var managedocumenttype: String = "1"
    static var dynamicdocumentimage: UIImage = UIImage()
    static var documentimageselect = 0
    static var selecteddocumentId: String = ""
    static var documentstatus = ""
    static var imagearray: [Data] = []
    static var imagestring: [String] = []
    static var emergencylatitude = ""
    static var emergencylongitude = ""
    static var checkfromotp = 0
    static var addmoney = 0
    static var checkfromvehicleactivate = 0
    static var superdateselected: String = "yyyy MM dd"
    static var endsuperdateselected: String = "yyyy MM dd"
    static var checkfromsuperdriver = "0"
    static var endcheckfromsuperdriver = "0"
    static var selectcheck = "0"
    static var startcheck = "0"
    static var endcheck = "0"
    static var countryId = 0
    static var chatCount = 0
    static var checkfromsetting = ""
    static var termChangedNotification = true
    static var autoAcceptStatus = ""
    static var cardselect = 0
    static var enteramount = ""
    static var tokenvalue = 0
    static var remainedDeliveriesInThisConsignment : Int = 0
    static var OngoingTripTrackingID = ""
    static var UploadDropoffImagesFromVC = ""
    static var IsOrderMultiPickup = false
    static var tripsByPickupAddress : [ActiveTripsRouteData] = []
    static var fullTripDetailsData: ActiveTripsRouteData!
    static var isOrderListOnMapRouteNil = true
    static var customerQRcodeForTrackRiderVC: String!
    static var triptypeid = 0
    static var isDropoffScanning = false
    static var additionalDropoffInfo: DriverTripAdditionalDropoffInfoData?
    
struct APIURL{

//   static let BASE_URL:String = "http://192.168.2.6:8000/"
//   static let IMAGE_URL = "http://192.168.2.6:8000/"

    static let BASE_URL:String = "http://www.shipnowadmin.com/delivery/public/"
    static let IMAGE_URL = "http://www.shipnowadmin.com/delivery/public/"

//    static let BASE_URL:String = "https://7990-103-152-127-74.ngrok.io/"
//    static let IMAGE_URL = "https://7990-103-152-127-74.ngrok.io/"
    
//    static let IMAGE_URL = "https://shipnow.ml/Delivery/public/"
 
}

    
struct ApiEndPoints {
//    static let devicetoken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjE1NDA1MTY5ZjI5N2Q2ZmJlZGNiODllOTc4OWJlMTljNGYzYjQxNmIzMGYwNDEzZmI5NmQwYzUxMDBlZTNhOTY5MTU4OWUyNjcyYjVjNTdmIn0.eyJhdWQiOiI0IiwianRpIjoiMTU0MDUxNjlmMjk3ZDZmYmVkY2I4OWU5Nzg5YmUxOWM0ZjNiNDE2YjMwZjA0MTNmYjk2ZDBjNTEwMGVlM2E5NjkxNTg5ZTI2NzJiNWM1N2YiLCJpYXQiOjE1NDU0Nzg1MzMsIm5iZiI6MTU0NTQ3ODUzMywiZXhwIjoxNTc3MDE0NTMzLCJzdWIiOiIyMiIsInNjb3BlcyI6W119.l6CAYwnIpoJ6pzTVE9oXkw_ZubqnkOahw7om8YEwtNcYB5BKv5pJYMBkWV_1go_s0-yWsxN_ujyHjHtaEOVS8Q8_dUntOtzDEPxvQ_qgGSWNjQOlhTsLkAqiui9fkigpHOKPuaLUJUn21L2tvYkkOVW5MYaQ9KYyh8RWcw0BXrfWEZ926F40vIlAvoLi9OnTzPfZxl3GsoqVOQIZhdCkRlO3F1cIaII4-DS9Y_MVuI8XYP82JvWZ0Z_u1t12Dzr97PT6C8lE9EC5DhlMBRUssf2WKN0DM2-dAW7zydMfn9WKEAeu-_v_HIZku4l28g85pmSKVx9LKHg5G6MW4a_58QMC-MNVExQOBTI_gZtZdu-PjQmdIKFhhR84jQOUOdJPWasPjqJqX78pWEovWH-viaAnRHkDoKdpTuiH4VD6RF2L0vCvyjTJ-uWZ7l9OLDkfk52BBoi8f-JlscfhtYelgrK5zlAE8jVQxocI3dr4nHlSPFzRtdaxHsk9Ytxv6MVSvutgBMYxhYMWthdvj0chyhu_SuVcPByq2xnusBkqEh0bxXdSduLNxQ3xAkRg4n0L7zfuuCJqgPc6w-D_Mcloh07Ibq0udyVoKuSSj2jrJ_OiijCTUx4wSf5lOefCkZ1io1ljuVsdcME3buinbJLVB1vd-MD7vpII7KJ_-6hTomk"
    
    static let DEVICE_AUTH = "/authorise-application"
    static let DRIVERCONFIGURATION = "api/driver/configuration"
    static let DRIVERSIGNUP = "api/driver/firtstep"
    static let DRIVEROTP = "api/driver/otp"
    static let DRIVERVEHICLECONFIGURATION = "api/driver/vehicleconfiguration"
    static let DRIVERLOGIN = "api/driver/login"
    static let DRIVERDETAILS = "api/driver/driverData"//"api/driver/details"
    static let HOMESCREEN = "api/driver/main/screen"
    static let DRIVERONOFLINE = "api/driver/online/offline"
    static let DRIVERLOCATION = "api/driver/location"
    static let DRIVERLOGOUT = "api/driver/logout"
    static let CURRENTROUTETRIPS = "api/driver/booking/active/order/route"
    static let ACTIVERIDES = "api/driver/booking/history/active"
    static let SCHEDULERIDES = "api/driver/booking/history/schedule"
    static let PASTRIDES = "api/driver/booking/history/past"
    static let NEWUPCOMINGRIDES = "api/driver/booking/history/upcomming"
    static let OUTSTATIONRIDES = "api/driver/booking/history/upcomming/outstation"
    //static let PASTRIDES = "api/driver/booking/history/past"
    static let CMSPAGES = "api/driver/cms/pages"
    static let DRIVERFORGOTPASSWORD = "api/driver/forgotpassword"
    static let CHANGEPASSWORD = "api/driver/changepassword"
    static let EDITPROFILE = "api/driver/edit-profile"
    static let DRIVERACCEPTRIDE = "api/driver/bookings/accept"
    static let DRIVERBOOKINGDETAILS = "api/driver/bookings/detail"
    static let DRIVERRIDEREJECT = "api/driver/bookings/reject"
    static let DRIVERCANCELREASON = "api/driver/cancelReasons"
    static let DRIVERCANCELRIDE = "api/driver/bookings/cancel"
    static let DRIVERTRACKING = "api/driver/booking/tracking"
    static let DRIVERARRIVE = "api/driver/bookings/arrive"
    static let DRIVERSTARTRIDE = "api/driver/bookings/start"
    static let DRIVERENDRIDE = "api/driver/bookings/end"
    static let DRIVERREPORTTRIPENDISSUE = "api/driver/booking/attempt_to_deliver"
    static let DRIVERRECIEPT = "api/driver/receipt"
    static let DRIVERRATING = "api/driver/booking/rate/user"
    static let DRIVERCLOSE = "api/driver/bookings/close"
    static let DRIVERCHANGEDROP = "api/driver/booking/change_address"
    static let DRIVERCHAT = "api/driver/chat"
    static let DRIVERCHATSENDMESSAGE = "api/driver/chat/send_message"
    static let DRIVERMANUALRIDE = "api/driver/manual/booking"
    static let DRIVERPOOLCHECK = "api/driver/pool/active/deactive"
    static let DRIVERAUTOUPGRADE = "api/driver/auto-upgrade"
    static let DRIVERCUSTOMERSUPPORT = "api/driver/customer_support"
    static let DRIVERCMSPAGES = "api/driver/cms/pages"
    static let DRIVEREARNINGS = "api/driver/earnings"
    static let DRIVEREARNINGDETAILS = "api/driver/earning/details"
    static let DRIVERDAILYEARNINGS = "api/driver/earnings/singleDay"
    static let DRIVERBANKDETAILS = "api/driver/bankdetails"
    static let DRIVERADDHOMEADDRESS = "api/driver/add/homeaddress"
    static let DRIVERHOMEACTIVEDEACTIVE = "api/driver/active/deactive/homelocation"
    static let DRIVERSHOWADDEDADDRES = "api/driver/homeaddress"
    static let DRIVERVEHICLEMODELSELECT = "api/driver/vehiclemodel"
    static let DRIVERVEHICLEMAKESELECT = "api/driver/vehiclemake"
    static let DRIVERMULTIPLEPICK = "api/driver/bookings/reach"
    static let DRIVERADDVEHICLE = "api/driver/addvehicle"
    static let DRIVERDOCUMENTLIST = "api/driver/documentlist"
    static let VEHICLEDRIVERDOCUMENTLIST = "api/driver/vehicledocumentlist"
    static let DRIVERWAITING = "api/driver/waitingapproval"
    static let DRIVERADDDOCUMENT = "api/driver/adddocument"
    static let DRIVERVEHICLEADDDOCUMENT = "api/driver/addvehicledocument"
    static let DRIVERVEHICLEREQUEST = "api/driver/vehicleRequest"
    static let DRIVERVEHICLEOTP = "api/driver/vehicle/otp"
    static let DRIVERWALLETTRANSACTION = "api/driver/wallet/transaction"
    static let DRIVERSOSREQUEST = "api/driver/sos/request"
    static let DRIVERSELECTEDHOMEADDRESS = "api/driver/select/homelocation"
    static let DRIVERHOMELOCATIONDELETE = "api/driver/delete/homelocation"
    static let DRIVERBOOKINGHISTORYDetail = "api/driver/booking/history/detail"
    static let DRIVERPERSONALDOCUMENTS = "api/driver/personal/documentlist"
    static let VEHICLELIST = "api/driver/allVehicles"
    static let DRIVERDEMODETAILS = "api/driver/demo"
    static let DRIVEROTPVERIFICATION = "api/driver/booking/otp_verify"
    static let DRIVERACTIVATEVEHICLE =  "api/driver/changeVehicle" //"api/driver/active_vehicle"
    static let DRIVERPROMOTIONNOTIFICATION = "api/driver/promotion/notification"
    static let SUPERDRIVERDETAILS = "api/driver/getSuperDrivers"
    static let DEMANDSPOT = "api/driver/demandspot"
    static let DRIVERCHECKRATING = "api/driver/AverageRating"
    static let DRIVERPARTIALACCEPT = "api/driver/bookings/partial_accept"
    static let DRIVERACCEPTTERMS = "api/driver/updateTerms"
    static let DRIVEREXPIREDDOCUMENTS = "api/driver/expiredocuments"
    static let DriverRefer = "api/driver/refer_driver"
    static let USERCHECKDROPLOCATIONAREA = "api/driver/check-droplocation/area"
    static let MANUALDISPATCHESTIMATE = "api/driver/manual_dispatch_estimate"
    static let WalletAddmoney = "api/driver/wallet/addMoney"
    static let SETDRIVERRADIUS = "api/driver/limit-driver"
    static let MapLoadURL = "api/driver/map-load"

    static let MANUALCHECKOUTBOOKING = "api/driver/manual/checkoutBooking"
    static let INCOMPLETECONSIGNMENT = "api/driver/bookings/consignment/incomplete"
    static let COMPLETEDCONSIGNMENT = "api/driver/bookings/consignment/complete"
    static let ADDITIONALSERVICES = "api/driver/booking/additional_service"
    //to scan qr code
    static let USERORDER = "api/driver/bookings/consignment/order"
    //to scan barcode
    static let SCANBARCODE = "api/driver/bookings/consignment/scan/barcode"
    static let ORDERSTATUSUPDATE = "api/driver/booking/status_update"
    static let BOOKINGSTATUSUPDATE = "api/driver/bookings/consignment/order/status_update"
    static let SCANCUSTOMERQRCODE = "api/driver/bookings/consignment/scan/customer/qrcode"
    static let DRIVERADDITIONALDROPOFFINFO = "api/driver/booking/additional_message"
    static let SUBSCRIPTIONPACKAGES = "api/driver/view-subscription-packages"
    static let ACTIVATESUBSCRIPTIONPACKAGE = "api/driver/activate-subscription-package"
    static let AUTOACCEPTMODE = "api/driver/auto_accept_mode"
    static let DRIVERCARDS = "api/driver/cards"
    static let DRIVERSAVECARDS = "api/driver/savecards"
    static let DRIVERMAKEPAYMENT = "api/driver/makePayment"
    static let EMERGENCYCONTACTLIST = "api/driver/sos"
    static let ADDEMERGENCYCONTACT = "api/driver/sos/create"
    static let DELETEEMERGENCYCONTACT = "api/driver/sos/distory"
    static let DRIVERTIMESTAMPURL = "api/driver/timeStamp"
    static let AccountTypesURL = "api/driver/account-types"
    static let EARNINGREVISEDURL = "api/driver/earnings_revised"
    static let RIDEPAYMENTSTATUS = "api/driver/ride-payment-status"
    static let GeofenceQueue = "api/driver/geofence/queue"
    static let WaitingPauseResumeURL = "api/driver/bookings/pause/resume"
    static let SendMoneyToUserURL = "api/driver/sendMoneyToUser"
    static let DriverUpdatePlayerID = "api/driver/update-player-id"
}

struct KeyName{
    
    static let GoogleMapKey:String = "AIzaSyBeSXEpjR4eSAol-2HcUT_dMNXz-GGefuc"
    static let ProductName:String = "Apporio Driver"
}
    
    struct ScreenSpecificConstant {
        
        struct WelcomeScreen {
            static let TITLE_LOCATION_ACCESS_DISABLED = "Location Access Disabled"
            static let MESSAGE_LOCATION_SERVICE_DISABLED = "Allow ApporioEats to access this device's location?"
            static let APP_TITLE_DESC = "Use you \(KeyName.ProductName) Account to get started"
            static let REGISTER = "Register"
            static let LOGIN = "Login"
        }
        
        struct Common{
            
            static let BACK_BUTTON_TITLE = "Back"
            static let SKIP_BUTTON_TITLE = "Skip"
            static let EMPTY_STRING = ""
            static let LOGOUT_TITLE = "Logout"
            static let YES_TITLE = "Yes"
            static let OK_TITLE = "Ok"
            static let NO_TITLE = "No"
            static let Cancel_TITLE = "Cancel"
            static let LOGOUT_MESSAGE = "Are you sure you want to logout?"
            static let SETTINGS = "Go To Settings"
            static let ACCESS_DENIED = "Access Denied"
            static let CONTACT_ACCESS_PERMISSION_MESSAGE = "Please allow the app to access your contacts through the Settings"
            static let SAVE_BUTTON_TITLE = "Save"
            static let EDIT_BUTTON_TITLE = "Edit"
            static let PRODUCT_NAME_PRODUCTION = "Wapanda"
        }
    }
    
    struct ErrorMessages{
        
        static let ERROR_TITLE = "Alert"
        static let ALERT_TITLE = "Alert"
        static let MESSAGE_TITLE = "Message"
        static let INVALID_KEY_MESSAGE = "Valid api key is required. Please provide a valid api key along with request"
        static let INVALID_INPUT_MESSAGE = "Please provide a valid input"
        static let INVALID_LOGIN_MESSAGE = "Your phone/email is not registered"
        static let SOME_ERROR_OCCURED = "Oops-something went wrong. Please try again"
        static let PLEASE_CHECK_YOUR_INTERNET_CONNECTION = "Please check your internet connection"
        static let REQUEST_TIME_OUT = "Looks like the server is taking to long to respond, please try again in sometime"
        static let EMAIL_ALREADY_REGISTERED = "This email is already registered"
        static let PHONE_ALREADY_REGISTERED = "This phone is already registered"
        static let INVALID_INPUT = "Please provide a valid input"
        static let INVALID_OTP = "Please provide a valid code"
        static let PHONE_NOT_REGISTERED = "This number is not registered"
        static let EMAIL_NOT_REGISTERED = "This email is not registered"
        static let PHONE_NOT_VERIFIED = "Phone number is not verified."
        static let EMAIL_NOT_VERIFIED = "Email is not verified."
        static let INTERNAL_ERROR = "Oops-something went wrong. Please try again"
        static let ALREADY_REGISTERED = "You are already registered with the credential."
        static let ACCOUNT_DISABLED_MESSAGE = "Your account has been disabled. Please contact the administrator"
        static let ACCOUNT_UNVERIFIED = "Your account is not verified"
        static let INVALID_AUTH = "Session Expire. Please login again."
        static let NOT_FOUND = "No record found"
    }
    
    struct NSNotificationNames {
        static let INTERNET_RECHABLE_NOTIFICATION = "INTERNET_RECHABLE"
        static let INTERNET_UNREACHABLE_NOTIFICATION = "INTERNET_UNREACHABLE"
        static let REFRESH_PAYMENT_OPTION = "REFRESH_PAYMENT_OPTION"
        static let APP_BECOME_ACTIVE_NOTIFICATION = "APP_BECAME_ACTIVE_NOTIF"
    }
    
struct UserDefaultKeys {
    
    static let FIRSTNAME = "FIRSTNAME"
    static let LASTNAME = "LASTNAME"
    static let EMAIL_ID = "EMAIL_ID"
    static let DRIVER_ID = "DRIVER_ID"
    static let PASSWORD = "PASSWORD"
    static let MOBILE_NUMBER = "MOBILE_NUMBER"
    static let DRIVER_IMAGE = "DRIVER_IMAGE"
    static let CLIENT_ID = "CLIENT_ID"
    static let IS_ALREADY_LOGIN = "IS_ALREADY_LOGIN"
    static let IS_ALREADY_LAUNCHED = "IS_ALREADY_LAUNCHED"
    static let PLAYER_ID = "PLAYER_ID"
    static let UNIQUE_NUMBER = "UNIQUE_NUMBER"
    static let DRIVER_GENDER = "DRIVER_GENDER"
    static let AREAID = "AREAID"
    static let ONLINE_OFFLINE = "ONLINE_OFFLINE"
    static let DRIVER_REGISTERATION_DATE = "DRIVER_REGISTERATION_DATE"
    static let LOGIN_LOGOUT = "LOGIN_LOGOUT"
    static let BUSY_STATUS = "BUSY_STATUS"
    static let FIRST_NAME = "FIRST_NAME"
    static let LAST_NAME = "LAST_NAME"
    static let COUNTRY_ID = "COUNTRY_ID"
    static let AUTO_ACCEPT_VALUE = "AUTO_ACCEPT"
    static let SIGNUP_STEP = "SIGNUP_STEP"
    static let VEHICLE_ID = "VEHICLE_ID"
    static let DISTANCE_UNIT = "DISTANCE_UNIT"
    static let LIVE_VEHICLE_ID = "LIVE_VEHICLE_ID"
    static let DEMO_LOGIN = "DEMO_LOGIN"
    static let Taxi_Company = "taxi_company"
    static let DEVICE_ID = "DEVICE_ID"
    static let PUSH_NOTIFICATION_VALUE = "PUSH_NOTIFICATION_VALUE"
    static let FIREBASE_ONESIGNAL_CHECK = "FIREBASE_ONESIGNAL_CHECK"
    static let DRIVERASSIGNED = "Driver Assigned"
    static let DRIVERPICKEDUP = "Driver Picked Up"
    static let DRIVERCOMPLETED = "Driver Completed"
    static let NAVIGATIONTYPE = "SELECTED_NAVIGATION_TYPE"
}
}

enum movedFromDocVer: Int {
    case demoScreen = 0
    case signUpScreen = 1
    case loginScreen = 2
    case vehicleListingScreen = 3
    case existingVehicleScreen = 4
}

enum verifyMailOrPhone {
    case email
    case phone
    case forgotPassword
}
