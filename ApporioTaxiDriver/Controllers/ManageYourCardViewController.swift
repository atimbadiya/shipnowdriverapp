//
//  ManageYourCardViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 29/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ManageYourCardViewController: BaseViewController
{
    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var cardsTableView: UITableView!
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var addNewButton: UIButton!
    
    //MARK:- VARIABLES
    //================
    var tablecount = 0
    var managecarddata: ManageCardsModel!
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardsTableView.delegate = self
        self.cardsTableView.dataSource = self
        
        self.viewTitle.text = "Manage Your Cards".localized
        self.addNewButton.setTitle("Add New".localized, for: UIControl.State.normal)
        self.callApi()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if AppConstants.tokenvalue == 0{
            
            AppConstants.tokenvalue = 0
        }else{
            AppConstants.tokenvalue = 0
            self.callApi()
        }
    }
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backBtnTapped(_ sender: Any)
    {
        self.dismissVC()
    }
    
    @IBAction func addNewBtnTapped(_ sender: Any)
    {
        self.presentVC("AddNewCardViewController")
    }
    
    
    //MARK:- FUNCTIONS
    //================
    func callApi()
    {
        let dic1 = ["payment_option":"STRIPE"
            ] as [String : AnyObject]
        showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCARDS
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ManageCardsModel.self)
    }
    
    @objc func SelectCard(_ Sender: UIButton)
    {
        let dic1 = ["card_id": managecarddata.data![Sender.tag].cardId as Any,
                    "amount": AppConstants.enteramount,
                    "currency": AppConstants.currencysymbol
            ] as [String : AnyObject]
        showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERMAKEPAYMENT
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PaymentDoneModel.self)
    }
    
    
    @objc func DeleteCard(_ Sender: UIButton)
    {
//        let dic1 = ["card_id": managecarddata.data![Sender.tag].cardId
//            ] as [String : AnyObject]
//        showLoaderWithoutBackground()
//
//        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCARDSDelete
//        ServiceManager.sharedInstance.delegate = self
//        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DeleteCardModel.self)
    }
}

//MARK:-TABLEVIEW DELEAGTE METHODS
//================================
extension ManageYourCardViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cardsTableView.dequeueReusableCell(withIdentifier: "managecell", for: indexPath) as! CardTableViewCell
        // let cardiamge: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        cell.cardnumbertext.text =  managecarddata.data![indexPath.row].cardType! +  " XXXX " + managecarddata.data![indexPath.row].cardNumber!
        cell.expdatetext.text = String((managecarddata.data![indexPath.row].expMonth!)) + "/" + String((managecarddata.data![indexPath.row].expYear!))
        
        cell.deletebtn.tag = indexPath.row
        
        cell.deletebtn.addTarget(self, action: #selector(ManageYourCardViewController.DeleteCard(_:)), for: .touchUpInside)
        
        cell.selectbtn.tag = indexPath.row
        
        cell.selectbtn.addTarget(self, action: #selector(ManageYourCardViewController.SelectCard(_:)), for: .touchUpInside)
        
        if AppConstants.enteramount == ""{
            
            cell.selectbtnview.isHidden = true
            cell.deletebtnview.isHidden = true
        }else{
            cell.selectbtnview.isHidden = false
            cell.deletebtnview.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cardsTableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK:- API RESPONSE
//===================
extension ManageYourCardViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? ManageCardsModel
        {
            let data:ManageCardsModel = responseData
            managecarddata = data
            
            if managecarddata.result == "1"
            {
                hideLoaderWithoutBackground()
                self.cardsTableView.isHidden = false
                tablecount = (managecarddata.data?.count)!
                self.cardsTableView.reloadData()
            }
            else if data.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                self.cardsTableView.isHidden = true
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: managecarddata.message!, VC: self)
            }
        }
        
        
        if let responseData = response as? DeleteCardModel{
            
            let data:DeleteCardModel = responseData
            if data.result == "1"
            {
                hideLoaderWithoutBackground()
                self.callApi()
            }
            else if data.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: managecarddata.message!, VC: self)
            }
        }
        
        if let responseData = response as? PaymentDoneModel{
            
            let data:PaymentDoneModel = responseData
            if data.result == "1"
            {
                hideLoaderWithoutBackground()
                AppConstants.cardselect = 1
                self.dismissVC()
            }
            else if data.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: managecarddata.message!, VC: self)
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
