//
//  SettingsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import MessageUI
import ObjectMapper

class SettingsViewController: BaseViewController,MFMailComposeViewControllerDelegate {
    
    var autostatus = ""
    var poolstatus = ""
    var installedNavigationApps : [String] = []
    @IBOutlet weak var setradiusviewheight: NSLayoutConstraint!
    @IBOutlet weak var setradiuslbl: UILabel!
    @IBOutlet weak var setradiusview: UIView!
    @IBOutlet weak var privacypolicylbl: UILabel!
    @IBOutlet weak var privacypolicyview: UIView!
    @IBOutlet weak var referearnview: UIView!
    
    @IBOutlet weak var referearntextlbl: UILabel!
    @IBOutlet weak var languagevaluelbl: UILabel!

    @IBOutlet weak var selectedNavigationLbl: UILabel!
    @IBOutlet weak var superdriverviewheight: NSLayoutConstraint!
    @IBOutlet weak var superdriverview: UIView!
    @IBOutlet weak var lastviewheight: NSLayoutConstraint!
    @IBOutlet weak var firstviewheight: NSLayoutConstraint!
    @IBOutlet weak var languageview: UIView!
    @IBOutlet weak var poolrideview: UIView!
    @IBOutlet weak var autoupgradeview: UIView!
    @IBOutlet weak var autoupgradeviewheight: NSLayoutConstraint!
    @IBOutlet weak var poolrideviewheight: NSLayoutConstraint!
    @IBOutlet weak var languageviewheight: NSLayoutConstraint!
    @IBOutlet weak var appsettingstopview: UIView!
    @IBOutlet weak var autoupgradelbl: UILabel!
    @IBOutlet weak var lastmainview: UIView!
    @IBOutlet weak var customerreportmaimview: UIView!
    @IBOutlet weak var appsettingstoplbl: UILabel!
    @IBOutlet weak var informationview: UIView!
    @IBOutlet weak var supportview: UIView!
    @IBOutlet weak var appsettingsview: UIView!
    @IBOutlet weak var poolrideimageview: UIImageView!
    @IBOutlet weak var languageimageview: UIImageView!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var autoupgradeswitch: UISwitch!
    @IBOutlet weak var poolridelbl: UILabel!
    @IBOutlet weak var languagelbl: UILabel!
    @IBOutlet weak var langpoolmainview: UIView!
    @IBOutlet weak var appsettingseclbl: UILabel!
    @IBOutlet weak var supportlbl: UILabel!
    @IBOutlet weak var customersupport: UILabel!
    @IBOutlet weak var reportissuelblb: UILabel!
    @IBOutlet weak var reportissueimageview: UIImageView!
    @IBOutlet weak var customersupportimageview: UIImageView!
    @IBOutlet weak var informationlbl: UILabel!
    @IBOutlet weak var termsconditionlbl: UILabel!
    @IBOutlet weak var aboutuslbl: UILabel!
    @IBOutlet weak var versionlbl: UILabel!
    @IBOutlet weak var aboutusimageview: UIImageView!
    @IBOutlet weak var termsconditionimageview: UIImageView!
    @IBOutlet weak var superdriverlbl: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var ratingViewHeightContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setradiuslbl.text = "Set Radius".localized
        privacypolicylbl.text = "Privacy Policy".localized
        referearntextlbl.text = "Refer & Earn".localized
        autoupgradelbl.text = "Auto Upgrade".localized
        appsettingstoplbl.text = "App Settings".localized
        poolridelbl.text = "Pool Ride".localized
        languagelbl.text = "Language".localized
        appsettingseclbl.text = "APP SETTINGS".localized
        supportlbl.text = "SUPPORT".localized
        customersupport.text = "Customer Support".localized
        reportissuelblb.text = "Report Issue".localized
        informationlbl.text = "INFORMATION".localized
        termsconditionlbl.text = "Terms and Conditions".localized
        aboutuslbl.text = "ABOUT US".localized
        superdriverlbl.text = "Super Driver".localized
        ratingLabel.text = "Your Ratings".localized
        languagevaluelbl.text = AppConstants.languagecode.localized
        selectedNavigationLbl.text = UserDefaults.standard.string(forKey: AppConstants.UserDefaultKeys.NAVIGATIONTYPE)
        
        self.versionlbl.text = "Version".localized + " " + (AppConstants.appversion)
        print(AppConstants.poolenablestatus)
       if AppConstants.poolenablestatus == "1"{
        
        self.switch.setOn(true, animated: true)
        poolstatus = "2"
        }else
       {
        self.switch.setOn(false, animated: true)
        poolstatus = "1"
        }
        if (AppConstants.poolenable!) && AppConstants.autoupgradation == "1"{
           
            firstviewheight.constant = 240
            poolrideviewheight.constant = 60
            poolrideview.isHidden = false
            autoupgradeviewheight.constant = 60
            autoupgradeview.isHidden = false
            
        }else if (AppConstants.poolenable!){
            firstviewheight.constant = 180
            poolrideviewheight.constant = 60
            autoupgradeviewheight.constant = 0
            poolrideview.isHidden = false
            autoupgradeview.isHidden = true
            
        }else if AppConstants.autoupgradation == "1"{
                firstviewheight.constant = 180
                autoupgradeviewheight.constant = 60
                autoupgradeview.isHidden = false
                 poolrideviewheight.constant = 0
                poolrideview.isHidden = true
                
            }else{
                firstviewheight.constant = 120
                autoupgradeviewheight.constant = 0
                poolrideviewheight.constant = 0
                autoupgradeview.isHidden = true
                poolrideview.isHidden = true
            }
        
        if AppConstants.autoupgradationstatus == "1"{
            
            self.autoupgradeswitch.setOn(true, animated: true)
            autostatus = "2"
        }else{
            
            self.autoupgradeswitch.setOn(false, animated: true)
            autostatus = "1"
        }
        
        if (((AppConstants.driverconfiguredata.data?.generalConfig?.driverLimit)!)){
            
           setradiusviewheight.constant = 60
            setradiusview.isHidden = false
            setRatingView()
        }else{
           
            setradiusviewheight.constant = 0
            setradiusview.isHidden = true
            setRatingView()
        }
        
        if ((AppConstants.driverconfiguredata.data?.generalConfig?.enableSuperDriver)!)
        {
            superdriverviewheight.constant = 60
            superdriverview.isHidden = false
            setRatingView()
        }
        else
        {
            superdriverviewheight.constant = 0
            superdriverview.isHidden = true
            setRatingView()
        }
        langpoolmainview.edgeWithShadow(edge: 0)
        customerreportmaimview.edgeWithShadow(edge: 0)
        lastmainview.edgeWithShadow(edge: 0)
        appsettingstopview.edgeWithShadow(edge: 0)
    }
    
    //MARK:- SET RATING VIEW VISIBILITY
    //=================================
    func setRatingView(){
        
        if (AppConstants.driverconfiguredata.data?.generalConfig?.enableSuperDriver)! || ((AppConstants.driverconfiguredata.data?.generalConfig?.driverLimit)!){
            
            ratingViewHeightContraint.constant = 60
            setradiusviewheight.constant = 60
            ratingView.isHidden = false
            setradiusview.isHidden = false
            lastviewheight.constant = 473
    
    }else
        if AppConstants.driverconfiguredata.data?.generalConfig?.enableSuperDriver == true
        {
            ratingViewHeightContraint.constant = 60
            ratingView.isHidden = false
            setradiusview.isHidden = true
            lastviewheight.constant = 413
        }
        else if ((AppConstants.driverconfiguredata.data?.generalConfig?.driverLimit)!){
           
            setradiusviewheight.constant = 60
            setradiusview.isHidden = false
            ratingView.isHidden = true
            lastviewheight.constant = 413
            
        }
            
        else
        {
            ratingViewHeightContraint.constant = 0
            setradiusviewheight.constant = 0
            ratingView.isHidden = true
            setradiusview.isHidden = true
            lastviewheight.constant = 353
        }
    }
    @IBAction func setradiusbtn_click(_ sender: Any) {
        
        self.presentVC("SetRadiusGuideViewController")
        
    }
    
    @IBAction func ratingBtnTapped(_ sender: Any)
    {
        self.presentVC("DriverRatingViewController")
    }
    
    
    @IBAction func referearnbtnclick(_ sender: Any) {
        
        self.presentVC("ReferEarnViewController")
    }
    
    @IBAction func privacypolicybtn_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: AboutUsViewController = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        nextController.checkforabout = "2"
        self.present(nextController, animated: false, completion: nil)
    }
    
    @IBAction func backbtn(_ sender: Any) {
        AppConstants.checkfromsetting = "1"
        self.dismissVC()
    }
    @IBAction func superdriverbtn_click(_ sender: Any) {
        
        self.presentVC("SuperDriverViewController")
        
    }
    @IBAction func switchtapped(_ sender: Any) {
        
        showLoaderWithoutBackground()
        
        let dic1 = ["pool_status": poolstatus] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERPOOLCHECK
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverPoolModel.self)
    }
    
    @IBAction func languagebtn_click(_ sender: Any) {
            
            let alertView = UIAlertController(title: "Select Language".localized, message: "Please Choose Language".localized, preferredStyle: .alert)
            
            let langCount = AppConstants.driverconfiguredata.data?.languages?.count ?? 1
            print(langCount)
            for i in 0..<langCount
            {
                let actionTitle = AppConstants.driverconfiguredata.data?.languages?[i].name
                let action = UIAlertAction(title: actionTitle, style: .default,handler: { (alert) in
                    //AppConstants.languageCodeSelectInMenu = 1
                    AppConstants.languageCodeSelectInMenu = 1
                    AppConstants.splashscreenoptions = 0
                    AppConstants.languagecode = (AppConstants.driverconfiguredata.data?.languages?[i].locale)!
                    print(AppConstants.languagecode)
                    self.languagevaluelbl.text = AppConstants.languagecode
                    AppConstants.dicwithpublic = ["Accept": "application/json",
                                                  "publicKey": AppConstants.publickey,
                                                  "secretKey": AppConstants.secretkey,
                                                  "locale": AppConstants.languagecode
                        
                        ] as [String : AnyObject]
                    UserDefaults.standard.set(AppConstants.driverconfiguredata.data?.languages?[i].locale , forKey: "PreferredLanguage")
                    Language.language = Language(rawValue: (AppConstants.driverconfiguredata.data?.languages?[i].locale)!)!
                    UserDefaults.standard.synchronize()
                })
                alertView.addAction(action)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel".localized,
                                             style: .cancel, handler: nil)
            alertView.addAction(cancelAction)
            self.present(alertView, animated: true, completion: nil)
        }
    
    @IBAction func navigationSettingClicked(_ sender: Any) {
        
        self.installedNavigationApps.removeAll()
        
        self.installedNavigationApps.append("Apple Map")
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)){
            
            self.installedNavigationApps.append("Google Map")
            
        }
        
        // if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.waze.com")! as URL)){
        
        if(UIApplication.shared.canOpenURL(URL(string:"waze://")!)){
            
            self.installedNavigationApps.append("Waze")
        }
        
        let alertView = UIAlertController(title: "Select Navigation".localized, message: "Please Choose Map".localized, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel".localized,
                                         style: .cancel, handler: nil)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
        
        for i in 0...self.installedNavigationApps.count-1 {
            let actionTitle = self.installedNavigationApps[i]
            let action = UIAlertAction(title: actionTitle, style: .default,handler: { (alert) in
                
                UserDefaults.standard.set(self.installedNavigationApps[i], forKey: AppConstants.UserDefaultKeys.NAVIGATIONTYPE)
                self.selectedNavigationLbl.text = self.installedNavigationApps[i]
            })
            alertView.addAction(action)
        }
    }
    
    
        
    @IBAction func autoupgradeswitchtapped(_ sender: Any) {
        
        showLoaderWithoutBackground()
        let dic1 = ["status": autostatus] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERAUTOUPGRADE
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverAutoUpgradationModel.self)
    }
    
    @IBAction func custometersupportbtn_click(_ sender: Any) {
        self.presentVC("CustomerSupportViewController")
    }
    @IBAction func reportissuebtn_click(_ sender: Any) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    @IBAction func termsconditionbtn_click(_ sender: Any) {
        self.presentVC("TermsConditionsViewController")
    }
    @IBAction func aboutusbtn_click(_ sender: Any) {
        //self.presentVC("AboutUsViewController")
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: AboutUsViewController = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        nextController.checkforabout = "1"
        self.present(nextController, animated: false, completion: nil)
    }

func configuredMailComposeViewController() -> MFMailComposeViewController {
    let mailComposerVC = MFMailComposeViewController()
    mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
    mailComposerVC.setToRecipients([(AppConstants.driverconfiguredata.data?.customerSupport?.mail!)!])
    mailComposerVC.setSubject("Report Issue Regarding TaxiDriver App".localized)
    mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!".localized, isHTML: false)
    
    return mailComposerVC
}

func showSendMailErrorAlert() {
    let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email".localized, message: "Your device could not send e-mail. Please check e-mail configuration and try again.".localized, delegate: self, cancelButtonTitle: "ok".localized)
    sendMailErrorAlert.show()
}

// MARK: MFMailComposeViewControllerDelegate Method
func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
}
}
extension SettingsViewController: ApiResponseReceiver {
   
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? DriverPoolModel{
    let data:DriverPoolModel = responseData
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
        
        showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
        
        if poolstatus == "2"{
          self.switch.setOn(false, animated: true)
          poolstatus = "1"
        }else{
          self.switch.setOn(true, animated: true)
            poolstatus = "2"
        }
        
    }
    else if data.result == "999" {
        
        UserDefaultUtility.removeAllUserDefault()
        
        self.presentVC("SplashViewController")
    }else{
        self.switch.setOn(false, animated: true)
        poolstatus = "1"
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
    }
}
        
        if let responseData = response as? DriverAutoUpgradationModel{
            let data:DriverAutoUpgradationModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
               if autostatus == "2"{
                    self.autoupgradeswitch.setOn(false, animated: true)
                    autostatus = "1"
                }else{
                    self.autoupgradeswitch.setOn(true, animated: true)
                    autostatus = "2"
                }
                
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
