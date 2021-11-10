//
//  ExpiredDocumentsViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 16/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ExpiredDocumentsViewController: BaseViewController {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var expiredViewTitle: UILabel!

    //MARK:- IBOUTLETS
    //================
    var personalDocumentCount = 0
    var vehicleCount = 0
    var expiredData: ExpiredDocumentsModel!
    
   //  var expiredData: DriverPersonalDocumentModel!
    
    //MARK:- VIEW LIFE CYCLE
    //======================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.callAPI()
    }

    //MARK:- IBACTIONS
    //================
    @IBAction func backButtonTapped(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- FUNCTIONS
    //================
    func callAPI()
    {
        
        
      
        
        
        let dic1 = [:] as [String : AnyObject]
        showLoaderWithoutBackground()
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEREXPIREDDOCUMENTS
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ExpiredDocumentsModel.self)
    }
    
}

//MARK:- TABLEVIEW DELEGATES AND DATASOURCE
//=========================================
extension ExpiredDocumentsViewController: UITableViewDelegate, UITableViewDataSource
{
    //MARK:- SECTION SETUP
    //====================
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.personalDocumentCount == 0 || self.vehicleCount == 0
        {
            return 0
        }
        else
        {
            return 50
        }
    }
    
    //MARK:- TABLEVIEW SETUP
    //======================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section
        {
        case 0:
            return self.personalDocumentCount
        case 1:
            return self.vehicleCount
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "Personal Documents".localized
        }
        else
        {
             return "Vehicle Documents".localized
        }
    }
    
    //DELEGATES AND DATA SOURCE
    //=========================
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section
        {
            case 0:
                let cell = Bundle.main.loadNibNamed("ExpiredDocumentCell", owner: self, options: nil)?.first as! ExpiredPersonalCell
               cell.setExpiredDocumentData(data: expiredData.expiredPersonalDocuments![indexPath.row])
                return cell
            case 1:
                let cell = Bundle.main.loadNibNamed("VehicleDetailCell", owner: self, options: nil)?.first as! ExpiredVehicleDetailCell
                cell.delegate = self
                cell.id = expiredData.expiredVehicleDocuments?[indexPath.row].id ?? 0
                cell.setExpiredVehicleData(data: expiredData.expiredVehicleDocuments![indexPath.row])
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("ExpiredDocumentCell", owner: self, options: nil)?.first as! ExpiredPersonalCell
                cell.setExpiredDocumentData(data: expiredData.expiredPersonalDocuments![indexPath.row])
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.section
        {
            case 0:
                AppConstants.documentstatus = "1"
                AppConstants.selecteddocumentId = String((expiredData.expiredPersonalDocuments![indexPath.row].documentId)!)
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
                next.viewcontrollerself = self
                // next.movefrom = "documentphoto"
                next.comefrompersonal = "1"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
            case 1:
                print("Do Nothing")
            default:
                print("Do Nothing")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.section
        {
             case 0:
                return 100
            case 1:
                let con = self.expiredData.expiredVehicleDocuments?[indexPath.row].driverVehicleDocument?.count ?? 0
                return CGFloat(100 + (con * 100))
            default:
                return 100
        }
    }
}

//MARK:- UPLOAD DOCUMENT PROTOCOL
//==============================
extension ExpiredDocumentsViewController: UploadDocumentProtocol
{
    func loadUploadCpntroller()
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
        next.viewcontrollerself = self
        // next.movefrom = "documentphoto"
        next.comefrompersonal = "2"
        next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(next, animated: true, completion: nil)
    }
    
    
}

//MARK:- API RESPONSE
//===================
extension ExpiredDocumentsViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? ExpiredDocumentsModel
        {
            
            let data:ExpiredDocumentsModel = responseData
            if (data.result == "1")
            {
                hideLoaderWithoutBackground()
                self.expiredData = data
                self.personalDocumentCount = data.expiredPersonalDocuments?.count ?? 0
                self.vehicleCount = data.expiredVehicleDocuments?.count ?? 0
                self.mainTableView.reloadData()
            }
            else if data.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.expiryMessage!, VC: self)
            }
        }
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?)
    {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)

    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }

}
