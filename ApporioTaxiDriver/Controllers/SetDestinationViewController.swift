//
//  SetDestinationViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/10/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class SetDestinationViewController: BaseViewController {
    
    var homelocstatus = ""
    
    @IBOutlet weak var activateddeactivatedbtn: UIButton!
    @IBOutlet weak var setdestinationtopview: UIView!
    @IBOutlet weak var setdestinationlbl: UILabel!
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var turnondestinationlbl: UILabel!
    @IBOutlet weak var destinationaddresslbl: UILabel!
    @IBOutlet weak var locationlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setdestinationlbl.text = "Set Your Destination".localized
        turnondestinationlbl.text = "Turn on your Destination".localized
        destinationaddresslbl.text = "Destination Address".localized

        setdestinationtopview.edgeWithShadow(edge: 0)
        mainview.edgeWithShadow(edge: 0)
        
        locationlbl.text = AppConstants.selectedhomeaddress
        
        if AppConstants.homelocationactivestats == true{
            self.activateddeactivatedbtn.setTitle("ACTIVATED".localized, for: .normal)
            self.activateddeactivatedbtn.setTitleColor(UIColor.green, for: .normal)
            homelocstatus = "2"
        }else{
            self.activateddeactivatedbtn.setTitle("DEACTIVATED".localized, for: .normal)
            self.activateddeactivatedbtn.setTitleColor(UIColor.red, for: .normal)
            homelocstatus = "1"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.setdestinationlbl.text = AppConstants.selectedcellvalue
    }
   
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func destinationlocationbtn_click(_ sender: Any) {
      self.presentVC("AddNewAddressViewController")
    }
    
    @IBAction func Activateddeactivatedbtn_click(_ sender: Any) {
        
        showLoaderWithoutBackground()
        print(homelocstatus)
        let dic1 = ["status": homelocstatus] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERHOMEACTIVEDEACTIVE
        ServiceManager.sharedInstance.delegate = self        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverActiveDeactiveLocModel.self)
    }
}

extension SetDestinationViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverActiveDeactiveLocModel{
            let data:DriverActiveDeactiveLocModel = responseData
            
            //addnewdata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                if data.data == true{
                    self.activateddeactivatedbtn.setTitle("ACTIVATED".localized, for: .normal)
                    self.activateddeactivatedbtn.setTitleColor(UIColor.green, for: .normal)
                    homelocstatus = "2"
                    AppConstants.homelocationactivestats = true
                    showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                }else
                {
                    self.activateddeactivatedbtn.setTitle("DEACTIVATED".localized, for: .normal)
                    self.activateddeactivatedbtn.setTitleColor(UIColor.red, for: .normal)
                    homelocstatus = "1"
                    AppConstants.homelocationactivestats = false
                    showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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




