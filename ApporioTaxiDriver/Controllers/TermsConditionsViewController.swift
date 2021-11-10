//
//  TermsConditionsViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import  ObjectMapper

class TermsConditionsViewController: BaseViewController {
    
     var value = 0
    @IBOutlet weak var toptermsconditionstextlbl: UILabel!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var acceptBtn: UIButton!
    var source = ""
    var countryId = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.COUNTRY_ID)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toptermsconditionstextlbl.text = "Terms & Conditions".localized
        self.acceptBtn.setTitle("ACCEPT".localized, for: .normal)
        //MARK:- ACCEPT BUTTON VISIBILITY CHECK
        //=====================================
        if self.source == "SIGNUP"
        {
            self.acceptBtn.isHidden = true
        }
        else if self.source == "NOTIFICATION" || self.source == "LOGIN"
        {
            self.acceptBtn.isHidden = false
        }
        else
        {
            self.acceptBtn.isHidden = true
        }
        
        if self.countryId == ""
        {
            
            showErrorAlert("Alert".localized, alertMessage: "Country ID is not correct".localized, VC: self)
        }
        else
        {
            
            let dic1 = ["slug":"terms_and_Conditions",
                        "country_id":self.countryId
                ] as [String : AnyObject]
            showLoaderWithoutBackground()
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCMSPAGES
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: CmsPagesModels.self)
            
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func acceptBtnTapped(_ sender: Any)
    {
        if self.source == "LOGIN" || self.source == "NOTIFICATION"
        {
            let dic1 = [:] as [String : AnyObject]
            showLoaderWithoutBackground()
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERACCEPTTERMS
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: TermsAcceptedModel.self)
        }
        else
        {
            self.dismissVC()
        }
    }
    
    
    @IBAction func hiddenbtnclick(_ sender: Any) {
        
        value = value + 1
        
        if value == 7{
            value = 0
            
            self.showErrorAlert("Basic Details", alertMessage: "Base Url: \(AppConstants.APIURL.BASE_URL) \n Google map key : \(AppConstants.googlemapkey) \n Public Key: \(AppConstants.publickey) \n Secret Key : \(AppConstants.secretkey) \n App Version : \(AppConstants.appversion)  \n Branch Version : \(AppConstants.branchversion)", VC: self)
            
        }else{
            
            
        }
        
    }
    

    @IBAction func backbtnclick(_ sender: Any)
    {
        if self.source == "NOTIFICATION"
        {
            showErrorAlert("Alert".localized, alertMessage: "Please Accept Terms And Conditions First".localized, VC: self)
        }
        else
        {
            self.dismissVC()
        }
    }
    

}

extension TermsConditionsViewController: ApiResponseReceiver{

    func onSuccess<T>(_ response: T) where T : Mappable {

        if let responseData = response as? CmsPagesModels
        {

            let data:CmsPagesModels = responseData
            if data.result == "1"
            {
                hideLoaderWithoutBackground()
                do {
                    let str = try NSAttributedString(data: (data.data?.descriptionValue)!.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
                    
                    textview.attributedText =  str
                } catch {
                    print(error)
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
        if let responseData = response as? TermsAcceptedModel
        {
            let data:TermsAcceptedModel = responseData
            if data.result == "1"
            {
                if self.source == "LOGIN"
                {
                    hideLoaderWithoutBackground()
                    UserDefaultUtility.saveStringWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LAUNCHED, key: AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
                    if let window = self.view.window
                    {
                        window.rootViewController = nextController
                    }
                }
                else if self.source == "NOTIFICATION"
                {
                    hideLoaderWithoutBackground()
                    self.dismissVC()
                }
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

        // presenter?.onError(errorResponse)
    }
    
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }


}
