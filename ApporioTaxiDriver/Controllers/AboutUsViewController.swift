//
//  AboutUsViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class AboutUsViewController: BaseViewController {
    
    var checkforabout = ""
    
    @IBOutlet weak var versionnametext: UILabel!
    @IBOutlet weak var topaboutustextlbl: UILabel!
    
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        versionnametext.text = "Version Name : ".localized + AppConstants.appversion
        
        if checkforabout == "1"{
            
            topaboutustextlbl.text = "About Us".localized
        
       let dic1 = ["slug":"about_us"
                  
            
            ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCMSPAGES
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CmsPagesModels.self)
        }else if checkforabout == "2"{
            
            topaboutustextlbl.text = "Privacy Policy".localized
            
            let dic1 = ["slug": "privacy_policy"
             
                
                ] as [String : AnyObject]
            
            
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCMSPAGES
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CmsPagesModels.self)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
   
}


extension AboutUsViewController: ApiResponseReceiver{

    func onSuccess<T>(_ response: T) where T : Mappable {

        if let responseData = response as? CmsPagesModels{

            let data:CmsPagesModels = responseData



            if data.result == "1" {

                hideLoaderWithoutBackground()


                do {
                    let str = try NSAttributedString(data: (data.data?.descriptionValue)!.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
                    
                    textview.attributedText =  str
                } catch {
                    print(error)
                }




            }else if data.result == "999" {

                UserDefaultUtility.removeAllUserDefault()

                self.presentVC("SplashViewController")

            } else {


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

extension String {
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = data(using: .utf8)
            else { return nil }
        do {
            
            
            // guard let data = data(using: .utf8) else { return nil }
            
            
            
            
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
            
          
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}





