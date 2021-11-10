//
//  ManagebankDetailsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import SkyFloatingLabelTextField
import DropDown


class ManagebankDetailsViewController: BaseViewController {
    
    @IBOutlet weak var dropdownviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var dropdowntext: UILabel!
    @IBOutlet weak var mainviewheight: NSLayoutConstraint!
    
    var accountypevalue = ""

    @IBOutlet weak var dropdownview: UIView!
    @IBOutlet weak var bankimageview: UIImageView!
    @IBOutlet weak var managebankdetailtopview: UIView!
    @IBOutlet weak var managebankdetaillbl: UILabel!
    @IBOutlet weak var bankdetailmainview: UIView!
    
    let dropDown = DropDown()
    
    var accounttypedata: AccountTypeModel!
    
    var listarray = [String]()
    @IBOutlet weak var bsbNumbertxtFld: SkyFloatingLabelTextField!
    @IBOutlet weak var bankNametxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var accountnametxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var accountnumbertxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var submitbtnview: UIView!
    @IBOutlet weak var submitbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managebankdetaillbl.text = "Manage Bank Details".localized
        
        submitbtn.setTitle("SUBMIT".localized, for: .normal)
        
        if AppConstants.driverlogindata.data?.bankName ?? "" == ""{
            
            bankNametxtfld.placeholder = "Bank Name".localized
        }else{
            
            bankNametxtfld.text = AppConstants.driverlogindata.data?.bankName
            
        }
        
        if AppConstants.driverlogindata.data?.accountHolderName ?? "" == ""{
            
            accountnametxtfld.placeholder = "Account Name".localized
        }else{
            
           accountnametxtfld.text = AppConstants.driverlogindata.data?.accountHolderName
            
        }
        
        if AppConstants.driverlogindata.data?.accountNumber ?? "" == ""{
            
           accountnumbertxtfld.placeholder = "Account Number".localized
        }else{
            
            accountnumbertxtfld.text = AppConstants.driverlogindata.data?.accountNumber
        }
        
       if AppConstants.driverlogindata.data?.bsbnumber ?? "" == ""{
        
         bsbNumbertxtFld.placeholder = "BSB Number".localized
        
       }else{
           bsbNumbertxtFld.text = AppConstants.driverlogindata.data?.bsbnumber
        
        }
        if AppConstants.driverlogindata.data?.accounttypeid ?? "" == ""{
            
            
        }else{
            
        }
        
        dropdowntext.text = "Select Account Type"
        dropdownviewheight.constant = 0
        dropdownview.isHidden = true
        bankdetailmainview.edgeWithShadow(edge: 0)
        submitbtnview.edgeWithShadow(edge: 0)
        
        bankNametxtfld.selectedTitleColor = UIColor.appTextLightColor()
        bankNametxtfld.selectedLineColor = UIColor.clear
        
        accountnametxtfld.selectedTitleColor = UIColor.appTextLightColor()
        accountnametxtfld.selectedLineColor = UIColor.clear
        
        accountnumbertxtfld.selectedTitleColor = UIColor.appTextLightColor()
        accountnumbertxtfld.selectedLineColor = UIColor.clear
        
        bankimageview.makeViewCircular()
        bankimageview.layer.borderWidth = 2
        bankimageview.layer.borderColor = UIColor.white.cgColor
        
//        showLoaderWithoutBackground()
//
//        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.AccountTypesURL
//        ServiceManager.sharedInstance.delegate = self
//        print(apiRequestUrl)
//
//        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: AccountTypeModel.self)
        
    }
    
    
    @IBAction func dropdownbtnclick(_ sender: Any) {
        
        dropDown.anchorView = dropdownview
        dropDown.topOffset = CGPoint(x:0, y: self.dropdownview.bounds.height)
        
        self.dropDown.width = 200
        self.dropDown.cellHeight = 50
        
        self.dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            
            self.accountypevalue = String((self.accounttypedata.accountTypes![index].id)!)
            
            self.dropdowntext.text = self.accounttypedata.accountTypes![index].name ?? ""
            
//            self.PhoneNumber = (AppConstants.boolingdetailsdata.data?.sos![index].number)!
//
//
//            self.selectemergencytext.text = (AppConstants.boolingdetailsdata.data?.sos![index].number)!
//
//            self.callyouremergencytext.text = (AppConstants.boolingdetailsdata.data?.sos![index].name)!
//            
//            print(self.PhoneNumber)
//
            
            self.dropDown.hide()
        }
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    @IBAction func submitbtn_click(_ sender: Any) {
        
//        if self.accountypevalue == ""{
//        showErrorAlert("", alertMessage: "Select account types".localized, VC: self)
//        }else
        if bankNametxtfld.text == ""{
            //showErrorAlert("Alert", alertMessage: <#T##String#>, VC: <#T##AnyObject?#>)
            showErrorAlert("", alertMessage: "Enter bank name first".localized, VC: self)
        }else if accountnametxtfld.text == ""{
            showErrorAlert("", alertMessage: "Enter account name first".localized, VC: self)
        }else if bsbNumbertxtFld.text == ""{
            showErrorAlert("", alertMessage: "Enter BSB number first".localized, VC: self)
        }else if (bsbNumbertxtFld.text?.count)! > 6{
            showErrorAlert("", alertMessage: "BSB number invalid...6 digits only".localized, VC: self)
        }else if accountnumbertxtfld.text == ""{
             showErrorAlert("", alertMessage: "Enter account number first".localized, VC: self)
        }else if accountnumbertxtfld.text!.count > 8{
            showErrorAlert("", alertMessage: "Account number invalid...8 digits only".localized, VC: self)
        }
        else{
            showLoaderWithoutBackground()
            
            let dic1 = ["account_number": self.accountnumbertxtfld.text!,
                        "account_holder_name": self.accountnametxtfld.text!,
                        "bank_name": self.bankNametxtfld.text!,
                        "bsb_number": self.bsbNumbertxtFld.text!
                       ] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERBANKDETAILS
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverBankDetailModel.self)
        }
    }
}

extension ManagebankDetailsViewController: ApiResponseReceiver {
 
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? AccountTypeModel{
            let data:AccountTypeModel = responseData
            accounttypedata = data
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                listarray.removeAll()
                if data.accountTypes!.count == 0{
                    
                }else{
                    
                    for items in  (data.accountTypes)!
                    {
                        listarray.append(items.name!)
                        dropDown.dataSource = listarray
                    }
                }
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }else{
                
                listarray.removeAll()
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }

        if let responseData = response as? DriverBankDetailModel{
            let data:DriverBankDetailModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                AppConstants.driverlogindata.data?.bsbnumber = data.data?.bsbnumber! ?? ""
                AppConstants.driverlogindata.data?.accountNumber = data.data?.accountNumber! ?? ""
                AppConstants.driverlogindata.data?.accountHolderName = data.data?.accountHolderName! ?? ""
                AppConstants.driverlogindata.data?.bankName = data.data?.bankName! ?? ""
                
                
        //        self.showErrorAlert("Alert", alertMessage: data.message!, VC: self)
        //
                self.dismissVC()
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



