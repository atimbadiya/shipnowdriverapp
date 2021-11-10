//
//  SubscriptionDetailsViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 26/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class SubscriptionDetailsViewController: BaseViewController
{
    
    //MARK:- IBOUTLETS
    //================
    
    
    @IBOutlet weak var buynowbtntext: UIButton!
    @IBOutlet weak var paymentoptioninnerviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var paymentoptioninnerview: UIView!
    
    
    @IBOutlet weak var subscriptionPackImage: UIImageView!
    @IBOutlet weak var subscriptionPackName: UILabel!
    @IBOutlet weak var currentlyActivatedTitleLabel: UILabel!
    @IBOutlet weak var rideLeftLabel: UILabel!
    @IBOutlet weak var ridesProgressBar: UIProgressView!
    @IBOutlet weak var validTillLabel: UILabel!
    @IBOutlet weak var subscriptionDetailContainerView: UIView!
    @IBOutlet weak var validityTitleLabel: UILabel!
     @IBOutlet weak var validityLabel: UILabel!
    @IBOutlet weak var noOfRidesTitleLabel: UILabel!
    @IBOutlet weak var noOfRidesLabel: UILabel!
    @IBOutlet weak var servicesTitleLabel: UILabel!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var subscriptionPackDescription: UILabel!
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var subscriptionPackView: UIView!
    @IBOutlet weak var paymentOptionsView: UIView!
    @IBOutlet weak var paymentOptionTableView: UITableView!
    @IBOutlet weak var paymentOptionsTitle: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var navigationView: UIView!
    
    //MARK:- VARIABLES
    //================
    var subsPackData: SubscriptionData!
    var paymentMethods: [SubscriptionPaymentMethodModel]!
    var activeData: [ActivePackDetail]!
    var paymentId = 0
    var packagetype = 0
    var selectindex = 0
    
    var subcriptionid = "0"
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        //PAYMENT OPTION VIEW HIDDEN
        //==========================
        self.paymentOptionsView.isHidden = true
        
        //VIEW SET UP
        //===========
        
        
        if packagetype == 1{
            buynowbtntext.setTitle("Activate".localized, for: UIControl.State.normal)
            
        }else{
            
            buynowbtntext.setTitle("Buy Now".localized, for: UIControl.State.normal)
        }
        
        
        AppConstants.enteramount = ""
        self.subscriptionPackView.edgeWithShadow(edge: 2.0)
        self.subscriptionPackImage.layer.cornerRadius = 50.0
        self.viewTitleLabel.text = "Subscriptions Pack Details".localized
        self.paymentOptionsTitle.text = "Select Payment Method".localized
        self.cancelButton.setTitle("Cancel".localized, for: .normal)
        currentlyActivatedTitleLabel.text = "Currently Activated".localized
        self.descriptionTitleLabel.text = "About Package".localized
        validityTitleLabel.text = "Validity".localized
        noOfRidesTitleLabel.text = "No of Rides".localized
        servicesTitleLabel.text = "Service".localized
        navigationView.backgroundColor = UIColor.appThemeColor()
        //TABLEVIEW & COLLECTIONVIEW DELEGATE AND DATASOURCE CONFORM
        //=========================================
        self.paymentOptionTableView.delegate = self
        self.paymentOptionTableView.dataSource = self
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        
        //DATA SET UP
        //===========
   
            if let activePackage = activeData {
                rideLeftLabel.text = "Rides Left".localized + ": \(activePackage[selectindex].ridesLeft ?? 0 )"
                validTillLabel.text = "Valid Till".localized  + ": " + (activePackage[selectindex].endDateTime ?? "")
                let imageUrl = activePackage[selectindex].image ?? ""
                AppConstants.downloadimage(imagename: imageUrl, imageview: self.subscriptionPackImage, placeholderimage: "mandy")
                self.subscriptionPackName.text = activePackage[selectindex].name ?? "Not Found"
                self.subscriptionPackDescription.text = activePackage[selectindex].descriptionValue ?? "Not Found"
                self.validTillLabel.text =  activePackage[selectindex].packageDurationName ?? "Not Found"
                validityLabel.text = activePackage[selectindex].packageDurationName ?? ""
                noOfRidesLabel.text = "\( activePackage[selectindex].ridesLeft ?? 0 )"
                
                subcriptionid = String((activePackage[selectindex].subscriptionPackId ?? 0))
                ridesProgressBar.progress = Float(activePackage[selectindex].usedTrips ?? 1) / Float(activePackage[selectindex].packageTotalTrips ?? 1)
        } else {
                    rideLeftLabel.isHidden = true
                    validTillLabel.isHidden = true
                    ridesProgressBar.isHidden = true
                    currentlyActivatedTitleLabel.isHidden = true
                    let imageUrl = self.subsPackData.image ?? ""
                    AppConstants.downloadimage(imagename: imageUrl, imageview: self.subscriptionPackImage, placeholderimage: "mandy")
                    self.subscriptionPackName.text = self.subsPackData.name ?? "Not Found"
                    self.subscriptionPackDescription.text = self.subsPackData.descriptionValue ?? "Not Found"
                    self.validTillLabel.text =  (self.subsPackData.packageDurationName ?? "Not Found")
                subcriptionid = String((subsPackData.id ?? 0))
                    validityLabel.text = subsPackData.packageDurationName
                    noOfRidesLabel.text = "\(subsPackData.maxTrip ?? 0)"
                }
    }
    
    override func viewDidLayoutSubviews() {
        subscriptionPackView.applyGradient(colours: [UIColor.appThemeColor(),UIColor.white], location: [0.0,0.9])
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
        if AppConstants.cardselect == 1
        {
            AppConstants.cardselect = 0
            let dic1 = [
                "subscription_package_id": subcriptionid,
                "payment_method_id": self.paymentId,
                "package_type": self.packagetype,
                "payment_status": "SUCCESS"
                ] as [String : AnyObject]
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ACTIVATESUBSCRIPTIONPACKAGE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ActivateSubscriptionModel.self)
        }
    }
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backBtnTapped(_ sender: Any)
    {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func buyNowBtnTapped(_ sender: Any)
    {
        
         if packagetype == 1{
            
            
            let dic1 = [
                "subscription_package_id": subcriptionid,
                 "package_type": self.packagetype,
                 "payment_status": "SUCCESS"
                
                ] as [String : AnyObject]
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ACTIVATESUBSCRIPTIONPACKAGE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ActivateSubscriptionModel.self)
            
         }else{
        
        self.paymentOptionsView.isHidden = false
            
        }
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any)
    {
        self.paymentOptionsView.isHidden = true
    }
    
    //MARK:- FUNCTIONS
    //================
    func callAPITOACTIAVTE(id: Int)
    {
        var dic1 = [:] as [String : AnyObject]
        
        if let activePackage = activeData {
            
            
        }
        
        
       
        
        if id == 3
        {
            dic1["subscription_package_id"] =  subcriptionid as AnyObject
            dic1["payment_method_id"] =  id as AnyObject
            dic1["package_type"] = self.packagetype as AnyObject
            
            showLoaderWithoutBackground()
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ACTIVATESUBSCRIPTIONPACKAGE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ActivateSubscriptionModel.self)
        }
        if id == 5
        {
            dic1["subscription_package_id"] =  subcriptionid as AnyObject
            dic1["payment_method_id"] =  id as AnyObject
            dic1["package_type"] = self.packagetype as AnyObject
            showLoaderWithoutBackground()
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ACTIVATESUBSCRIPTIONPACKAGE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ActivateSubscriptionModel.self)
        }
        if id == 4
        {
            AppConstants.enteramount = self.subsPackData.price ?? ""
            self.paymentOptionsView.isHidden = true
            self.presentVC("ManageYourCardViewController")
            self.paymentId = id
        }
        if id == 2
        {
            AppConstants.enteramount = self.subsPackData.price ?? ""
            self.paymentOptionsView.isHidden = true
            self.presentVC("ManageYourCardViewController")
            self.paymentId = id
        }
    }
}

//MARK:- TABLEVIEW DELEAGTE AND DATASOURCE METHODS
//================================================
extension SubscriptionDetailsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paymentMethods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentOptionTableView.dequeueReusableCell(withIdentifier: "paymentMethodCell", for: indexPath) as! PaymentMethodCell
        
        
        cell.paymentName.text = self.paymentMethods[indexPath.row].paymentMethod ?? "Not Found"
        let imageUrl = self.paymentMethods[indexPath.row].paymentIcon ?? ""
        AppConstants.downloadimage(imagename: imageUrl, imageview: cell.paymentImageView, placeholderimage: "mandy")
        
        let tableheight = paymentOptionTableView.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            paymentoptioninnerviewheight.constant = tableheight + 100.0
            
        }else{
            
            paymentoptioninnerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let paymentId = self.paymentMethods![indexPath.row].id
        
        
        self.callAPITOACTIAVTE(id: paymentId!)
    }
}

//MARK:- UICOLLECTIONVIEW DELEAGTE AND DATASOURCE METHODS
//================================================
extension SubscriptionDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if activeData != nil {
            return activeData[selectindex].serviceType?.count ?? 0
        } else {
           return  subsPackData.serviceType?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let serviceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionServiceCollectionCell", for: indexPath) as! SubscriptionServiceCollectionCell
        if activeData != nil {
            
            serviceCell.mainview.layer.borderWidth = 1.0
            serviceCell.mainview.layer.borderColor = UIColor.appThemeColor().cgColor
            
           serviceCell.serviceVehicleName.text =   activeData[selectindex].serviceType?[indexPath.item].serviceName
            
            
            
            
            let imageUrl = activeData[selectindex].serviceType?[indexPath.item].icon ?? ""
            AppConstants.downloadimage(imagename: imageUrl, imageview: serviceCell.serviceVehicleImageView, placeholderimage: "mandy")
        } else {
            
            
            serviceCell.mainview.layer.borderWidth = 1.0
            serviceCell.mainview.layer.borderColor = UIColor.appThemeColor().cgColor
            
            
            serviceCell.serviceVehicleName.text =   subsPackData.serviceType?[indexPath.item].serviceName
            let imageUrl = subsPackData.serviceType?[indexPath.item].icon ?? ""
            AppConstants.downloadimage(imagename: imageUrl, imageview: serviceCell.serviceVehicleImageView, placeholderimage: "mandy")
        }
        return serviceCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      //  let cellWidth = subjectValue[indexPath.item].width(withConstrainedHeight: 40.0, font: 2) + 5
        return CGSize(width: 90, height: 100)
    }
    
}

//MARK: API RESPONSE
//==================
extension SubscriptionDetailsViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? ActivateSubscriptionModel
        {
            let data = responseData
            if data.result == "1"
            {
                hideLoaderWithoutBackground()
                self.paymentOptionsView.isHidden = true
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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
