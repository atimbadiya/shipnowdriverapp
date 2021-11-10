//
//  CustomerSupportViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 12/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerSupportViewController: BaseViewController  {
    
    @IBOutlet weak var entername: UITextField!
    
    @IBOutlet weak var enteremail: UITextField!
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    
   //*** var data: CustomerSupportModel!
    @IBOutlet weak var nameview: UIView!
    
    @IBOutlet weak var emailview: UIView!
    
    @IBOutlet weak var enterphone: UITextField!
    
    @IBOutlet weak var queryview: UIView!
    
    @IBOutlet weak var enterquerytext: UITextView!
    @IBOutlet weak var phoneview: UIView!
    
    
    @IBOutlet var lblSend: UILabel!
    @IBOutlet var lblHaveQuery: UILabel!
    @IBOutlet var lblQueryInstruction: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblPhone: UILabel!
    @IBOutlet var lblYourQuery: UILabel!

    
 //***   var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblSend.text = "SEND".localized
        lblHaveQuery.text = "DO YOU HAVE A QUERY".localized
        lblQueryInstruction.text = "Please let us know about your query,our support team will get back to you".localized
        lblName.text = "Name".localized
        lblEmail.text = "Email".localized
        lblPhone.text = "Phone".localized
        lblYourQuery.text = "your Query".localized
        

        
        self.nameview.layer.borderWidth = 1.0
        self.nameview.layer.cornerRadius = 4
        self.nameview.layer.borderColor = UIColor.appThemeColor().cgColor
        self.emailview.layer.borderWidth = 1.0
        self.emailview.layer.cornerRadius = 4
        self.emailview.layer.borderColor = UIColor.appThemeColor().cgColor
        self.phoneview.layer.borderWidth = 1.0
        self.phoneview.layer.cornerRadius = 4
        self.phoneview.layer.borderColor = UIColor.appThemeColor().cgColor
        self.queryview.layer.borderWidth = 1.0
        self.queryview.layer.cornerRadius = 4
        self.queryview.layer.borderColor = UIColor.appThemeColor().cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height =  500
        self.scrollview.contentSize.width = 0
    }

    
    @IBAction func backbtn(_ sender: AnyObject) {
        
        self.dismissVC()
        
        //self.presentingViewController!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func sendbtn(_ sender: AnyObject) {
        
        if entername.text!.count < 2
        {
            self.showErrorAlert("", alertMessage: "Please Check Your Name".localized, VC: self);
            
        }
        else if enteremail.text!.count < 2{
            
            self.showErrorAlert("", alertMessage: "Please Check Your Email".localized, VC: self);
            
        }
        else if (!enteremail.text!.contains("@"))
        {
            let alert = UIAlertController(title: NSLocalizedString("", comment: ""), message:" Wrong Email format ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if (enteremail.text!.contains(" "))
        {
            let alert = UIAlertController(title: "", message:" Email id must not contain space ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        } else if enterquerytext.text!.count < 1{
            
            self.showErrorAlert("", alertMessage: "Please Check Your Query is blank".localized, VC: self);
            
        }
        
        else{
            
            
            showLoaderWithoutBackground()
            
            let dic1 = ["name": entername.text!,
                        "email": enteremail.text!,
                        "phone": enterphone.text!,
                        "message": enterquerytext.text!] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCUSTOMERSUPPORT
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCustomerSupportModel.self)

        }
        
        
        
    }
}
    extension CustomerSupportViewController: ApiResponseReceiver {
        
        
        func onSuccess<T>(_ response: T) where T : Mappable {
    
    if let responseData = response as? DriverCustomerSupportModel{
        let data:DriverCustomerSupportModel = responseData
        
        if (data.result == "1") {
            
            hideLoaderWithoutBackground()
            
            showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            
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
