//
//  AddEmergencyContactViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 4/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper

class AddEmergencyContactViewController: BaseViewController {
    
    var check1 = 0
    var selectCountryCode = AppConstants.driverconfiguredata.data?.countries![0].phonecode

    @IBOutlet weak var nametxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var verifyinnerviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var verifyinnerview: UIView!
    @IBOutlet weak var addcontacttoplbl: UILabel!
    @IBOutlet weak var countrycodelbl: UILabel!
    @IBOutlet weak var enterphonetxtphone: SkyFloatingLabelTextField!
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var selectcountrylbl: UILabel!
    //@IBOutlet weak var okbtn_click: UIButton!
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var okbtn: UIButton!
   // @IBOutlet weak var mainview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nametxtfld.selectedLineColor = UIColor.darkGray
        nametxtfld.selectedTitleColor = UIColor.appThemeColor()
        
        enterphonetxtphone.selectedTitleColor = UIColor.appThemeColor()
        
        hiddenview.isHidden = true
        
        selectcountrylbl.text = "Select Country".localized
        cancelbtn.setTitle("Cancel".localized, for: .normal)
        okbtn.setTitle("Ok".localized, for: .normal)
        addcontacttoplbl.text = "Add Contact".localized
        enterphonetxtphone.placeholder = "Enter Phone".localized
        addbtn.setTitle("ADD".localized, for: .normal)
        nametxtfld.placeholder = "Enter Name".localized
        
        countrycodelbl.text = selectCountryCode

        // Do any additional setup after loading the view.
    }
    @IBAction func backbtn_click(_ sender: Any) {
        
        self.dismissVC()
        
    }
    @IBAction func countrycodebtn_click(_ sender: Any) {
        
      hiddenview.isHidden = false
        
    }
    @IBAction func okbtn_click(_ sender: Any) {
        
        hiddenview.isHidden = true
        
    }
    @IBAction func cancelbtn_click(_ sender: Any) {
        
        hiddenview.isHidden = true
        
    }
    @IBAction func addbtn_click(_ sender: Any) {
        
        showLoaderWithoutBackground()
        
        let dic1 = ["name": nametxtfld.text!,
                    "number": enterphonetxtphone.text!
            ] as [String: AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ADDEMERGENCYCONTACT
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: EmergencySosAddModel.self)
        
    }
    
}

extension AddEmergencyContactViewController:ApiResponseReceiver{
 
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? EmergencySosAddModel{
    let data:EmergencySosAddModel = responseData
    
    //emergencydata = data
    
    if data.result == "1" {
        
        hideLoaderWithoutBackground()
        
        //showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
        self.dismissVC()
        
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
extension AddEmergencyContactViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print(AppConstants.driverconfiguredata.data?.countries?.count)
//        if tableView == selectservicetableview{
//            return (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].countryArea?.count)!
//        } else {
            return (AppConstants.driverconfiguredata.data?.countries?.count)!
        }
//}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableview.dequeueReusableCell(withIdentifier: "hiddencells", for: indexPath) as! VerifyEmergencyTableViewCell
            cell.countrycodelbl.text = (AppConstants.driverconfiguredata.data?.countries![indexPath.row].phonecode)! + " " + (AppConstants.driverconfiguredata.data?.countries![indexPath.row].name)!
            //cell.countryimage
            
            let tableheight = tableview.contentSize.height
            
            if tableheight < AppConstants.screenframeheight - 200.0{
                
                verifyinnerviewheight.constant = tableheight + 100.0
                
            }else{
                
                verifyinnerviewheight.constant = AppConstants.screenframeheight - 200.0
            }
            
            if(check1 == indexPath.row)
            {
                
                cell.countryimage.image = UIImage(named: "radio-on-button")
                
            }else{
                cell.countryimage.image = UIImage(named: "icons8-0-percent-filled-50")
                
            }
            
            
            return cell
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            tableview.deselectRow(at: indexPath, animated: true)
            check1 = indexPath.row
            AppConstants.selectindexvalue4 = indexPath.row
            print(AppConstants.selectindexvalue4)
            tableview.reloadData()
            hiddenview.isHidden = true
            
            selectCountryCode = (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].phonecode)!
            //UserDefaultUtility.saveStringWithKey(selectCountryCode, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
            //        AppConstants.countryId = Int(selectCountryCode)!
            print(selectCountryCode)
            countrycodelbl.text = selectCountryCode
        }
        
    }
    



