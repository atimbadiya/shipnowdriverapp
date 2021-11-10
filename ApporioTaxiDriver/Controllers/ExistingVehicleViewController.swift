//
//  ExistingVehicleViewController.swift
//  Ozyca Driver
//
//  Created by Atul Jain on 08/02/19.
//  Copyright © 2019 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class ExistingVehicleViewController: BaseViewController,UITextFieldDelegate {
    
    
        var existingvehicledata : ExistingVehicleModel!
//     var data: RegisterDriver!
//    var sendvehicleotpdata: SendVehicleOtpModel!
    
//    var drivercityid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCityId)!
//    var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    var otpvalue = "0"
    var movedFrom = movedFromDocVer.existingVehicleScreen.rawValue
  //  @IBOutlet weak var clicktosendotpciew: UIView!
    @IBOutlet weak var donebtnview: UIView!
    
    @IBOutlet weak var cardetailsview: UIView!
    
    var driverid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.DRIVER_ID)
    
    @IBOutlet weak var otpview: UIView!
    
    @IBOutlet weak var submitbtnview: UIView!
    @IBOutlet weak var carnumbertext: UILabel!
    @IBOutlet weak var carnametext: UILabel!
    @IBOutlet weak var carimageview: UIImageView!
    @IBOutlet weak var enterotptext: UITextField!
    
    @IBOutlet weak var otphasbeensentlbl: UILabel!
    @IBOutlet weak var enterregisternumber: UITextField!
    @IBOutlet weak var submitbtn: UIButton!
    @IBOutlet weak var donebtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterotptext.placeholder = "Enter OTP".localized
        enterregisternumber.placeholder = "Enter vehicle number".localized
        submitbtn.setTitle("Submit".localized, for: .normal)
        otphasbeensentlbl.text = "Otp has been sent to admin driver".localized
        donebtn.setTitle("DONE".localized, for: .normal)
       
        
        submitbtnview.layer.cornerRadius = 8.0
        
        //clicktosendotpciew.layer.cornerRadius = 8.0
        
        cardetailsview.edgeWithShadow(edge: 0)
        
        donebtnview.layer.cornerRadius = 8.0
        
        cardetailsview.isHidden = true
        otpview.isHidden = true
        donebtnview.isHidden = true
        

        // Do any additional setup after loading the view.
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        cardetailsview.isHidden = true
        otpview.isHidden = true
        
    
        return true
    }
   
    
    
    @IBAction func submitbtnclick(_ sender: Any) {
        
         cardetailsview.isHidden = true
        otpview.isHidden = true
        donebtnview.isHidden = true
        if (enterregisternumber.text?.count)! < 2{
             self.showErrorAlert("Alert".localized, alertMessage: "Please enter vehicle id first".localized, VC: self)
           
            
        }else{
       
            let dic = ["code": enterregisternumber.text!,
                       "driver_id": driverid
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERVEHICLEREQUEST
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: ExistingVehicleModel.self)
        
        }
    }
    @IBAction func clicktosendbtnclick(_ sender: Any) {
        
//        APIManager.sharedInstance.delegate = self
//        APIManager.sharedInstance.SENDVEHICLEOTPMETHOD(Admindriverid: (existingvehicledata.details?.adminDriverId)!, Driverid: driverid, Carmodelid: (existingvehicledata.details?.carModelId)!)
//
        
       
    }
    
    @IBAction func donebtnclick(_ sender: Any) {
        
        if (enterotptext.text?.count)! < 4
            
        {
            
   
           self.showErrorAlert("", alertMessage: "Please Enter  OTP".localized, VC: self)
            
        }else{
            
           
            let dic = ["otp": enterotptext.text!,
                       "driver_id": driverid,
                       "driver_vehicle_id": String((existingvehicledata.data?.id)!)
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERVEHICLEOTP
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: DriverVehicleOtpModel.self)
          
        }
        
        
        
    }
    

    
}


extension ExistingVehicleViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? ExistingVehicleModel{
            let data:ExistingVehicleModel = responseData
            
            existingvehicledata = data
            
            if (existingvehicledata.result == "1") {
                
                hideLoaderWithoutBackground()
                //hiddenview.isHidden = false
                cardetailsview.isHidden = false
                otpview.isHidden = false
                donebtnview.isHidden = false
                
                AppConstants.downloadimage(imagename: (existingvehicledata.data?.vehicleImage)!, imageview: carimageview, placeholderimage: "pool")
                
                AppConstants.drivervehicleid =  String((existingvehicledata.data?.id ?? 0)!)
                
                UserDefaultUtility.saveStringWithKey(String((existingvehicledata.data?.id ?? 0)!), key: AppConstants.UserDefaultKeys.VEHICLE_ID)
                
                carnumbertext.text = existingvehicledata.data?.vehicleTypeName ?? ""
                
                carnametext.text = (existingvehicledata.data?.ownerDriver?.firstname ?? "")! + " " + (existingvehicledata.data?.ownerDriver?.lastname ?? "")!
                
                
            }else if
                data.result == "999"{
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
        
        
        if let responseData = response as? DriverVehicleOtpModel{
            let data:DriverVehicleOtpModel = responseData
            
           
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                  UserDefaultUtility.saveStringWithKey("2", key: AppConstants.UserDefaultKeys.SIGNUP_STEP)
                
                
                //hiddenview.isHidden = false
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
                nextController.moveDfrom = movedFromDocVer.existingVehicleScreen.rawValue
                self.present(nextController, animated: false, completion: nil)
                
            }else if
                data.result == "999"{
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                
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
