//
//  NewRequestUpcomingViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class NewRequestUpcomingViewController: BaseViewController {
    
    var newupcomingridedata: DriverNewUpcomingModel!
    
    var tablecount = 0
    
    @IBOutlet weak var newupcomingtableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.callApi()
    }
 
func callApi(){
    tablecount = 0
    
    showLoaderWithoutBackground()
    
    let dic1 = ["type": AppConstants.tripstype as AnyObject,
                
                ] as [String : AnyObject]
    
    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.NEWUPCOMINGRIDES
    ServiceManager.sharedInstance.delegate = self
    
    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverNewUpcomingModel.self)
    
    
}
}

extension NewRequestUpcomingViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = newupcomingtableview.dequeueReusableCell(withIdentifier: "newrequestupcoming", for: indexPath) as! NewRequestUpcomingTableViewCell
        
        cell.newupcomingmainview.edgeWithShadow(edge: 4.0)
        
        cell.newupcomingcarnamenolbl.text = newupcomingridedata.data![indexPath.row].highlightedLeftText
         cell.newupcomingcarnamenolbl.textColor = PListUtility.getColorFromHex(hexString:  newupcomingridedata.data![indexPath.row].highlightedLeftTextColor!)
        cell.newdatetimelbl.text = newupcomingridedata.data![indexPath.row].smallLeftText
        
        cell.newupcomingpaymentlbl.text = newupcomingridedata.data![indexPath.row].highlightedRightText
        
        cell.newupcomingpaymentlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + newupcomingridedata.data![indexPath.row].highlightedRightTextColor!)
        
        cell.newpickuplbl.text = newupcomingridedata.data![indexPath.row].pickLocation
        
        cell.newdroplbl.text = newupcomingridedata.data![indexPath.row].dropLocation
        
        cell.newuserridestatuslbl.text = newupcomingridedata.data![indexPath.row].statusText
        
        cell.newuserridestatuslbl.textColor = PListUtility.getColorFromHex(hexString: "#" + newupcomingridedata.data![indexPath.row].statusTextColor!)
        
        if newupcomingridedata.data![indexPath.row].userDescriptionLayoutVisibility!{
            
            cell.newuserimgnamenoview.isHidden = false
            
            cell.newuserimgview.makeViewCircular()
            
            let newstring = newupcomingridedata.data![indexPath.row].circularImage
            
            if newstring == ""{
                
                
            }else{
                
                
                
                AppConstants.downloadimage(imagename: newstring!, imageview: cell.newuserimgview, placeholderimage: "mandy")
                
            }
            
            //cell.driverratingvalue.editable = false
            
            cell.newusernamelbl.text = newupcomingridedata.data![indexPath.row].userNameText
            
            cell.newuserphonelbl.text = newupcomingridedata.data![indexPath.row].userDescriptiveText
            
            //cell.driverratingvalue.rating = Float((activeridedata.data![indexPath.row].driverRating)!)!
            
            
        }else{
            
            cell.newuserimgnamenoview.isHidden = true
        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newupcomingtableview.deselectRow(at: indexPath, animated: true)
        
        AppConstants.bookingid = String((newupcomingridedata.data![indexPath.row].bookingId)!)
        
        self.presentVC("FullTripDetailsViewController")
        
        
    }
    
    
}

extension NewRequestUpcomingViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverNewUpcomingModel{
            
            let data:DriverNewUpcomingModel = responseData
            
            newupcomingridedata = data
            
            if newupcomingridedata.result == "1" {
                
                hideLoaderWithoutBackground()
                newupcomingtableview.isHidden = false
               
                self.toastLabel.isHidden = true
                
                
                tablecount = (newupcomingridedata.data?.count)!
                newupcomingtableview.reloadData()
                
                
                
            }else if newupcomingridedata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                newupcomingtableview.isHidden = true
                hideLoaderWithoutBackground()
               // showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
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


