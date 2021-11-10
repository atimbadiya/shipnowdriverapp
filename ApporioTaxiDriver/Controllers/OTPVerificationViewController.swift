//
//  OTPVerificationViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/22/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper

class OTPVerificationViewController: BaseViewController {
    
    var otpvalue = ""
    
    
    var comefromscreen = ""
    
    var otpvaluetext = ""

    @IBOutlet weak var firsttxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var secondtxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var thirdtxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var fourthtxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var okbtn: UIButton!
    @IBOutlet weak var otptopview: UIView!
    @IBOutlet weak var bottombtnview: UIView!
    @IBOutlet weak var otpverificationlbl: UILabel!
    @IBOutlet weak var stackview: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        
        otpverificationlbl.text = "OTP Verification".localized
        okbtn.setTitle("OK".localized, for: .normal)
    
        firsttxtfld.delegate = self
        secondtxtfld.delegate = self
        thirdtxtfld.delegate = self
        fourthtxtfld.delegate = self
        
     
        
    }
   
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    @IBAction func okbtn_click(_ sender: Any) {
       
       otpvalue = firsttxtfld.text! + secondtxtfld.text! + thirdtxtfld.text! + fourthtxtfld.text!
        
        if firsttxtfld.text == "" || secondtxtfld.text == "" || thirdtxtfld.text == "" || fourthtxtfld.text == ""{
         
            self.showErrorAlert("", alertMessage: "Please Enter OTP First".localized, VC: self)
            
        }else
        {
            
            if comefromscreen == "1"{
                
                
                if otpvaluetext == otpvalue{
                    
                    AppConstants.checkfromotp = 1
                    dismiss(animated: true, completion: nil)
                    comefromscreen = ""
                }else{
                    
                    self.showErrorAlert("", alertMessage: "Please enter valid otp".localized, VC: self)
                }
                
                
                
            }else{
          
            showLoaderWithoutBackground()
            
            let dic1 = ["booking_id": AppConstants.bookingid,
                        "otp": otpvalue] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEROTPVERIFICATION
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverOtpVerificationModel.self)
                
            }
            
        }
        
    }
    
   
  
    
}

extension OTPVerificationViewController: ApiResponseReceiver {
  
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? DriverOtpVerificationModel{
    let data:DriverOtpVerificationModel = responseData
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
        
        AppConstants.checkfromotp = 1
        dismiss(animated: true, completion: nil)
        
    }
    else if data.result == "999" {
        
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
}
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }

}


extension OTPVerificationViewController: UITextFieldDelegate {
    
  
    
    func moveToNext(textField : UITextField, withString text : String) {
        
        switch textField {
            
        case firsttxtfld :
            firsttxtfld.resignFirstResponder()
            secondtxtfld.becomeFirstResponder()
            secondtxtfld.text = text
            
        case secondtxtfld :
            secondtxtfld.resignFirstResponder()
            thirdtxtfld.becomeFirstResponder()
            thirdtxtfld.text = text
            
        case thirdtxtfld :
            thirdtxtfld.resignFirstResponder()
            fourthtxtfld.becomeFirstResponder()
            fourthtxtfld.text = text
            
        case fourthtxtfld :
            fourthtxtfld.resignFirstResponder()
        default :
            break
        }
        
    }
    
    func moveToPrev(textField : UITextField) {
        
        textField.text = nil
        switch textField {
            
        case firsttxtfld :
            break
            
        case secondtxtfld :
            secondtxtfld.resignFirstResponder()
            firsttxtfld.becomeFirstResponder()
        case thirdtxtfld :
            
            thirdtxtfld.resignFirstResponder()
            
            if let txt = secondtxtfld.text, txt.isEmpty {
                firsttxtfld.becomeFirstResponder()
            } else {
                secondtxtfld.becomeFirstResponder()
            }
            
        case fourthtxtfld :
            fourthtxtfld.resignFirstResponder()
            
            if let text = thirdtxtfld.text, text.isEmpty {
                if let txt = thirdtxtfld.text, txt.isEmpty {
                    firsttxtfld.becomeFirstResponder()
                } else {
                    secondtxtfld.becomeFirstResponder()
                }
            } else {
                thirdtxtfld.becomeFirstResponder()
            }
        default :
            break
        }
        // editingChangedOfTextfield(textField)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == " "{
            return false
        }
        
        if let text = textField.text, !text.isEmpty {
            if range.length != 1 {
                moveToNext(textField: textField, withString: string)
                return false
            } else {
                moveToPrev(textField: textField)
                return false
            }
        }
        
        return true
    }
    
    
}
