//
//  NewPersonalDocumentViewController.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 04/07/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class NewPersonalDocumentViewController: BaseViewController {
    
    @IBOutlet weak var topmanagepersonaldocumenttextlbl: UILabel!
    
    @IBOutlet weak var maintableview: UITableView!
    
    var personalDocumentCount = 0
    var vehicleCount = 0
    var driverdocumentdata: DriverPersonalDocumentModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.topmanagepersonaldocumenttextlbl.text = "Manage Your Documents".localized
        
        self.maintableview.delegate = self
        self.maintableview.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.callAPI()
    }


   
    @IBAction func backbtnclick(_ sender: Any) {
        
        self.dismissVC()
    }
    
    func callAPI()
    {
        
        showLoaderWithoutBackground()
        
        let dic1 = [:] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERPERSONALDOCUMENTS
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverPersonalDocumentModel.self)
    }
    
}


extension NewPersonalDocumentViewController: UITableViewDelegate, UITableViewDataSource
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
            
            
            cell.setPersonalDocumentData(data: driverdocumentdata.data![indexPath.row])
          //  cell.setExpiredDocumentData(data: expiredData.expiredPersonalDocuments![indexPath.row])
            return cell
        case 1:
            let cell = Bundle.main.loadNibNamed("VehicleDetailCell", owner: self, options: nil)?.first as! ExpiredVehicleDetailCell
            cell.delegate = self
            
            
            
            cell.id = driverdocumentdata.vehicleDocument?[indexPath.row].id ?? 0
            cell.setPersonalVehicleData(data: driverdocumentdata.vehicleDocument![indexPath.row])
            return cell
        default:
            let cell = Bundle.main.loadNibNamed("ExpiredDocumentCell", owner: self, options: nil)?.first as! ExpiredPersonalCell
            
             cell.setPersonalDocumentData(data: driverdocumentdata.data![indexPath.row])
           // cell.setExpiredDocumentData(data: expiredData.expiredPersonalDocuments![indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.section
        {
        case 0:
            
          let documentverifcationstatus = driverdocumentdata.data![indexPath.row].documentVerificationStatus ?? 4
          
          
          if driverdocumentdata.data![indexPath.row].tempdocupload!{
            
            
            AppConstants.documentstatus = "1"
            AppConstants.selecteddocumentId = String((driverdocumentdata.data![indexPath.row].id)!)
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
            next.viewcontrollerself = self
            // next.movefrom = "documentphoto"
            next.comefrompersonal = "1"
            AppConstants.managedocumenttype = "2"
            next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(next, animated: true, completion: nil)
            
          }else{
          
          
          if (documentverifcationstatus == 0 || documentverifcationstatus == 3 || documentverifcationstatus == 4){
            
            
            AppConstants.documentstatus = "1"
            AppConstants.selecteddocumentId = String((driverdocumentdata.data![indexPath.row].id)!)
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
            next.viewcontrollerself = self
            // next.movefrom = "documentphoto"
            next.comefrompersonal = "1"
            AppConstants.managedocumenttype = "1"
            next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(next, animated: true, completion: nil)
            
          }else{
            
            
            
            }
            
            }
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
            let con = self.driverdocumentdata.vehicleDocument?[indexPath.row].vehicleDocuments?.count ?? 0
            return CGFloat(100 + (con * 100))
        default:
            return 100
        }
    }
}

//MARK:- UPLOAD DOCUMENT PROTOCOL
//==============================
extension NewPersonalDocumentViewController: UploadDocumentProtocol
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
extension NewPersonalDocumentViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? DriverPersonalDocumentModel
        {
            
            let data:DriverPersonalDocumentModel = responseData
            if (data.result == "1")
            {
                hideLoaderWithoutBackground()
                self.driverdocumentdata = data
                self.personalDocumentCount = data.data?.count ?? 0
                self.vehicleCount = data.vehicleDocument?.count ?? 0
                self.maintableview.reloadData()
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

