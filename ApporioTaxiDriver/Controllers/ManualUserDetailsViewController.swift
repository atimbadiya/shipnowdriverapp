//
//  ManualUserDetailsViewController.swift
//  Apporio Taxi Driver
//
//  Created by Atul Jain on 27/02/18.
//  Copyright © 2018 apporio. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
//import Firebase
import ObjectMapper
import SwiftyJSON

class ManualUserDetailsViewController: BaseViewController,GMSAutocompleteViewControllerDelegate {
    
    //var beginData: RideBegin!
    
    var check1 = 0
    var manualselectindexvalue = 0
    
    
    @IBOutlet weak var countrycodetext: UILabel!
    @IBOutlet weak var containerview: UIView!
    
    
    var estimatedata: ManualDispatchEstimateModel!
    
    @IBOutlet weak var droppointtextlbl: UILabel!
    @IBOutlet weak var pickfromtextlbl: UILabel!
    @IBOutlet weak var userdetailstext: UILabel!
    
    @IBOutlet weak var pickuplocationview: UIView!
    
    @IBOutlet weak var droplocationtext: UILabel!
    @IBOutlet weak var droplocationview: UIView!
    
    @IBOutlet weak var enterusernametext: UITextField!
    
    @IBOutlet weak var enteruserphonetext: UITextField!
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var startridebtntext: UIButton!
    @IBOutlet weak var manualhiddenview: UIView!
    @IBOutlet weak var innerhiddenview: UIView!
    @IBOutlet weak var selectcountrylbl: UILabel!
    @IBOutlet weak var cancelbtn: UIButton!
    
    @IBOutlet weak var estimateView: UIView!
    @IBOutlet weak var estimatePriceLabel: UILabel!
    @IBOutlet weak var estimateTimeLabel: UILabel!
    @IBOutlet weak var startButtonTopConstraint: NSLayoutConstraint!
    
//    @IBOutlet weak var cellmainview: UIView!
//    @IBOutlet weak var countrynamelbl: UILabel!
//    @IBOutlet weak var selectedimage: UIImageView!
    //@IBOutlet weak var citynamelbl: UILabel!
    @IBOutlet weak var innerviewheight: NSLayoutConstraint!
    @IBOutlet weak var manualcountrytableview: UITableView!
    
    
    var checkoutid = ""
    
     let Areaid = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.AREAID)
    
    //    let driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
//
//    var cartypeid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarType)!
    
    var manualdroplat = ""
    
    var manualdroplong = ""
    
    var manualdroplocation = ""
    
     var selcetcountrycode = "+91"
    
    var pidarray:NSMutableArray = []
    
    var strJsonData6 : String = ""
    
//     var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manualhiddenview.isHidden = true
        self.estimateView.isHidden = true
        self.startButtonTopConstraint.constant = -55
        
        pickuplocationtext.text = "Getting Location..".localized
        userdetailstext.text = "User Details".localized
        pickfromtextlbl.text = "Pick From".localized
        droplocationtext.text = "Set your drop point".localized
        droppointtextlbl.text = "Drop Point".localized
        
        startridebtntext.setTitle("Start Ride".localized, for: UIControl.State.normal)
        enterusernametext.placeholder = "Enter User Name".localized
        
        enteruserphonetext.placeholder = "Enter User Phone".localized
        
        self.estimateView.layer.borderWidth = 1.0
        self.estimateView.layer.borderColor = UIColor.appThemeColor().cgColor
        self.estimateView.layer.cornerRadius = 4
        
        self.pickuplocationview.layer.borderWidth = 1.0
        self.pickuplocationview.layer.borderColor = UIColor.appThemeColor().cgColor
        self.pickuplocationview.layer.cornerRadius = 4
        
        self.containerview.layer.borderWidth = 1.0
        self.containerview.layer.borderColor = UIColor.appThemeColor().cgColor
        self.containerview.layer.cornerRadius = 4
        
        
        
       reverseGeocodeCoordinate(CLLocationCoordinate2DMake(Double(AppConstants.driverselectaddressLat)!, Double(AppConstants.drivertselectaddressLng)!))
        
        self.droplocationview.layer.borderWidth = 1.0
        self.droplocationview.layer.borderColor = UIColor.appThemeColor().cgColor
        self.droplocationview.layer.cornerRadius = 4
        
        self.enterusernametext.layer.borderWidth = 1.0
        self.enterusernametext.layer.borderColor = UIColor.appThemeColor().cgColor
        
        
    
AppConstants.checkfromotp = 0
        
        selcetcountrycode = (AppConstants.driverconfiguredata.data?.countries![manualselectindexvalue].phonecode)!
        print(selcetcountrycode)
        countrycodetext.text = selcetcountrycode

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if AppConstants.checkfromotp == 1{
            AppConstants.checkfromotp = 0
            self.callconfirmbookingapi()
        }else{
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
        
        // 1
        
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                let lines = address.lines
                AppConstants.Location = lines!.joined(separator: "\n")
              
                self.pickuplocationtext.text = AppConstants.Location
                
            }
        }
    }
    

    @IBAction func cancelbtn_click(_ sender: Any) {
        
        manualhiddenview.isHidden = true
        
    }
    
    @IBAction func droplocationbtnclick(_ sender: Any) {
        
        let center = CLLocationCoordinate2DMake(Double(AppConstants.driverselectaddressLat)!, Double(AppConstants.drivertselectaddressLng)!)
        let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
        let bounds = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.autocompleteBounds = bounds
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)

    }
    
    @IBAction func selectcountrycodebtnclick(_ sender: Any) {
        
        manualhiddenview.isHidden = false

    }

    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    
    func showAlertMessage(_ title:String,Message:String){
        
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true){}
    }
    
    
    func callbookingapi(){
        
        
        
        
        var nsdic : [String: AnyObject] = [:]
        
        nsdic.updateValue((1) as AnyObject, forKey: "stop")
        nsdic.updateValue(manualdroplat as AnyObject, forKey: "drop_latitude")
        nsdic.updateValue(manualdroplong as AnyObject, forKey: "drop_longitude")
        nsdic.updateValue(manualdroplocation as AnyObject, forKey: "drop_location")
        nsdic.updateValue("1" as AnyObject, forKey: "status")
        
        pidarray.add(nsdic)
        strJsonData6 = json(from: pidarray)!
        
        let distance = estimatedata.manualestimatedata?.distance ?? ""
        let time = estimatedata.manualestimatedata?.time ?? ""
        let amount = estimatedata.manualestimatedata?.amount ?? ""
        showLoaderWithoutBackground()
        
        let dic1 = ["pickup_location":pickuplocationtext!.text!,
                    "pickup_latitude": AppConstants.driverselectaddressLat,
                    "pickup_longitude": AppConstants.drivertselectaddressLng,
                    "name": self.enterusernametext.text!,
                    "phone": self.countrycodetext.text! + self.enteruserphonetext.text!,
                    "accuracy": AppConstants.calculatedAccuracy,
                    "drop_location": strJsonData6,
                    "estimate_distance":distance,
                    "estimate_time":time,
                    "estimate_bill":amount
            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.MANUALCHECKOUTBOOKING
        ServiceManager.sharedInstance.delegate = self
        
        
      //  print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ManualDispatchCheckOutModel.self)
    }
    
func callconfirmbookingapi(){
    showLoaderWithoutBackground()
    
    let dic1 = ["checkout_id":checkoutid
               
        ] as [String : AnyObject]
    
    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERMANUALRIDE
    ServiceManager.sharedInstance.delegate = self
 //   print(apiRequestUrl)
    
    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverManualModel.self)
    }
    
    
    @IBAction func startridebtnclick(_ sender: Any)
    {
        
        if manualdroplat == ""{
            
            self.showAlertMessage("", Message: "Please enter drop location first.".localized)
            return
        }
        
        if (self.enterusernametext.text?.count)! < 2 {
            self.showErrorAlert("", alertMessage: "Please Enter First Name".localized, VC: self)
            
            return
        }
        
        
        
        
      
              if (self.enteruserphonetext.text?.count)! >= (AppConstants.driverconfiguredata.data?.countries![manualselectindexvalue].minNumPhone)! &&  (self.enteruserphonetext.text?.count)! <= (AppConstants.driverconfiguredata.data?.countries![manualselectindexvalue].maxNumPhone)!{
                
                
          
            
            let dic1 = ["latitude": manualdroplat as AnyObject,
                        "area_id": Areaid,
                        "longitude": manualdroplong,
                        "service_type": "1"
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHECKDROPLOCATIONAREA
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PoolAreaModel.self)

        
              }else{
                
                
                  self.showErrorAlert("", alertMessage: "phone number should exist between ".localized + "\((AppConstants.driverconfiguredata.data?.countries![manualselectindexvalue].minNumPhone)!)" + " to ".localized + "\((AppConstants.driverconfiguredata.data?.countries![manualselectindexvalue].maxNumPhone)!)" + " digits.".localized, VC: self)
            }

            
        
     
    }
    
    //API CALL FOR GETTING ESTIMATE DATA
    //==================================
    func getEstimate()
    {
        
        
        
        var nsdic : [String: AnyObject] = [:]
        
        nsdic.updateValue((1) as AnyObject, forKey: "stop")
        nsdic.updateValue(manualdroplat as AnyObject, forKey: "drop_latitude")
        nsdic.updateValue(manualdroplong as AnyObject, forKey: "drop_longitude")
        nsdic.updateValue(manualdroplocation as AnyObject, forKey: "drop_location")
        nsdic.updateValue("1" as AnyObject, forKey: "status")
        
        pidarray.add(nsdic)
        strJsonData6 = json(from: pidarray)!
        
        
        showLoaderWithoutBackground()
        
        let dic1 = ["pickup_latitude": AppConstants.driverselectaddressLat,
                    "pickup_longitude": AppConstants.drivertselectaddressLng,
                    "service_type":"1",
                    "drop_location": strJsonData6
            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.MANUALDISPATCHESTIMATE
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ManualDispatchEstimateModel.self)

    }


func json(from object:Any) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        return nil
    }
    return String(data: data, encoding: String.Encoding.utf8)
}
}

extension ManualUserDetailsViewController: ApiResponseReceiver
{
    
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? PoolAreaModel
        {
            let data:PoolAreaModel = responseData
            if data.result == "1"
            {
                 hideLoaderWithoutBackground()
               
                 self.callbookingapi()
                
                
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert", alertMessage: data.message!, VC: self)
            }
        }
        if let responseData = response as? ManualDispatchCheckOutModel
        {
            let data:ManualDispatchCheckOutModel = responseData
            if data.result == "1"
            {
                 hideLoaderWithoutBackground()
                
                checkoutid = String((data.data?.id ?? 0)!)
                
                if estimatedata.otpManualDispatch == true
                {
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let loginController: OTPVerificationViewController = storyboard.instantiateViewController(withIdentifier: "OTPVerificationViewController") as! OTPVerificationViewController
                   loginController.comefromscreen = "1"
                    loginController.otpvaluetext = data.otp!
                    self.present(loginController, animated: true, completion: nil)
                    
                    
                }
                else
                {
                    self.callconfirmbookingapi()
                }
                
                
                
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert", alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverManualModel
        {
            let data:DriverManualModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                AppConstants.bookingid = String((data.data?.id)!)
                
                self.presentVC("TrackRideViewController")
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        if let responseData = response as? ManualDispatchEstimateModel
        {
            let data:ManualDispatchEstimateModel = responseData
            self.estimatedata = data
            if (data.result == "1")
            {
                hideLoaderWithoutBackground()
                pidarray.removeAllObjects()
                strJsonData6.removeAll()
                
                self.estimateView.isHidden = false
                self.startButtonTopConstraint.constant = 15
                self.estimatePriceLabel.text = "Est. Fare : ".localized + (data.manualestimatedata?.amount ?? "Not Found")
                self.estimateTimeLabel.text = "Est. Time : ".localized + (data.manualestimatedata?.time ?? "Not Found")
            }
            else if data.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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





extension ManualUserDetailsViewController {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print(place)
//        print("Place name: \(place.name)")
//        print("Place address: \(place.formattedAddress)")
//        print("Place attributions: \(place.attributions)")
//        print("Place attributions: \(place.coordinate.latitude)")
//        print("Place attributions: \(place.coordinate.longitude)")
        //  manualloactioncheck = "manual"
        
        droplocationtext.text = place.formattedAddress!
        
        
        self.manualdroplat = String(place.coordinate.latitude)
        self.manualdroplong = String(place.coordinate.longitude)
        self.manualdroplocation = place.formattedAddress!
        
        self.getEstimate()
        
        // GlobalVarible.Pickuptext = place.formattedAddress!
        // GlobalVarible.UserDropLocationText = place.formattedAddress!
     //   GlobalVariables.trackdroplocation = place.name
     //   GlobalVariables.dropLat = String(place.coordinate.latitude)
     //   GlobalVariables.dropLong = String(place.coordinate.longitude)
        
      //  self.dropchange = 1
        
        
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

extension ManualUserDetailsViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //personaldocsarray.count
        return (AppConstants.driverconfiguredata.data?.countries?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = manualcountrytableview.dequeueReusableCell(withIdentifier: "manualcell", for: indexPath) as! ManualTableViewCell
        cell.countrynamelbl.text = (AppConstants.driverconfiguredata.data?.countries![indexPath.row].phonecode)! + " " + (AppConstants.driverconfiguredata.data?.countries![indexPath.row].name)!
        
        
        let tableheight = manualcountrytableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            innerviewheight.constant = tableheight + 50.0
            
        }else{
            
            innerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        if(check1 == indexPath.row)
        {
            
            cell.selectedimage.image = UIImage(named: "icons8-0-percent-filled-50")
            
        }else{
            cell.selectedimage.image = UIImage(named: "icons8-0-percent-filled-50")
            
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        manualcountrytableview.deselectRow(at: indexPath, animated: true)
        check1 = indexPath.row
        manualselectindexvalue = indexPath.row
//        AppConstants.selectindexvalue4 = indexPath.row
//        print(AppConstants.selectindexvalue4)
        manualcountrytableview.reloadData()
        manualhiddenview.isHidden = true
        
        selcetcountrycode = (AppConstants.driverconfiguredata.data?.countries![manualselectindexvalue].phonecode)!
        print(selcetcountrycode)
        countrycodetext.text = selcetcountrycode
        
    }
    
}


extension ManualUserDetailsViewController: UITextFieldDelegate{
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let val = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
       if textField == self.enteruserphonetext{
            //Range.Lenth will greater than 0 if user is deleting text - Allow it to replce
            if string == ""
            {
                
                return true
            }
                
                //Check for max length including the spacers we added
            else if (val.count) > (AppConstants.driverconfiguredata.data?.countries![manualselectindexvalue].maxNumPhone)!
            {
                
                return false
            }
            else{
                return true
            }
            
        }
        
        return true
        
    }
    
}


