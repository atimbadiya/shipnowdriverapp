//
//  NewEarningScreenViewController.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 13/06/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class NewEarningScreenViewController: BaseViewController {
    
    @IBOutlet weak var infobtn: UIButton!
    
    
    
    @IBOutlet weak var showtextlbl: UILabel!
    
    @IBOutlet weak var infoimageview: UIImageView!
    var nextperiodvalue = ""
    
    var previousperiodvalue = ""
    
    
    @IBOutlet weak var topdateview: UIView!
    
    
    @IBOutlet weak var totalearningtextvalue: UILabel!
    
    @IBOutlet weak var topearningstextlbl: UILabel!
    var newearningdata: NewEarningModel!
    var tablecount = 0
    @IBOutlet weak var earningtableview: UITableView!
    @IBOutlet weak var nextview: UIView!
    @IBOutlet weak var previousview: UIView!
    @IBOutlet weak var datetext: UILabel!
    
    @IBOutlet weak var totalearningslbl: UILabel!
    
    
    @IBOutlet weak var balancetext: UILabel!
    @IBOutlet weak var ridestextlbl: UILabel!
    
    @IBOutlet weak var balanceduelbl: UILabel!
    @IBOutlet weak var totalnumberrides: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topearningstextlbl.text = "Earnings".localized
        
        totalearningslbl.text = "Total Earnings".localized
        
        ridestextlbl.text = "Rides".localized
        
        balanceduelbl.text = "Balance Due".localized
        
        
        nextview.isHidden = true
        previousview.isHidden = true
        
        showLoaderWithoutBackground()
        
        
        topdateview.edgeWithShadow(edge: 4)
        
//        let dic1 = ["date": dateInFormat] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.EARNINGREVISEDURL
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: NewEarningModel.self)

        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func previousbtnclick(_ sender: Any) {
        
        showLoaderWithoutBackground()
        let dic1 = ["bill_period": previousperiodvalue] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.EARNINGREVISEDURL
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: NewEarningModel.self)

        
        
    }
    
    
    
    @IBAction func infobtnclick(_ sender: Any) {
        
        
        
        AppConstants.checkdate = newearningdata.data?.currentperiodforsend ?? ""
        
        self.presentVC("DayStatementController")
    }
    
    
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func nextbtnclick(_ sender: Any) {
        
         showLoaderWithoutBackground()
        let dic1 = ["bill_period": nextperiodvalue] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.EARNINGREVISEDURL
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: NewEarningModel.self)

        
    }
    
}


extension NewEarningScreenViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = earningtableview.dequeueReusableCell(withIdentifier: "earningcell", for: indexPath)
        
        let mainview: UIView = cell.contentView.viewWithTag(1)!
        
        let firstlbl: UILabel = cell.contentView.viewWithTag(2) as! UILabel
        
        let secondlbl: UILabel = cell.contentView.viewWithTag(3) as! UILabel
        
        
        if (newearningdata.data?.holderData![indexPath.row].leftTextVisibility)!{
            
            firstlbl.text = newearningdata.data?.holderData![indexPath.row].leftText
            
            
            firstlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + (newearningdata.data?.holderData![indexPath.row].leftTextColor ?? "333333")!)
            
            if (newearningdata.data?.holderData![indexPath.row].leftTextStyle ?? "NORMAL") == "BOLD"{
                
                firstlbl.font = UIFont.boldSystemFont(ofSize: 20)
                
            }else{
                
                
            }
            
            
        }
        
        if (newearningdata.data?.holderData![indexPath.row].rightTextVisibility)!{
            
            secondlbl.text = newearningdata.data?.holderData![indexPath.row].rightText
            
             secondlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + (newearningdata.data?.holderData![indexPath.row].rightTextColor ?? "333333")!)
            
            if (newearningdata.data?.holderData![indexPath.row].rightTextStyle ?? "NORMAL") == "BOLD"{
                
                secondlbl.font = UIFont.boldSystemFont(ofSize: 20)
                
            }else{
                
                
            }
            
        }
        
       
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        earningtableview.deselectRow(at: indexPath, animated: true)
    }
    
    
}


extension NewEarningScreenViewController: ApiResponseReceiver {
    
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? NewEarningModel{
            let data:NewEarningModel = responseData
            newearningdata = data
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                
             totalearningtextvalue.text = newearningdata.data?.totalEarnings ?? ""
                
            datetext.text = newearningdata.data?.currentPeriod ?? ""
                
            totalnumberrides.text = String((newearningdata.data?.trips ?? 0)!)
                
            showtextlbl.text = newearningdata.data?.settledmessage ?? ""
                
          showtextlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + (newearningdata.data?.settledmessagecolour ?? "c0392b")!)
                
                if (newearningdata.data?.previousPeriod ?? "") == ""{
                    
                    previousview.isHidden = true
                }else{
                    previousperiodvalue = (newearningdata.data?.previousPeriod)!
                    previousview.isHidden = false
                }
                
                if (newearningdata.data?.nextperiod ?? "") == ""{
                    
                    nextview.isHidden = true
                }else{
                    nextperiodvalue = (newearningdata.data?.nextperiod)!
                    nextview.isHidden = false
                }
                
                
                balancetext.text = newearningdata.data?.balanceDue ?? ""
                
                tablecount = newearningdata.data?.holderData?.count ?? 0
                
                
                if tablecount == 0{
                    
                    infoimageview.isHidden = true
                    infobtn.isUserInteractionEnabled = false
                }else{
                    
                    infoimageview.isHidden = false
                    infobtn.isUserInteractionEnabled = true
                }
   
                earningtableview.reloadData()
                
              
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




