//
//  OutstationUpcomingViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class OutstationUpcomingViewController: BaseViewController {
    
    var outstationtripdata: OutstationModels!
    
    var tablecount = 0

    @IBOutlet weak var outstationtableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.callApi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.callApi()
    }

    func callApi(){
        tablecount = 0
        
        showLoaderWithoutBackground()
        
        let dic1 = ["type": AppConstants.tripstype as AnyObject,
                    
                    ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.OUTSTATIONRIDES
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: OutstationModels.self)
        
        
    }
}

extension OutstationUpcomingViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = outstationtableview.dequeueReusableCell(withIdentifier: "outstationupcoming", for: indexPath) as! OutstationUpcomingTableViewCell
        
        cell.outstationcellmainview.edgeWithShadow(edge: 4.0)
        
        cell.outcarnamenolbl.text = outstationtripdata.data![indexPath.row].highlightedLeftText
        
         cell.outcarnamenolbl.textColor = PListUtility.getColorFromHex(hexString:  outstationtripdata.data![indexPath.row].highlightedLeftTextColor!)
        
        cell.outdatetimelbl.text = outstationtripdata.data![indexPath.row].smallLeftText
        
        cell.outpaymentmethodlbl.text = outstationtripdata.data![indexPath.row].highlightedRightText
        
        cell.outpaymentmethodlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + outstationtripdata.data![indexPath.row].highlightedRightTextColor!)
        
        cell.outpickuplbl.text = outstationtripdata.data![indexPath.row].pickLocation
        
        cell.outdroplbl.text = outstationtripdata.data![indexPath.row].dropLocation
        
        cell.outrideststuslbl.text = outstationtripdata.data![indexPath.row].statusText
        
        cell.outrideststuslbl.textColor = PListUtility.getColorFromHex(hexString: "#" + outstationtripdata.data![indexPath.row].statusTextColor!)
        
        if outstationtripdata.data![indexPath.row].userDescriptionLayoutVisibility!{
            
            cell.outuservisibleview.isHidden = false
            
            cell.outuserimgview.makeViewCircular()
            
            let newstring = outstationtripdata.data![indexPath.row].circularImage
            
            if newstring == ""{
                
                
            }else{
                
                
                
                AppConstants.downloadimage(imagename: newstring!, imageview: cell.outuserimgview, placeholderimage: "mandy")
                
            }
            
            //cell.driverratingvalue.editable = false
            
            cell.outusernamelbl.text = outstationtripdata.data![indexPath.row].userNameText
            
            cell.outusercontactlbl.text = outstationtripdata.data![indexPath.row].userDescriptiveText
            
            //cell.driverratingvalue.rating = Float((activeridedata.data![indexPath.row].driverRating)!)!
            
            
        }else{
            
            cell.outuservisibleview.isHidden = true
        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        outstationtableview.deselectRow(at: indexPath, animated: true)
        
        AppConstants.bookingid = String((outstationtripdata.data![indexPath.row].bookingId)!)
        
                self.presentVC("FullTripDetailsViewController")
        
        
    }
    
    
}

extension OutstationUpcomingViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? OutstationModels{
            
            let data:OutstationModels = responseData
            
            outstationtripdata = data
            
            if outstationtripdata.result == "1" {
                
                hideLoaderWithoutBackground()
                outstationtableview.isHidden = false
              
                self.toastLabel.isHidden = true
                
                
                tablecount = (outstationtripdata.data?.count)!
                outstationtableview.reloadData()
                
                
                
            }else if outstationtripdata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                outstationtableview.isHidden = true
                hideLoaderWithoutBackground()
              //  showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
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
