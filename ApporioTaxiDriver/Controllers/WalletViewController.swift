//
//  WalletViewController.swift
//  WalletScreens
//
//  Created by Gyanender on 13/02/19.
//  Copyright © 2019 Apporio Lap0026. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON

class WalletViewController: BaseViewController {
    
    
    
    @IBOutlet weak var addmoneyview: UIView!
    
    
    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var walletBalanceView: UIView!
  //  @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var walletBalance: UILabel!
    @IBOutlet weak var transactionsTableView: UITableView!
    @IBOutlet weak var wallettoplbl: UILabel!
    @IBOutlet weak var avilablebalancelbl: UILabel!
    
    @IBOutlet weak var addmoneybtn: UIButton!
    
    @IBOutlet weak var recenttxnlbl: UILabel!
    @IBOutlet weak var filterlbl: UILabel!
    @IBOutlet weak var filterView: UIView!
//    @IBOutlet weak var allButton: UIButton!
//    @IBOutlet weak var paidButton: UIButton!
//    @IBOutlet weak var receivedButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var innerfilterviewheight: NSLayoutConstraint!
    @IBOutlet weak var innerfilterview: UIView!
    
    var dataarray = ["All".localized,"Paid".localized,"Received".localized]
    
     var filtervalue = "3"
    
    var check = 1000
    
    var tablecount = 0
    
    @IBOutlet weak var filtertableview: UITableView!
    
    @IBOutlet weak var filtertransactiontextlbl: UILabel!
    
    //MARK:- VARIABLES
    //================
    var data1: WalletModel!
    var count: Int = 0
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filterView.isHidden = true
//        self.allButton.setTitle("ALL".localized, for: .normal)
//        self.paidButton.setTitle("PAID".localized, for: .normal)
//        self.receivedButton.setTitle("RECEIVED".localized, for: .normal)
        self.cancelButton.setTitle("CANCEL".localized, for: .normal)
        
        wallettoplbl.text = "Wallet".localized
        avilablebalancelbl.text = "Avilable Balance".localized
        recenttxnlbl.text = "Recent Transactions".localized
        filterlbl.text = "Filter".localized
        
        self.walletBalanceView.edgeWithShadow(edge: 0)
        addmoneybtn.setTitle("Add Money".localized, for: .normal)
        
        if AppConstants.driverconfiguredata.data!.addwalletmoneyenable!{
            
            addmoneyview.isHidden = false
        }else{
            
            addmoneyview.isHidden = true
        }
        
        
        //MARK:- API CALL
        //===============
        self.callApi()
        
        //TABLEVIEW DELEGATE CONFORM
        //===========================
        self.transactionsTableView.delegate = self
        self.transactionsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if  AppConstants.addmoney == 1{
            AppConstants.addmoney = 0
            self.callApi()
        }else{
            AppConstants.addmoney = 0
            
        }
    }
    
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func filterTapped(_ sender: Any)
    {
        self.filterView.isHidden = false
        
        if filtervalue == "3"{
            
            check = 0
        }else if filtervalue == "2"{
            
            check = 1
        }else{
            
            check = 2
        }
        
        
    }
    
//    @IBAction func allTApped(_ sender: Any)
//    {
//        self.callApi(filterValue: "3")
//        self.filterView.isHidden = true
//    }
//
//    @IBAction func paidTapped(_ sender: Any)
//    {
//        self.callApi(filterValue: "2")
//        self.filterView.isHidden = true
//    }
//
//    @IBAction func receivedTapped(_ sender: Any)
//    {
//        self.callApi(filterValue: "1")
//        self.filterView.isHidden = true
//    }
    
    @IBAction func cancelTapped(_ sender: Any)
    {
        self.filterView.isHidden = true
    }
    
    
    //MARK:- FUNCTIONS
    //================
    func callApi()
    {
        
        let dic = ["filter": filtervalue,
                  
            
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERWALLETTRANSACTION
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicauthorization, returningClass: WalletModel.self)
        
    }
    
    
    
    @IBAction func addmoneybtnclick(_ sender: Any) {
        self.presentVC("AddMoneytoWalletViewController")
    }
    
    
    
}

//MARK:- TABLEVIEW DELEGATES
//==========================
extension WalletViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return self.count
            
        }else{
            
            return dataarray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if tableView.tag == 1{
            
        
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableCell
        cell.setData(data: (self.data1.data?.recentTransactoin![indexPath.row])!)
        return cell
            
         }else{
            
            let cell1 = filtertableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
            
            
            let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
            
            let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
            
            firsttext.text = dataarray[indexPath.row]
            
            if(check == indexPath.row)
            {
                
                imageview.image = UIImage(named: "radio-on-button")
                
            }else{
                imageview.image = UIImage(named: "icons8-0-percent-filled-50")
                
            }
            
            
            
            return cell1
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1{
            
            
            
        }else{
            filtertableview.deselectRow(at: indexPath, animated: true)
            check = indexPath.row
            
            if indexPath.row == 0{
                
                filtervalue = "3"
                self.callApi()
                
            }
            
            if indexPath.row == 1{
                filtervalue = "2"
                self.callApi()
                
            }
            
            if indexPath.row == 2{
                filtervalue = "1"
                self.callApi()
                
            }
            
            
            filterView.isHidden = true
            filtertableview.reloadData()
            
            
            
        }
    }
    
    
    
}


extension WalletViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? WalletModel{
            let data:WalletModel = responseData
            
            data1 = data
            
            if (data1.result == "1") {
                
                hideLoaderWithoutBackground()
                //hiddenview.isHidden = false
                
                
                walletBalance.text = data1.data?.walletMoney
                self.count = (data1.data?.recentTransactoin?.count)!
                
                transactionsTableView.reloadData()
                
            }else if
                data.result == "999"{
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
        
        
        if let responseData = response as? DriverVehicleOtpModel{
            let data:DriverVehicleOtpModel = responseData
            
            
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                //hiddenview.isHidden = false
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
                self.present(nextController, animated: false, completion: nil)
                
            }else if
                data.result == "999"{
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
        
        // presenter?.onError(errorResponse)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
    
}


//MARK:- UIVIEW EXTENSION CLASS
//=============================
//extension UIView
//{
//    func edgeWithOutShadow(edge: CGFloat)
//    {
//        self.layer.borderWidth = edge
//        self.layer.cornerRadius = edge
//        self.layer.borderColor = UIColor.clear.cgColor
//    }
//
//    func edgeWithOutShadowcolor(edge: CGFloat)
//    {
//        self.layer.borderWidth = edge
//        self.layer.cornerRadius = edge
//        self.layer.borderColor = UIColor.lightGray.cgColor
//    }
//
//    func edgeWithShadow(edge: CGFloat)
//    {
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowOpacity = 0.4
//        self.layer.shadowRadius = 2
//        self.layer.cornerRadius = edge
//        self.layer.borderColor = UIColor.black.cgColor
//    }
//    func edgeWithShadow()
//    {
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowOpacity = 0.4
//        self.layer.shadowRadius = 2
//        self.layer.borderColor = UIColor.black.cgColor
//    }
//}
