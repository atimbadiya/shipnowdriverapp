//
//  SubscriptionListViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 26/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class SubscriptionListViewController: BaseViewController
{

    //MARK:- IBOUTLETS
    //================
    
    var firstviewheight: CGFloat?
    
    
    @IBOutlet weak var activesubscriptiontableview: UITableView!
    
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var SubscriptionTableView: UITableView!
//    @IBOutlet weak var activePackageNameLabel: UILabel!
//    @IBOutlet weak var viewActiveDetailBtn: UIButton!
//    @IBOutlet weak var maxActiveRidesLabel: UILabel!
//    @IBOutlet weak var rideLeftLabel: UILabel!
//    @IBOutlet weak var ridesProgressLabel: UIProgressView!
//    @IBOutlet weak var validTillActivePackageLabel: UILabel!
//    @IBOutlet weak var activeSubTitleLabel: UILabel!
//    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var navigationView: UIView!
//    @IBOutlet weak var topContainerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var activePackageImageView: UIImageView!
    
    //MARK:- VARIABLES
    //================
    var subsCount = 0
    var activecount = 0
    var subsData: SubscriptionModel!
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewTitleLabel.text = "Subscriptions Packs".localized
      
        self.SubscriptionTableView.delegate = self
        self.SubscriptionTableView.dataSource = self
        self.SubscriptionTableView.estimatedRowHeight = self.SubscriptionTableView.rowHeight
        self.SubscriptionTableView.rowHeight = UITableView.automaticDimension
        
        
        firstviewheight = 145.0
        
        navigationView.backgroundColor = UIColor.appThemeColor()
      //  topContainerViewHeightConstraint.constant = 0
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.callAPI()
    }
    
    override func viewDidLayoutSubviews() {
//        topContainerView.applyGradient(colours: [UIColor.appThemeColor(),UIColor.white], location: [0.0,0.9])
    }
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backBtnTapped(_ sender: Any)
    {
        self.dismissVC()
    }
    
     @objc func infoBtn(_ Sender: UIButton){
        
        
        print("dwf\(Sender.tag)")
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let subsDetailController = storyboard.instantiateViewController(withIdentifier: "SubscriptionDetailsViewController")as! SubscriptionDetailsViewController
        subsDetailController.paymentMethods = self.subsData.paymentMethod
        subsDetailController.packagetype = subsData.activePackDetail![Sender.tag].packageType ?? 0
        subsDetailController.selectindex = Sender.tag
       subsDetailController.activeData = subsData.activePackDetail
        self.present(subsDetailController, animated: true, completion: nil)
    }
    
    //MARK:- FUNCTIONS
    //================
    func callAPI()
    {
        let dic1 = [:] as [String : AnyObject]
        showLoaderWithoutBackground()
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SUBSCRIPTIONPACKAGES
        ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SubscriptionModel.self)
    }
}

//MARK:- TABLEVIEW DELEGATE AND DATASOURCE METHODS
//================================================
extension SubscriptionListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        if tableView.tag == 1{
            
            return self.activecount
            
        }else{
        
        return self.subsCount
        
         }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
         if tableView.tag == 1{
            
            let cell = activesubscriptiontableview.dequeueReusableCell(withIdentifier: "activesubscriptioncell", for: indexPath) as! ActivateSubscriptionTableViewCell
            
            
            cell.activesubtitlelabel.text = "Active Subscription".localized
            cell.viewactivedetailsbtn.setTitle("View Detail".localized, for: .normal)
            
            cell.viewactivedetailsbtn.setCornerCircular(7)
            
            
              cell.topcontainerview.applyGradient(colours: [UIColor.appThemeColor(),UIColor.white], location: [0.0,0.9])
            
            
            cell.activepackagename.text = self.subsData.activePackDetail![indexPath.row].name ?? ""
            
            cell.maxactiveridelabel.text = "Maximum Rides".localized + ": \(self.subsData.activePackDetail![indexPath.row].packageTotalTrips ?? 0)"
            
            cell.rideleftlabel.text = "Rides Left".localized + ": \(self.subsData.activePackDetail![indexPath.row].ridesLeft ?? 0)"
            
            cell.validtilllabel.text = "Valid Till".localized + ":" + (self.subsData.activePackDetail![indexPath.row].endDateTime ??  "")
            
            cell.rideprogresslabel.progress = Float(self.subsData.activePackDetail![indexPath.row].usedTrips ?? 1) / Float(self.subsData.activePackDetail![indexPath.row].packageTotalTrips ?? 1)
            
            let imageUrl = self.subsData.activePackDetail![indexPath.row].image ?? ""
            
            
            AppConstants.downloadimage(imagename: imageUrl, imageview: cell.activepackageiamge!, placeholderimage: "mandy")
            
            cell.viewactivedetailsbtn.tag = indexPath.row
            cell.viewactivedetailsbtn.addTarget(self, action: #selector(SubscriptionListViewController.infoBtn(_:)), for: .touchUpInside)
            
            
            
//            if self.subsData.activePackDetail![indexPath.row].ex == true {
//
//
//            viewActiveDetailBtn.setTitle("Renew".localized, for: .normal)
//            } else {
//            viewActiveDetailBtn.setTitle("View Detail".localized, for: .normal)
//                                    }
            
           
            
            
            
           firstviewheight =  activesubscriptiontableview.contentSize.height + 100.0
            
            let tableheight = firstviewheight!
            
            
            // topviewheight.constant = tableheight
            
            let headerView = SubscriptionTableView.tableHeaderView!
            
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
            
            var frame = headerView.frame
            frame.size.height = tableheight
            headerView.frame = frame
            
            SubscriptionTableView.tableHeaderView = headerView
            
            
            
             return cell
         }else{
        
        
        let cell = SubscriptionTableView.dequeueReusableCell(withIdentifier: "subscriptionListTableViewCell", for: indexPath) as! SubscriptionListTableViewCell
        let cellData = self.subsData.data![indexPath.row]
        cell.setSubscriptionData(data: cellData)
            
            
            
          
            
        return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        if tableView.tag == 1{
            
            
        }else{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let subsDetailController = storyboard.instantiateViewController(withIdentifier: "SubscriptionDetailsViewController")as! SubscriptionDetailsViewController
        subsDetailController.subsPackData = self.subsData.data![indexPath.row]
            
            
           
            
            subsDetailController.packagetype = subsData.data![indexPath.row].packageType ?? 0
        subsDetailController.paymentMethods = self.subsData.paymentMethod
        self.present(subsDetailController, animated: true, completion: nil)
            
            
        }
    }
}

//MARK:- TABLEVIEW DELEGATE AND DATASOURCE METHODS
//================================================
extension SubscriptionListViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? SubscriptionModel
        {
            self.subsData = responseData
            if subsData.result == "1"
            {
                hideLoaderWithoutBackground()

                
               
                    
                    activecount = self.subsData.activePackDetail?.count ?? 0
                
                if activecount == 0{
                    firstviewheight =  0.0
                    
                    let tableheight = firstviewheight!
                    
                    
                    // topviewheight.constant = tableheight
                    
                    let headerView = SubscriptionTableView.tableHeaderView!
                    
                    headerView.setNeedsLayout()
                    headerView.layoutIfNeeded()
                    
                    var frame = headerView.frame
                    frame.size.height = tableheight
                    headerView.frame = frame
                    
                    SubscriptionTableView.tableHeaderView = headerView
                  //  self.activesubscriptiontableview.isHidden = true
                }else{
                   
                   // self.activesubscriptiontableview.isHidden = false
                    
                }
                
                    self.activesubscriptiontableview.reloadData()
                    
                
                
                
                self.subsCount = self.subsData.data?.count ?? 0
                self.SubscriptionTableView.reloadData()
            }
            else if subsData.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: subsData.message!, VC: self)
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
