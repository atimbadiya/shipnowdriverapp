//
//  AddMoneytoWalletViewController.swift
//  WalletScreens
//
//  Created by Gyanender on 13/02/19.
//  Copyright © 2019 Apporio Lap0026. All rights reserved.
//

import UIKit
import ObjectMapper

class AddMoneytoWalletViewController: BaseViewController {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var enterAmountTextField: UITextField!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var addMoneyButton: UIButton!
    @IBOutlet weak var paymentMethodHiddenView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var paymentMethodTableView: UITableView!
    @IBOutlet weak var addmoneytoplbl: UILabel!
    @IBOutlet weak var addmoneytowalletlbl: UILabel!
    @IBOutlet weak var itsquicklbl: UILabel!
    @IBOutlet weak var hiddenselectpaymentmethodlbl: UILabel!
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    var count: Int = 0
    
     var enteramountvalue = ""
    
    var amountValues : [DriverAppConfigureDriverWalletPackage]!
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        
        
        self.firstButton.layer.borderWidth = 1.0
        self.firstButton.layer.cornerRadius = 4
        
        self.secondButton.layer.borderWidth = 1.0
        self.secondButton.layer.cornerRadius = 4
        self.thirdButton.layer.borderWidth = 1.0
        self.thirdButton.layer.cornerRadius = 4

        self.paymentMethodHiddenView.isHidden = true
        //TABLEVIEW CONFORM
        self.paymentMethodTableView.delegate = self
        self.paymentMethodTableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        if AppConstants.cardselect == 1{
            AppConstants.cardselect = 0
            
          
            let dic1 = ["amount": AppConstants.enteramount,
                        "payment_method": "2",
                        "receipt_number": "Application",
                        "description": "sending as per demo card only"
                
                
                ] as [String : AnyObject]
            
            
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.WalletAddmoney
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PaymentDoneModel.self)
            
        }else{
            AppConstants.cardselect = 0
            
            
        }
    }
    
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backButtonClicked(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addMoneyButtonClicked(_ sender: Any)
    {
        
        enteramountvalue = enterAmountTextField.text!
        
        AppConstants.enteramount = enterAmountTextField.text!
        
        if enteramountvalue == "" {
            
            self.showErrorAlert("", alertMessage: "Please enter Amount First".localized, VC: self)
            
        }else{
            
            self.presentVC("ManageYourCardViewController")
            //   hiddenview.isHidden = false
            //             hiddentableview.reloadData()
        }
        
        
       // self.paymentMethodHiddenView.isHidden = false
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any)
    {
        self.paymentMethodHiddenView.isHidden = true
    }
    
    @IBAction func firstbtn_click(_ sender: Any) {
        if amountValues != nil  {
            enterAmountTextField.text =  (amountValues[0].amount ?? "100")
        }
    }
    
    @IBAction func secondbtn_click(_ sender: Any) {
        if amountValues != nil {
            enterAmountTextField.text = AppConstants.currencysymbol + " " + (amountValues[1].amount ?? "200")
        }
    }
    
    @IBAction func thirdbtn_click(_ sender: Any) {
        if amountValues != nil {
            enterAmountTextField.text = AppConstants.currencysymbol  + " " + (amountValues[2].amount ?? "300")
        }
    }
    
    //MARK:- Functions
    //================
    func setTitle() {
        addMoneyButton.setTitle("Add Money".localized, for: .normal)
        cancelButton.setTitle("CANCEL".localized, for: .normal)
        addmoneytoplbl.text = "Add Money To Wallet".localized
        addmoneytowalletlbl.text = "Add Money To Wallet".localized
        itsquicklbl.text = "It's quick safe & secure".localized
        hiddenselectpaymentmethodlbl.text = "Select Payment Method".localized
        //Setting Button Amount Data
        if let configData = AppConstants.driverconfiguredata.data {
            if let generalData = configData.generalConfig {
                amountValues = generalData.driverWalletPackage
            }
        }
        if amountValues != nil {
            if amountValues.count == 2{
              thirdButton.isHidden = true
                secondButton.setTitle(AppConstants.currencysymbol + (amountValues[1].amount ?? "200"), for: .normal)
                firstButton.setTitle(AppConstants.currencysymbol + (amountValues[0].amount ?? "100"), for: .normal)
            } else if amountValues.count == 3{
               firstButton.setTitle(AppConstants.currencysymbol + (amountValues[0].amount ?? "100"), for: .normal)
               secondButton.setTitle(AppConstants.currencysymbol + (amountValues[1].amount ?? "200"), for: .normal)
                thirdButton.setTitle(AppConstants.currencysymbol + (amountValues[1].amount ?? "300"), for: .normal)
            }
        } else {
            firstButton.isHidden = true
            secondButton.isHidden = true
            thirdButton.isHidden = true
        }
    }
}

//MARK:- TABLEVIEW DATASOURCE AND DELEGATES
//=========================================
extension AddMoneytoWalletViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentMethodTableView.dequeueReusableCell(withIdentifier: "paymentMethodCell", for: indexPath) as! PaymentMethodCell
        return cell
    }
    
    
}

extension AddMoneytoWalletViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? PaymentDoneModel{
            
            let data:PaymentDoneModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                //  self.callApi()
                
                
                
                AppConstants.enteramount = ""
                AppConstants.addmoney = 1
                self.dismissVC()
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                
                
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
