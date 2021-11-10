//
//  VerifyPhoneViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper
import FirebaseAuth
import FirebaseCore

class VerifyPhoneViewController: BaseViewController {
    
//    var countryArray = ["+60 Malaysia", "+91 India"]
//    var imageArray =
    var matchString: String = ""
    var phoneText = ""
    var selectCountryCode = String((AppConstants.driverconfiguredata.data?.countries![0].phonecode)!)
    var selectCountryID = String((AppConstants.driverconfiguredata.data?.countries![0].id)!)
    var check1 = 0
    //var selectindexvalue1 = 0
    var otpvalue = "0"
    var verifyMailOrPhone:verifyMailOrPhone = .phone
    
    @IBOutlet weak var veriftinnerviewheight: NSLayoutConstraint!
    @IBOutlet weak var verifyphonenotextlbl: UILabel!
    @IBOutlet weak var countrycodelbl: UILabel!
    @IBOutlet weak var enterphonetxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var getotpbtntext: UIButton!
    @IBOutlet weak var pleaseenterotptextlbl: UILabel!
    @IBOutlet weak var enterotptxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var reenterbtntxt: UIButton!
    @IBOutlet weak var continuebtntxt: UIButton!
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var getotpbtnview: UIView!
    @IBOutlet weak var continuebtnview: UIView!
    @IBOutlet weak var selectcountrylbl: UILabel!
    @IBOutlet weak var hiddenviewokbtntxt: UIButton!
    @IBOutlet weak var hiddenviewcancelbtntxt: UIButton!
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var innerhiddenview: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var countryCodeContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countrycodelbl.text = selectCountryCode
        
        UserDefaultUtility.saveStringWithKey(selectCountryID, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
        
        UserDefaultUtility.saveStringWithKey(String((AppConstants.driverconfiguredata.data?.countries![0].distanceUnit)!), key: AppConstants.UserDefaultKeys.DISTANCE_UNIT)
        
//        AppConstants.countryId = Int(selectCountryCode)!
        
        self.verifyphonenotextlbl.text = "Verify Your Phone Number".localized
        self.getotpbtntext.setTitle("GET OTP".localized, for: .normal)
        self.selectcountrylbl.text = "Select Country".localized
        self.hiddenviewokbtntxt.setTitle("OK".localized, for: .normal)
        self.hiddenviewcancelbtntxt.setTitle("CANCEL".localized, for: .normal)
        self.pleaseenterotptextlbl.text = "Please enter the One Time Password(OTP) recieved on your number!".localized
        self.enterotptxtfld.placeholder = "ENTER OTP".localized
        self.reenterbtntxt.setTitle("Re-enter Phone".localized, for: .normal)
        continuebtntxt.setTitle("Continue".localized, for: .normal)
        
        self.hiddenview.isHidden = true
        self.continuebtnview.isHidden = true
        
        //selectindexvalue1 = 0
        selectCountryCode = (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].phonecode)!
        countrycodelbl.text = selectCountryCode
        
        enterphonetxtfld.selectedTitleColor = UIColor.appThemeColor()
        enterphonetxtfld.selectedLineColor = UIColor.clear
        
        enterotptxtfld.selectedTitleColor = UIColor.appThemeColor()
        enterotptxtfld.selectedLineColor = UIColor.clear
        
        if verifyMailOrPhone == .phone {
       setPhoneVerificationData()
        }else  if verifyMailOrPhone == .email {
             setMailVerificationData()
        }else  if verifyMailOrPhone == .forgotPassword { // Coming from ForgotPassword
            if let signUpFormData = AppConstants.driverconfiguredata.data?.login {
                if signUpFormData.phone! == true {
                    setPhoneVerificationData()
                } else {
                    setMailVerificationData()
                }
            }
        }
        
    }

    //------Action Performed------
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    @IBAction func hiddenviewokbtn_click(_ sender: Any) {
        hiddenview.isHidden = true
    }
    @IBAction func hiddenviewcancelbtn_click(_ sender: Any) {
        hiddenview.isHidden = true
    }
    @IBAction func countrycodebtn_click(_ sender: Any) {
        self.hiddenview.isHidden = false
    }
    @IBAction func getotpbtn_click(_ sender: Any) {
//        self.continuebtnview.isHidden = false
//        phoneText = self.enterphonetxtfld.text!
        
        if matchString == "forgot" {
            var dic1 = [String:AnyObject]()
            if let signUpFormData = AppConstants.driverconfiguredata.data?.login {
                
                if signUpFormData.phone! == true {
                     dic1 = ["type": "2" as AnyObject,
                                "user_name":  countrycodelbl.text! + self.enterphonetxtfld.text!,
                                "for": "PHONE"
                        ] as [String : AnyObject]
    
                } else {
                     dic1 = ["type": "2" as AnyObject,
                                "user_name": self.enterphonetxtfld.text!,
                                "for": "EMAIL"
                        ] as [String : AnyObject]
                }
                showLoaderWithoutBackground()
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTP
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverOtpModel.self)
            }
            
        } else {
            if verifyMailOrPhone == .phone {
                
                if (self.enterphonetxtfld.text?.count)! >= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)! &&  (self.enterphonetxtfld.text?.count)! <= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!{
                    
                    let phoneNumber = self.enterphonetxtfld.text ?? ""
                    var intPhoneNumber = ""
                    
                    if (self.enterphonetxtfld.text?.count == 9 && phoneNumber.prefix(0) != "0"){
                        
                        intPhoneNumber = "0" + phoneNumber
                    }
                    else{
                      intPhoneNumber = phoneNumber
                    }

                        let dic1 = ["type": "1" as AnyObject,
                                    "country_code": countrycodelbl.text!,
                                    "user_name": countrycodelbl.text! + intPhoneNumber,
                                    "for": "PHONE"
                            ] as [String : AnyObject]
                    
                        showLoaderWithoutBackground()

                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTP
                        ServiceManager.sharedInstance.delegate = self
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverOtpModel.self)

                }else{
                    
                    self.showErrorAlert("", alertMessage: "phone number should exist between ".localized + "\((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)!)" + " to ".localized + "\((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!)" + " digits.".localized, VC: self)
                    
                }
            } else if verifyMailOrPhone == .email {
                if (enterphonetxtfld.text?.isEmail)! {
                    
                        let dic1 = ["type": "1" as AnyObject,
                                    "user_name": enterphonetxtfld.text!,
                                    "for": "EMAIL"
                            ] as [String : AnyObject]
                    
                        showLoaderWithoutBackground()
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTP
                        ServiceManager.sharedInstance.delegate = self
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverOtpModel.self)
                    
                }else{
                    self.showErrorAlert("", alertMessage: "Please enter email in correct Format".localized, VC: self)
                    
                }
            }
            
        }
        
//          if let signUpFormData = AppConstants.driverconfiguredata.data?.login {
//
//        if signUpFormData.phone! == true {
//
//            if (self.enterphonetxtfld.text?.count)! >= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)! &&  (self.enterphonetxtfld.text?.count)! <= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!{
//
//                if (matchString == "forgot"){
//
//                    let dic1 = ["type": "2" as AnyObject,
//                                "user_name": self.enterphonetxtfld.text!,
//                                "for": "PHONE"
//                                ] as [String : AnyObject]
//
//                    showLoaderWithoutBackground()
//
//                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTP
//                    ServiceManager.sharedInstance.delegate = self
//                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverOtpModel.self)
//                }else{
//
//
//
//                    let dic1 = ["type": "1" as AnyObject,
//                                "user_name": self.enterphonetxtfld.text!,
//                                "for": "PHONE"
//                                ] as [String : AnyObject]
//
//                    showLoaderWithoutBackground()
//
//
//
//                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTP
//                    ServiceManager.sharedInstance.delegate = self
//                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverOtpModel.self)
//
//                }
//
//
//            }else{
//
//
//                //            self.showErrorAlert("", alertMessage: "phone number should exist between ".localized + AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone + " to ".localized + AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone + " digits.".localized, VC: self)
//
//                self.showErrorAlert("", alertMessage: "phone number should exist between ".localized + "\(AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)" + " to ".localized + "\(AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)" + " digits.".localized, VC: self)
//
//            }
//
//
//        } else {
//
//            if (enterphonetxtfld.text?.isEmail)! {
//
//                if matchString == "forgot" {
//
//                    let dic1 = ["type": "2" as AnyObject,
//                                "user_name": self.enterphonetxtfld.text!,
//                                 "for": "Email"
//                                ] as [String : AnyObject]
//
//                    showLoaderWithoutBackground()
//
//
//
//                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTP
//                    ServiceManager.sharedInstance.delegate = self
//                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverOtpModel.self)
//                }else{
//
//
//
//                    let dic1 = ["type": "1" as AnyObject,
//                                "user_name": enterphonetxtfld.text!,
//                                "for": "Email"
//                                ] as [String : AnyObject]
//
//                    showLoaderWithoutBackground()
//
//
//
//                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTP
//                    ServiceManager.sharedInstance.delegate = self
//                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DriverOtpModel.self)
//
//                }
//
//            }else{
//
//
//                self.showErrorAlert("", alertMessage: "Please enter email in correct Format".localized, VC: self)
//
//            }
//
//        }
//    }
}
    
    func otpVerification(from: String)
    {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: UserDefaults.standard.string(forKey: "authVerificationID")!,
            verificationCode: self.enterotptxtfld.text!)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                self.showErrorAlert("Alert".localized, alertMessage: "Please enter valid verification code.".localized, VC: self)
                return
            }
            print("Login Success")
            print(self.selectCountryCode)
            print(self.enterphonetxtfld.text!)
            AppConstants.enterdriverphonenumber = self.selectCountryCode + self.enterphonetxtfld.text!
            print(AppConstants.enterdriverphonenumber)
            if (from == "forgot") {
                self.presentVC("ForgotPasswordViewController")
            }
            else{
                self.dismissVC()
            }
        }
    }
    
    @IBAction func reenterbtn_click(_ sender: Any) {
        self.continuebtnview.isHidden = true
        self.getotpbtnview.isHidden = false
    }
    
    @IBAction func continuebtn_click(_ sender: Any) {
        
        phoneText = self.enterphonetxtfld.text!
        
        if (matchString == "forgot") {
            if let signUpFormData = AppConstants.driverconfiguredata.data?.login {
                if signUpFormData.phone! == true {
                    if ((AppConstants.driverconfiguredata.data?.generalConfig?.otpFromFirebase == true)) {
                        self.otpVerification(from: matchString)
                    }
                    else if otpvalue == self.enterotptxtfld.text! {
                        AppConstants.enterdriverphonenumber = self.selectCountryCode + phoneText
                        self.presentVC("ForgotPasswordViewController")
                    }
                }else {
                    if otpvalue == self.enterotptxtfld.text!{
                        AppConstants.enterDriverEmailAddress =  phoneText
                        self.presentVC("ForgotPasswordViewController")
                    }
                }
            }
            
            
        }else {
            AppConstants.checkphonenumber = 1
            if verifyMailOrPhone == .phone {
                if ((AppConstants.driverconfiguredata.data?.generalConfig?.otpFromFirebase == true)) {
                    self.otpVerification(from: matchString)
                }
                else if otpvalue == self.enterotptxtfld.text! {
                    AppConstants.enterdriverphonenumber = self.selectCountryCode + phoneText
                    self.dismissVC()
                }
            } else  if verifyMailOrPhone == .email {
                if otpvalue == self.enterotptxtfld.text!{
                    AppConstants.enterDriverEmailAddress =  phoneText
                    self.dismissVC()
                }
            }
        }
    }
}

extension VerifyPhoneViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //personaldocsarray.count
        return (AppConstants.driverconfiguredata.data?.countries?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath) as! SelectCountryTableViewCell
        cell.countryname.text = (AppConstants.driverconfiguredata.data?.countries![indexPath.row].phonecode)! + " " + (AppConstants.driverconfiguredata.data?.countries![indexPath.row].name)!
        //cell.countryimage
        
        let tableheight = hiddentableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            veriftinnerviewheight.constant = tableheight + 100.0
            
        }else{
            
            veriftinnerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        if(check1 == indexPath.row)
        {
            
            cell.countryimage.image = UIImage(named: "radio-on-button")
            
        }else{
            cell.countryimage.image = UIImage(named: "icons8-0-percent-filled-50")
            
        }
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hiddentableview.deselectRow(at: indexPath, animated: true)
        check1 = indexPath.row
        AppConstants.selectindexvalue4 = indexPath.row
        print(AppConstants.selectindexvalue4)
        hiddentableview.reloadData()
        hiddenview.isHidden = true
        
        selectCountryCode = (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].phonecode)!
        
        selectCountryID = String((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].id)!)
        UserDefaultUtility.saveStringWithKey(selectCountryID, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
        
        UserDefaultUtility.saveStringWithKey(String((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].distanceUnit)!), key: AppConstants.UserDefaultKeys.DISTANCE_UNIT)
        
//        AppConstants.countryId = Int(selectCountryCode)!
        print(selectCountryCode)
        countrycodelbl.text = selectCountryCode
        
    }
    
    //MARKS:- IBACTIONS
    //============
    func setPhoneVerificationData() {
        verifyphonenotextlbl.text = "Verify Your Phone Number".localized
        countryCodeContainerView.isHidden = false
        self.enterphonetxtfld.placeholder = "Enter Phone".localized
        enterphonetxtfld.keyboardType = .numberPad
        self.pleaseenterotptextlbl.text = "Please enter the One Time Password(OTP) recieved on your number!".localized
        self.reenterbtntxt.setTitle("Re-enter Phone".localized, for: .normal)
    }
    
    func setMailVerificationData() {
        verifyphonenotextlbl.text = "Verify Your Email".localized
        countryCodeContainerView.isHidden = true
        self.enterphonetxtfld.placeholder = "Enter Email".localized
        enterphonetxtfld.keyboardType = .emailAddress
        self.pleaseenterotptextlbl.text = "Please enter the One Time Password(OTP) recieved on your email!".localized
        self.reenterbtntxt.setTitle("Re-enter Email".localized, for: .normal)

    }
    
}

//------Api Response------

extension VerifyPhoneViewController:ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverOtpModel{
            let data:DriverOtpModel = responseData
            if data.result == "1" {
                hideLoaderWithoutBackground()
                if ((AppConstants.driverconfiguredata.data?.generalConfig?.otpFromFirebase == true))
                {
                    PhoneAuthProvider.provider().verifyPhoneNumber((self.selectCountryCode + self.enterphonetxtfld.text!), uiDelegate: nil) { (verificationID, error) in
                        if let error = error {
                            print(error.localizedDescription)
                            self.showErrorAlert("", alertMessage: error.localizedDescription, VC: self)
                            // self.showMessagePrompt(error.localizedDescription)
                            return
                        }
                        print(verificationID!)
                        self.showErrorAlert("", alertMessage: "Otp Send On Entered Number".localized, VC: self)
                        self.continuebtnview.isHidden = false
                        self.enterotptxtfld.becomeFirstResponder()
                        self.getotpbtnview.isHidden = true
                        UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    }
                }
                else
                {
                    continuebtnview.isHidden = false
                    getotpbtnview.isHidden = true
                    if (data.data?.autoFill)! {
                        otpvalue = (data.data?.otp)!
                        enterotptxtfld.text = data.data?.otp ?? "0"
                    }else{
                        otpvalue = (data.data?.otp ?? "0")!
                    }
                }
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else {
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


extension VerifyPhoneViewController: UITextFieldDelegate{
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let val = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        
         if verifyMailOrPhone == .phone {
        
        if  textField == self.enterphonetxtfld{
            //Range.Lenth will greater than 0 if user is deleting text - Allow it to replce
            if string == ""
            {
                
                return true
            }
                
                //Check for max length including the spacers we added
            else if (val.count) > (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!
            {
                
                return false
            }
            else{
                return true
            }
            
        }
            
        else{
            return true
        }
            
            
        }
        return true
        
    }
    
    
    
}

