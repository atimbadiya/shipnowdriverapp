//
//  LoginViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper

class LoginViewController: BaseViewController {

    @IBOutlet weak var innerviewheight: NSLayoutConstraint!
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var innerhiddenview: UIView!
    @IBOutlet weak var selectcitylbl: UILabel!
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var loginlbl: UILabel!
    @IBOutlet weak var countrycodelbl: UILabel!
    @IBOutlet weak var phonetxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var pwdtxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var forgotpwdbtntext: UIButton!
    @IBOutlet weak var loginbtnlbl: UILabel!
    @IBOutlet weak var loginmainview: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var countryCodeContainerView: UIView!
    
    var loginScreenData: DriverAppConfigureLogin?
   // var playerid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.PLAYER_ID)
    var check2 = 0
    var selectindexvalue2 = 0
    var selectCountryCode: String = String((AppConstants.driverconfiguredata.data?.countries![0].phonecode)!)
    
     var selectCountryID: String = String((AppConstants.driverconfiguredata.data?.countries![0].id)!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenview.isHidden = true
        
        countrycodelbl.text = selectCountryCode
        
        UserDefaultUtility.saveStringWithKey(selectCountryID, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
        
        UserDefaultUtility.saveStringWithKey(String((AppConstants.driverconfiguredata.data?.countries![0].distanceUnit)!), key: AppConstants.UserDefaultKeys.DISTANCE_UNIT)
        
//        AppConstants.countryId = Int(selectCountryCode)!
        
        phonetxtfld.selectedTitleColor = UIColor.appTextDarkColor()
        pwdtxtfld.selectedTitleColor = UIColor.appTextDarkColor()
        loginmainview.edgeWithShadow(edge: 0.0)
        
        self.loginlbl.text = "Login".localized
        self.loginbtnlbl.text = "Login".localized
        self.pwdtxtfld.placeholder = "Password".localized
        self.selectcitylbl.text = "Select City".localized
        self.forgotpwdbtntext.setTitle("Forgot Password?".localized, for: .normal)
        self.phonetxtfld.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        
    }
    //uttam to limit the phone number
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        let textLenght = textField.text?.count
        let maxlength = (AppConstants.driverconfiguredata.data?.countries![selectindexvalue2].maxNumPhone)!
        if let texlength = textLenght, texlength > maxlength {
            textField.text?.removeLast()
            
            //  self.showErrorAlert("", alertMessage: "phoneNumber".localized, VC: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        AppConstants.documentscreenapi = "1"
        if let reflectScreenData = loginScreenData{
            
            if reflectScreenData.email! {
                countryCodeContainerView.isHidden = true
                phonetxtfld.keyboardType = .emailAddress
                phonetxtfld.placeholder = "Email".localized
            } else {
                countryCodeContainerView.isHidden = false
                phonetxtfld.keyboardType = .phonePad
                phonetxtfld.placeholder = "Phone Number".localized
            }
        }
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    @IBAction func countrycode_btn(_ sender: Any) {
        hiddenview.isHidden = false
    }
    @IBAction func forgotpwd_btn_click(_ sender: Any) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = "forgot"
        verifyViewController.verifyMailOrPhone = .forgotPassword
        self.present(verifyViewController, animated:true, completion:nil)
    }
    
    @IBAction func loginbtn_click(_ sender: Any) {
        var dic1 = [String : AnyObject]()
        if let reflectScreenData = loginScreenData{
            if reflectScreenData.email! {
                if  (phonetxtfld.text?.isValidEmailId())! {
                    if (pwdtxtfld.text?.isPasswordValid())! {
                        dic1 = ["phone":  self.phonetxtfld.text!,
                                "password": self.pwdtxtfld.text!,
                                "device":"2",
                                "player_id":UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID)
                            ] as [String : AnyObject]
                        
                        
                          hitLoginApi(dic: dic1)
                    } else {
                        showErrorAlert("Alert".localized, alertMessage: "Please Enter Password".localized, VC: self)
                    }
                    
                } else {
                    showErrorAlert("Alert".localized, alertMessage: "Please Enter Valid Email_Address".localized, VC: self)
                }

            } else {
                
                let phoneNumber = self.phonetxtfld.text ?? ""
                var intPhoneNumber = ""
                
                if (self.phonetxtfld.text?.count)! >= (AppConstants.driverconfiguredata.data?.countries![selectindexvalue2].minNumPhone)! &&  (self.phonetxtfld.text?.count)! <= (AppConstants.driverconfiguredata.data?.countries![selectindexvalue2].maxNumPhone)!
                {
                    if (self.phonetxtfld.text?.count == 9 && phoneNumber.prefix(0) != "0"){
                        
                        intPhoneNumber = "0" + phoneNumber
                  //      dic1["phone"] =  countrycodelbl.text! + intPhoneNumber as AnyObject
                    }else{
                        intPhoneNumber = phoneNumber
                      //  dic1["phone"] = countrycodelbl.text! + self.phonetxtfld.text! as AnyObject
                        }

               // if (phonetxtfld.text?.isPhoneNumberValid())! {
                    if (pwdtxtfld.text?.isPasswordValid())! {
                        dic1 = ["phone" :countrycodelbl.text! + intPhoneNumber,
                            "password": self.pwdtxtfld.text!,
                                "device":"2"
                            
                            ] as [String : AnyObject]
                        
                        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.PLAYER_ID){
                            
                            
                            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID) as AnyObject
                            
                        }else{
                            dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
                        }
 
                        hitLoginApi(dic: dic1)
                    }
                    else {
                        showErrorAlert("Alert".localized, alertMessage: "Please Enter Password".localized, VC: self)
                    }
                    
                }
                else{
                    showErrorAlert("Alert".localized, alertMessage: "Please Enter Valid Phone Number".localized, VC: self)
                }
            
//                } else {
//                    showErrorAlert("Alert".localized, alertMessage: "Please Enter Valid Phone Number".localized, VC: self)
//                }
            }
        }
        
    }
    
    //MARK:- Functions
    //==============
    func hitLoginApi(dic: [String : AnyObject]) {
        showLoaderWithoutBackground()
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERLOGIN
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: DriverAccessTokenModel.self)
    }
}


extension LoginViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //personaldocsarray.count
        return (AppConstants.driverconfiguredata.data?.countries?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hiddentableview.dequeueReusableCell(withIdentifier: "loginselecthiddencell", for: indexPath) as! LoginSelectCityTableViewCell
        cell.logincountryname.text = (AppConstants.driverconfiguredata.data?.countries![indexPath.row].phonecode)! + " " + (AppConstants.driverconfiguredata.data?.countries![indexPath.row].name)!
        
        
        let tableheight = hiddentableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            innerviewheight.constant = tableheight + 100.0
            
        }else{
            
            innerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        if(check2 == indexPath.row)
        {
            
            cell.logincountryimageview.image = UIImage(named: "radio-on-button")
            
        }else{
            cell.logincountryimageview.image = UIImage(named: "icons8-0-percent-filled-50")
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hiddentableview.deselectRow(at: indexPath, animated: true)
        check2 = indexPath.row
        selectindexvalue2 = indexPath.row
        print(selectindexvalue2)
        hiddentableview.reloadData()
        hiddenview.isHidden = true
        
        selectCountryCode = (AppConstants.driverconfiguredata.data?.countries![selectindexvalue2].phonecode)!
        
         selectCountryID = String((AppConstants.driverconfiguredata.data?.countries![selectindexvalue2].id)!)
        
        print(selectCountryCode)
        UserDefaultUtility.saveStringWithKey(selectCountryID, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
        
        UserDefaultUtility.saveStringWithKey(String((AppConstants.driverconfiguredata.data?.countries![selectindexvalue2].distanceUnit)!), key: AppConstants.UserDefaultKeys.DISTANCE_UNIT)
        
//        AppConstants.countryId = Int(selectCountryCode) ?? 0
        
        countrycodelbl.text = selectCountryCode
        
    }
}


extension LoginViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? DriverAccessTokenModel
        {
            let data:DriverAccessTokenModel = responseData
            if (data.result == "1")
            {
                
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.saveBoolForKey(AppConstants.UserDefaultKeys.Taxi_Company, value: (data.data?.taxicompany) ?? false)
                
                UserDefaultUtility.saveBoolForKey(AppConstants.UserDefaultKeys.FIREBASE_ONESIGNAL_CHECK, value: data.data?.pushNotification?.fireBase ?? false)
                
                UserDefaultUtility.saveStringWithKey((data.data?.accessToken)!, key: AppConstants.UserDefaultKeys.CLIENT_ID)
                
                AppConstants.dicauthorization = ["Accept":"application/json",
                                                 "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                                 "locale":AppConstants.languagecode
                    
                    ] as [String : AnyObject]
                
                let dic1 = [:] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDETAILS
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverLoginModel.self)
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverLoginModel
        {
            let data:DriverLoginModel = responseData
            if data.result == "1"
            {
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.saveStringWithKey((data.data!.signupStep ?? "")!, key: AppConstants.UserDefaultKeys.SIGNUP_STEP)
                UserDefaultUtility.saveStringWithKey((data.data!.email ?? "")!, key: AppConstants.UserDefaultKeys.EMAIL_ID)
                UserDefaultUtility.saveStringWithKey((data.data!.phoneNumber ?? "")!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                UserDefaultUtility.saveStringWithKey((data.data!.firstName ?? "")!, key: AppConstants.UserDefaultKeys.FIRST_NAME)
                UserDefaultUtility.saveStringWithKey((data.data!.lastName ?? "")!, key: AppConstants.UserDefaultKeys.LAST_NAME)
                UserDefaultUtility.saveStringWithKey((data.data!.password ?? "")!, key: AppConstants.UserDefaultKeys.PASSWORD)
                UserDefaultUtility.saveStringWithKey((data.data!.profileImage ?? "")!, key: AppConstants.UserDefaultKeys.DRIVER_IMAGE)
                UserDefaultUtility.saveStringWithKey((String((data.data!.driverGender ?? 0)!)), key: AppConstants.UserDefaultKeys.DRIVER_GENDER)
                UserDefaultUtility.saveStringWithKey((String((data.data!.onlineOffline ?? 0)!)), key: AppConstants.UserDefaultKeys.ONLINE_OFFLINE)
                UserDefaultUtility.saveStringWithKey((String((data.data?.id ?? 0)!)), key: AppConstants.UserDefaultKeys.DRIVER_ID)
                UserDefaultUtility.saveStringWithKey((String((data.data!.freeBusy ?? 0)!)), key: AppConstants.UserDefaultKeys.BUSY_STATUS)
                UserDefaultUtility.saveStringWithKey((String((data.data!.loginLogout ?? 0)!)), key: AppConstants.UserDefaultKeys.LOGIN_LOGOUT)
                UserDefaultUtility.saveStringWithKey((String((data.data!.countryAreaId ?? 0)!)), key: AppConstants.UserDefaultKeys.AREAID)
                
                if data.data?.driverVehicle?.count == 0{
                    
                    UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                    
                }else{
                    
                    UserDefaultUtility.saveStringWithKey(String((data.data?.driverVehicle![0].id ?? 0)!), key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                    
                }
                
                 UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.DEMO_LOGIN)
                UserDefaultUtility.saveStringWithKey((data.data!.createdAt ?? "")!, key: AppConstants.UserDefaultKeys.DRIVER_REGISTERATION_DATE)
               
                UserDefaultUtility.saveStringWithKey(data.data?.autoAcceptStatus ?? "", key: AppConstants.UserDefaultKeys.AUTO_ACCEPT_VALUE)
                
                if data.data?.signupStep == "1"
                {
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: VehicleInformationViewController = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
                    nextController.movedFrom = movedFromDocVer.loginScreen.rawValue
                    self.present(nextController, animated: false, completion: nil)
                    //    self.presentVC("VehicleInformationViewController")
                    
                }
                else if data.data?.signupStep == "2"
                {
//                    AppConstants.drivervehicleid = String((data.data!.driverVehicle![0].id)!)
//
//                    UserDefaultUtility.saveStringWithKey(String((data.data!.driverVehicle![0].id)!), key: AppConstants.UserDefaultKeys.VEHICLE_ID)
//
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
                    nextController.moveDfrom = movedFromDocVer.loginScreen.rawValue
                    self.present(nextController, animated: false, completion: nil)
                    
                }
                else
                {
                    UserDefaultUtility.saveStringWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LAUNCHED, key: AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                        
                    }
                    if data.data?.termStatus == 1
                    {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsViewController") as! TermsConditionsViewController
                        verifyViewController.source = "LOGIN"
                        self.present(verifyViewController, animated:true, completion:nil)
                    }
                    else
                    {
                        UserDefaultUtility.saveStringWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LAUNCHED, key: AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                        if let window = self.view.window
                        {
                            window.rootViewController = nextController
                        }
                    }
                }
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
   
    func onError(_ errorResponse: String, errorObject: AnyObject?)
    {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
}

