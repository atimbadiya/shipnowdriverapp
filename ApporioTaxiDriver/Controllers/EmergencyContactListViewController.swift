//
//  EmergencyContactListViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 4/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper

class EmergencyContactListViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tablecount:Int?
    var selectedid = 0
    var checkuserid = 0
    var emergencydata: EmergencyContactList!

    @IBOutlet weak var emergencycontacttoplbl: UILabel!
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var tableview: UITableView!
    //@IBOutlet weak var cellmainview: UIView!
    //@IBOutlet weak var phonenolbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablecount = 0
        
        addbtn.edgeWithShadow(edge: 4.0)
        
        emergencycontacttoplbl.text = "Emergency Contact".localized
        addbtn.setTitle("ADD".localized, for: .normal)
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.EMERGENCYCONTACTLIST
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: EmergencyContactList.self)
        
    }
    
    @IBAction func backbtn_click(_ sender: Any) {
        
        self.dismissVC()
        
    }
    
    
    @IBAction func addbtn_click(_ sender: Any) {
        
        self.presentVC("AddEmergencyContactViewController")
        
    }
    
    @objc func deleteTapped(sender : UIButton!) {
        
        selectedid = emergencydata.data![sender.tag].id!
        
        let dic1 = ["id":selectedid
            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DELETEEMERGENCYCONTACT
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: EmergencySOSDeleteModel.self)
        
    }

func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return tablecount!
    
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
{
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "emergencycontact", for: indexPath) as! EmergencyContactListTableViewCell
    
    cell.cellmainview.edgeWithShadow(edge: 4.0)
  
   cell.phonenolbl.text = emergencydata.data![indexPath.row].number
    cell.namelbl.text = emergencydata.data![indexPath.row].name
    checkuserid = emergencydata.data![indexPath.row].userId ?? 0
    
    if checkuserid == 0{
        
        cell.deletebtnview.isHidden = true
        
    }else{
        
        cell.deletebtnview.isHidden = false
        
    }
    
    cell.deletebtn.tag = indexPath.row
    print(cell.deletebtn.tag)
   cell.deletebtn.addTarget(self, action: #selector(deleteTapped(sender:)), for: .touchUpInside)
    
    
    return cell
  
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    let row = indexPath.row
    print("Row: \(row)")
    //AppConstants.bookingid = String((mydata.data?.ridesData![row].rideId)!)
    
    //self.presentVC("FullTripDetailsViewController")
    
}
}

extension EmergencyContactListViewController:ApiResponseReceiver{
    
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? EmergencyContactList{
            let data:EmergencyContactList = responseData
            
            emergencydata = data
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                tablecount = data.data?.count
                tableview.reloadData()
            
                
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else {
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
            
            if let responseData = response as? EmergencySOSDeleteModel{
                let data:EmergencySOSDeleteModel = responseData
                
                //emergencydata = data
                
                if data.result == "1" {
                    
                   // hideLoaderWithoutBackground()
                    
                    showLoaderWithoutBackground()
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.EMERGENCYCONTACTLIST
                    ServiceManager.sharedInstance.delegate = self
                    print(apiRequestUrl)
                    
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: EmergencyContactList.self)
                   
                }
                else if data.result == "999" {
                    
                    UserDefaultUtility.removeAllUserDefault()
                    
                    self.presentVC("SplashViewController")
                }else {
                    
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

