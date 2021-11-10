//
//  VehicleListViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 20/02/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class VehicleListViewController: BaseViewController {
    
    @IBOutlet weak var topaddmorevehicleview: UIView!
    
    
    @IBOutlet weak var vehicleidtext: UILabel!
    
    
    @IBOutlet weak var topaddmorevehicleviewheight: NSLayoutConstraint!
    
    
    var drivervehicleid:Int?
    var manualselectindexvalue = 0
    
    var selectcheckvalue = 0
    
    
    @IBOutlet weak var othervehicletextviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var activevehicletextviewheight: NSLayoutConstraint!
    @IBOutlet weak var activevehicletextview: UIView!
    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var activeVehicleView: UIView!
    
    @IBOutlet weak var activevehicleviewheight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var other_Vehicle_Header_View: UIView!
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var vehicleType: UILabel!
    @IBOutlet weak var vehicel_Name_Model: UILabel!
    @IBOutlet weak var driverService: UILabel!
    @IBOutlet weak var vehicelNumber: UILabel!
    @IBOutlet weak var vehicleStatus: UILabel!
    @IBOutlet weak var vehicleListTableView: UITableView!
    @IBOutlet weak var managevehicletoplbl: UILabel!
    @IBOutlet weak var addnewbtn: UIButton!
    @IBOutlet weak var addmorevehicle: UILabel!
    @IBOutlet weak var activatedvehiclelbl: UILabel!
    @IBOutlet weak var serviceslbl: UILabel!
    @IBOutlet weak var yourothervehiclelbl: UILabel!
    
    //MARK:- VARIABLES
    //================
    var vehicleData: VehicleListModel!
    var tableCount = 0
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if AppConstants.comefromonlinecartap == "onlineoffline"{
            
            topaddmorevehicleview.isHidden = true
            topaddmorevehicleviewheight.constant = 0.0
            
            activevehicletextviewheight.constant = 0.0
            activevehicletextview.isHidden = true
            
            activevehicleviewheight.constant = 0.0
            activeVehicleView.isHidden = true
            
            othervehicletextviewheight.constant = 0.0
            other_Vehicle_Header_View.isHidden = true
            
            
        }else{
        
            
            
            activevehicletextviewheight.constant = 45.0
             activevehicletextview.isHidden = false
            
            activevehicleviewheight.constant = 80.0
            activeVehicleView.isHidden = false
            
            
            othervehicletextviewheight.constant = 45.0
            other_Vehicle_Header_View.isHidden = false
            
            
            
        if (AppConstants.driverconfiguredata.data?.generalConfig?.addmutiplevehicle)!{
           
            topaddmorevehicleview.isHidden = false
            topaddmorevehicleviewheight.constant = 45.0
            
        }else{
            
            topaddmorevehicleview.isHidden = true
            topaddmorevehicleviewheight.constant = 0.0

           
        }
            
        }
        
       managevehicletoplbl.text = "Manage Vehicles".localized
        addmorevehicle.text = "Add More Vehicle".localized
        activatedvehiclelbl.text = "Activated Vehicle".localized
        serviceslbl.text = "Services".localized
        yourothervehiclelbl.text = "Your Other Vehicle".localized
        addnewbtn.setTitle("+ Add New".localized, for: .normal)
        
        
        
        self.other_Vehicle_Header_View.isHidden = true
        self.vehicleListTableView.delegate = self
        self.vehicleListTableView.dataSource = self
            
            
        
//        self.callAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppConstants.documentscreenapi = "2"
        self.callAPI()
    }
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backButton(_ sender: Any)
    {
        AppConstants.checkfromvehicleactivate = 1
        self.dismissVC()
    }
    
    @IBAction func addNewVehicleTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: VehicleInformationViewController = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
        nextController.movedFrom = movedFromDocVer.vehicleListingScreen.rawValue
        self.present(nextController, animated: false, completion: nil)
       // self.presentVC("VehicleInformationViewController")
    }
    
    
    //MARK:- FUNCTIONS
    //================
    func callAPI()
    {
        let dic1 = [:] as [String:AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.VEHICLELIST
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: VehicleListModel.self)
    }
}

//MARK:- TABLEVIEW DELEGATES AND DATASOURCE
//=========================================
extension VehicleListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.tableCount == 1 || self.tableCount == 0
        {
            if AppConstants.comefromonlinecartap == "onlineoffline"{
                return self.tableCount
            }else{
            self.other_Vehicle_Header_View.isHidden = true
            return 0
                
            }
        }
        else
        {
            
            if AppConstants.comefromonlinecartap == "onlineoffline"{
                return self.tableCount
            }else{
            
            
            self.other_Vehicle_Header_View.isHidden = false
            return self.tableCount - 1
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = vehicleListTableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath) as! VehicleListTableCell
        
        if AppConstants.comefromonlinecartap == "onlineoffline"{
            if let getData = self.vehicleData.data?[indexPath.row]
            {
                cell.setData(data: getData, CheckValue: selectcheckvalue)
            }
        }else{
        
        
        if let getData = self.vehicleData.data?[indexPath.row + 1]
        {
            cell.setData(data: getData, CheckValue: 3000)
        }
            
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        manualselectindexvalue = indexPath.row
        
        
        if AppConstants.comefromonlinecartap == "onlineoffline"{
            
            
            drivervehicleid = vehicleData.data![indexPath.row].id
            
            let statusvalue = String((vehicleData.data![indexPath.row].vehicleVerificationStatus ?? 0)!)
            
            if statusvalue == "3" {
                
                 UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                
                self.showErrorAlert("Vehicle Information".localized, alertMessage: "Document Rejected, Please Contact to admin".localized, VC: self)
            } else if statusvalue == "2" || statusvalue ==  "4" {
                AppConstants.drivervehicleid = String((drivervehicleid)!)
                
                 UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                UserDefaultUtility.saveStringWithKey(String((drivervehicleid ?? 0)!), key: AppConstants.UserDefaultKeys.VEHICLE_ID)
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
                nextController.moveDfrom = movedFromDocVer.vehicleListingScreen.rawValue
                self.present(nextController, animated: false, completion: nil)
            } else {
                let readyForLive  = vehicleData.data![indexPath.row].readyForLive
                
                if readyForLive == 1 {
                    
                    AppConstants.selectvehicleid = String(drivervehicleid!)
                    
                    UserDefaultUtility.saveStringWithKey(String((drivervehicleid ?? 0)!), key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                    
                    
                    AppConstants.comefromonlinecartapvalue = 1
                    self.dismissVC()
                    
                } else if readyForLive == 2 {
                    
                    
                    UserDefaultUtility.saveStringWithKey("0", key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
                    
                    self.showErrorAlert("Activate".localized + " " + (self.vehicleData.data![indexPath.row].vehicleNumber ?? ""), alertMessage: "Already live by another driver".localized, VC: self)
                }
            }
            
            
            
            
        }else{
        
        drivervehicleid = vehicleData.data![indexPath.row + 1].id
        
        let statusvalue = String((vehicleData.data![indexPath.row+1].vehicleVerificationStatus ?? 0)!)
        
        if statusvalue == "3" {
            self.showErrorAlert("Vehicle Information".localized, alertMessage: "Document Rejected, Please Contact to admin".localized, VC: self)
        } else if statusvalue == "2" || statusvalue ==  "4" {
            AppConstants.drivervehicleid = String((drivervehicleid)!)
            
            
            UserDefaultUtility.saveStringWithKey(String((drivervehicleid ?? 0)!), key: AppConstants.UserDefaultKeys.VEHICLE_ID)
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
            nextController.moveDfrom = movedFromDocVer.vehicleListingScreen.rawValue
            self.present(nextController, animated: false, completion: nil)
        } else {
//           let readyForLive  = vehicleData.data![indexPath.row + 1].readyForLive
//
//            if readyForLive == 1 {
//                let alertController = UIAlertController(title: "", message:"Are you sure you want to activate the vehicle?".localized, preferredStyle: .alert)
//                let OKAction = UIAlertAction(title: "OK".localized, style: .default) { (action) in
//
//
//                    UserDefaultUtility.saveStringWithKey(String((self.drivervehicleid ?? 0)!), key: AppConstants.UserDefaultKeys.LIVE_VEHICLE_ID)
//
//
//                    let dic1 = ["driver_vehicle": self.drivervehicleid] as [String:AnyObject]
//
//                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERACTIVATEVEHICLE
//                    ServiceManager.sharedInstance.delegate = self
//                    print(apiRequestUrl)
//
//                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverActivateVehicleModel.self)
//                }
//
//                let cancelButton = UIAlertAction(title: "CANCEL".localized, style: .cancel) { (action) in
//                }
//                alertController.addAction(OKAction)
//                alertController.addAction(cancelButton)
//                self.present(alertController, animated: true, completion: nil)
//            } else if readyForLive == 2 {
//                self.showErrorAlert("Activate".localized + " " + (self.vehicleData.data![indexPath.row + 1].vehicleNumber ?? ""), alertMessage: "Already live by another driver".localized, VC: self)
//            }
        }
        
        
        
        
        
        
        }
        
        
        
        
        
        
//        if statusvalue == "1"{
//
//
//        let dic1 = ["driver_vehicle": drivervehicleid] as [String:AnyObject]
//
//        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERACTIVATEVEHICLE
//        ServiceManager.sharedInstance.delegate = self
//        print(apiRequestUrl)
//
//        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverActivateVehicleModel.self)
//
//
//        }else{
//            AppConstants.drivervehicleid = String((drivervehicleid)!)
//            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
//            nextController.moveDfrom = movedFromDocVer.vehicleListingScreen.rawValue
//            self.present(nextController, animated: false, completion: nil)
//
//        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

//MARK:- API RESPONSE
//===================
extension VehicleListViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? VehicleListModel
        {
            let data:VehicleListModel = responseData
            self.vehicleData = data
            self.tableCount = vehicleData.data?.count ?? 0
            self.vehicleListTableView.reloadData()
            self.vehicleType.text = data.data?[0].vehicleType ?? "Not Found"
            
            self.vehicleidtext.text = "Vehicle Id :".localized + (data.data?[0].shareCode ?? "")
            
            self.vehicel_Name_Model.text = "\(data.data?[0].vehicleMake ?? "Not Found") | \(data.data?[0].vehicleModel ?? "Not Found")"
            self.driverService.text = data.data?[0].serviceTypes ?? "Not Found"
            self.vehicleStatus.text = data.data?[0].showMsg ?? "No Message"
            self.vehicelNumber.text = data.data?[0].vehicleNumber
            //SET VEHICLE IMAGE
            //================
            let newString = data.data?[0].vehicleTypeImage
            AppConstants.downloadimage(imagename: newString!, imageview: self.vehicleImage, placeholderimage: "mandy")
            
        }else{
//            hideLoaderWithoutBackground()
//            showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
        }
    
    
    if let responseData = response as? DriverActivateVehicleModel{
        let data:DriverActivateVehicleModel = responseData
        
        if (data.result == "1") {
            
            hideLoaderWithoutBackground()
            self.callAPI()
            
        }
        else if data.result == "999" {
            
            UserDefaultUtility.removeAllUserDefault()
            
            self.presentVC("SplashViewController")
        }else{
            hideLoaderWithoutBackground()
            // showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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
