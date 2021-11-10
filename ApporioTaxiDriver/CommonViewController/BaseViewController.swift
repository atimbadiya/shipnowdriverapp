//
//  BaseViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SVProgressHUD
import ObjectMapper

class BaseViewController: UIViewController {

    let bgView = UIView()
    
     var toastLabel : UILabel!
    
    var alertController15 = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height/2, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.white
        toastLabel.textColor = UIColor.black
        toastLabel.textAlignment = NSTextAlignment.center;
        

        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.internetRechableNotification), name: NSNotification.Name(rawValue: AppConstants.NSNotificationNames.INTERNET_RECHABLE_NOTIFICATION), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.internetUnreachableNotification), name: NSNotification.Name(rawValue: AppConstants.NSNotificationNames.INTERNET_UNREACHABLE_NOTIFICATION), object: nil)
        
        
        bgView.frame =  CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        bgView.backgroundColor = UIColor.white
        bgView.alpha = 1.0
        
        
        if ReachabilityManager.shared.isNetworkAvailable{
            
            
        }
        else{
            
            internetUnreachableNotification()
        }
        
    }
    
    @objc func internetUnreachableNotification(){
        
        debugPrint("internet is not connected")
        
        
        alertController15 = UIAlertController( title: AppConstants.ErrorMessages.ALERT_TITLE,
                                                 message: AppConstants.ErrorMessages.PLEASE_CHECK_YOUR_INTERNET_CONNECTION, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: NSLocalizedString("Open Settings", comment: ""), style: .default) { (action) in
            
            
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl)  {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    })
                }
                else  {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }
        }
        alertController15.addAction(OKAction)
        present(alertController15, animated: true, completion: nil)
    }
    
    @objc func internetRechableNotification() {
        alertController15.dismiss(animated: true, completion: nil)
        debugPrint("internet is connected")
        
    }
    
    
    
    // MARK: - Loader type
    
    func showLoader(_ VC : AnyObject?){
        
        VC?.addSubview(bgView)
        DispatchQueue.main.async(execute: {
            SVProgressHUD.show()
            SVProgressHUD.setRingThickness(5.0)
        })
        
    }
    
    func showLoaderWithStatus(status: String)
    {
        SVProgressHUD.show()
        SVProgressHUD.setStatus(status)
        SVProgressHUD.setBackgroundColor(UIColor.white)
    }
    
    func hideLoader(){
        self.bgView.removeFromSuperview()
        SVProgressHUD.dismiss()
    }
    
    func showLoaderWithoutBackground(){
        SVProgressHUD.show()
        SVProgressHUD.setRingThickness(5.0)
        SVProgressHUD.setDefaultMaskType(.clear)
    }
    
    
    func hideLoaderWithoutBackground(){
        SVProgressHUD.dismiss()
    }
    
    func hideLoaderWithStatus(status: String) {
        SVProgressHUD.setStatus("")
    }
    
    
    // MARK: - Helper Methods
    
    func showErrorAlert(_ alertTitle: String, alertMessage: String,VC : AnyObject?){
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Ok".localized, style: .default) { (action) in
                
            }
            alertController.addAction(OKAction)
            VC!.present(alertController, animated: true, completion: nil)
            
        })
        
        
    }
    
}



