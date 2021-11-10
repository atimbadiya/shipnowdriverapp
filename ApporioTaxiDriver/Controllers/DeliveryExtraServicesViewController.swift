//
//  DeliveryExtraServicesViewController.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 12/10/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class DeliveryExtraServicesViewController: BaseViewController {

    @IBOutlet weak var imgLocation1: UIImageView!
    @IBOutlet weak var imgLocation2: UIImageView!
    @IBOutlet weak var imgAssemble1: UIImageView!
    @IBOutlet weak var imgAssemble2: UIImageView!
    @IBOutlet weak var txtDeliveryFloorNo: UITextField!
    
    //if ground floor is selected, selectedFloorValue will be 0 otherwise 1 for uppar floor.
    var selectedFloorValue = 0
    //if any assemble value is selected, selectedAssembleValue will be 1 otherwise 0.
    var selectedAssembleValue = 0
    var selectedAssembleValueText = ""

    let imageForUnselectedFloor = "icons8-0-percent-filled-50"
    let imageForSelectedFloor = "radio-on-button"
    let imageForUnselectedAssemble = "icons8-unchecked-checkbox-48"
    let imageForSelectedAssemble = "icons8-checked-checkbox-48"
    
    var isAssemble1selected = false
    var isAssemble2selected = false
    
    @IBOutlet weak var lblFloorToptitle: UILabel!
    @IBOutlet weak var lblGroundFloor: UILabel!
    @IBOutlet weak var lblUpparFloor: UILabel!
    @IBOutlet weak var lblEnterFloor: UILabel!
    @IBOutlet weak var lblAssembleTitle: UILabel!
    @IBOutlet weak var lblAssembleFitting: UILabel!
    
    @IBOutlet weak var lblPageTitle: UILabel!
    @IBOutlet weak var lblAssembleInstall: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblFloorToptitle.text = "Where was delivery dropped:".localized
        lblGroundFloor.text = "At Ground Floor".localized
        lblUpparFloor.text = "At Upper Floor".localized
        lblEnterFloor.text = "If delivered above ground floor, Enter floor number:".localized
        lblAssembleTitle.text = "Assemble service:".localized
        lblAssembleFitting.text = "Fitting product".localized
        lblAssembleInstall.text = "Installation of Product".localized
        lblPageTitle.text = "Additional Services".localized
        
        imgLocation1.image = UIImage(named: imageForSelectedFloor)
        imgLocation2.image = UIImage(named: imageForUnselectedFloor)
        imgAssemble1.image = UIImage(named: imageForUnselectedAssemble)
        imgAssemble2.image = UIImage(named: imageForUnselectedAssemble)
    }
  
    @IBAction func btnGroundFloorClicked(_ sender: Any) {
        
        selectedFloorValue = 0
        imgLocation1.image = UIImage(named: imageForSelectedFloor)
        imgLocation2.image = UIImage(named: imageForUnselectedFloor)
    }
    
    @IBAction func btnUpparFloorClicked(_ sender: Any) {
        selectedFloorValue = 1
        imgLocation1.image = UIImage(named: imageForUnselectedFloor)
        imgLocation2.image = UIImage(named: imageForSelectedFloor)
    }
    
    @IBAction func btnAssembleFittingClicked(_ sender: Any) {
        imgAssemble2.image = UIImage(named: imageForUnselectedAssemble)
        isAssemble2selected = false
        if isAssemble1selected == true
        {
            imgAssemble1.image = UIImage(named: imageForUnselectedAssemble)
            isAssemble1selected = false
            selectedAssembleValue = 0
            selectedAssembleValueText = ""
        }else{
            imgAssemble1.image = UIImage(named: imageForSelectedAssemble)
            isAssemble1selected = true
            selectedAssembleValue = 1
            selectedAssembleValueText = "Fitting product"
        }
    }
    
    @IBAction func btnAssembleInstallationClicked(_ sender: Any) {
        imgAssemble1.image = UIImage(named: imageForUnselectedAssemble)
        isAssemble1selected = false
        if isAssemble2selected == true
        {
            imgAssemble2.image = UIImage(named: imageForUnselectedAssemble)
            isAssemble2selected = false
            selectedAssembleValue = 0
            selectedAssembleValueText = ""
        }else{
            imgAssemble2.image = UIImage(named: imageForSelectedAssemble)
            isAssemble2selected = true
            selectedAssembleValue = 1
            selectedAssembleValueText = "Installation of Product"
        }
    }
    
//    @IBAction func backBtnClicked(_ sender: Any) {
//        dismissVC()
//    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        showLoaderWithoutBackground()
  
        let dic1 = ["booking_id": AppConstants.bookingid, "delivery_floor":selectedFloorValue, "delivery_floor_description":txtDeliveryFloorNo.text!, "assemble_service":selectedAssembleValue, "assemble_service_type":selectedAssembleValueText] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ADDITIONALSERVICES
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ScanCustomerQRcodeModel.self)
    }
}

extension DeliveryExtraServicesViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable {
        hideLoaderWithoutBackground()

        if let responseData = response as? ScanCustomerQRcodeModel{

            let data:ScanCustomerQRcodeModel = responseData
            if data.result == "1"{
                presentVC("RideFareViewController")
            }else
            {
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
