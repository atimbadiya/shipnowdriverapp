//
//  ScheduledTripsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ScheduledTripsViewController: BaseViewController {
    
    var scheduleridedata: DriverScheduleModel!
    var tablecount = 0
    @IBOutlet weak var scheduletableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.callApi()
    }

    func callApi()
    {
        tablecount = 0
        showLoaderWithoutBackground()
        AppConstants.tripstype = String((AppConstants.driverconfiguredata.data?.segments![0].id ?? 0)!)
        let dic1 = ["type": AppConstants.tripstype as AnyObject] as [String : AnyObject]
        //var driverid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.DRIVER_ID)

        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SCHEDULERIDES
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverScheduleModel.self)
    }
}

extension ScheduledTripsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = scheduletableview.dequeueReusableCell(withIdentifier: "scheduletrip", for: indexPath) as! ScheduledTripTableViewCell
        
        cell.schedulecellmainview.edgeWithShadow(edge: 4.0)
        cell.schedulecellmainview.layer.cornerRadius = 10.0
        cell.lblTripIndex.text = "\(indexPath.row + 1)."

        cell.schedulecarnamenolbl.text = scheduleridedata.data![indexPath.row].highlightedLeftText ?? ""
        
        cell.schedulecarnamenolbl.textColor = PListUtility.getColorFromHex(hexString: scheduleridedata.data![indexPath.row].highlightedLeftText!)
        
        cell.scheduledatetimelbl.text = scheduleridedata.data![indexPath.row].smallLeftText ?? ""
        
        cell.schedulepaymentmethodlbl.text = scheduleridedata.data![indexPath.row].highlightedRightText ?? ""
        
        cell.schedulepaymentmethodlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + scheduleridedata.data![indexPath.row].highlightedRightTextColor!)
        
        cell.schedulepickuploclbl.text = scheduleridedata.data![indexPath.row].pickLocation ?? ""
        
        cell.scheduledroploclbl.text = scheduleridedata.data![indexPath.row].dropLocation ?? ""
        
        cell.scheduletripstatuslbl.text = scheduleridedata.data![indexPath.row].statusText ?? ""
        
        cell.scheduletripstatuslbl.textColor = PListUtility.getColorFromHex(hexString: "#" + scheduleridedata.data![indexPath.row].statusTextColor!)
        
        if scheduleridedata.data![indexPath.row].userDescriptionLayoutVisibility!{
            
            cell.userimgnamenoview.isHidden = false
            
            cell.scheduleuserimgview.makeViewCircular()
            
            let newstring = scheduleridedata.data![indexPath.row].circularImage
            
            if newstring == ""{
                
            }else{
               AppConstants.downloadimage(imagename: newstring!, imageview: cell.scheduleuserimgview, placeholderimage: "mandy")
            }
            
            //cell.driverratingvalue.editable = false
            
            cell.scheduleusername.text = scheduleridedata.data![indexPath.row].userNameText ?? ""
            
            cell.scheduleusercontact.text = scheduleridedata.data![indexPath.row].userDescriptiveText ?? ""
            
            //cell.driverratingvalue.rating = Float((activeridedata.data![indexPath.row].driverRating)!)!
            
        }else{
            
            cell.userimgnamenoview.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        scheduletableview.deselectRow(at: indexPath, animated: true)
        
        AppConstants.bookingid = String((scheduleridedata.data![indexPath.row].bookingId)!)
        AppConstants.triptypeid = 2
        self.presentVC("FullTripDetailsViewController")
    }
}

extension ScheduledTripsViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverScheduleModel{
            
            let data:DriverScheduleModel = responseData
            
            scheduleridedata = data
            
            if scheduleridedata.result == "1" {
                
                hideLoaderWithoutBackground()
                scheduletableview.isHidden = false
              
                self.toastLabel.isHidden = true
                
                tablecount = (scheduleridedata.data?.count)!
                scheduletableview.reloadData()
                
            }else if scheduleridedata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                scheduletableview.isHidden = true
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

