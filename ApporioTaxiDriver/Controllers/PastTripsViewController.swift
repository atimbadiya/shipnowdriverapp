//
//  PastTripsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class PastTripsViewController: BaseViewController {
    
    var pasttripdata: PastTripModels!
    private var scrollToTime = true
    
    var modelRideList: PastTripModels!
    var modelRideData: [PastTripDataData] = []
    var tablecount: Int?
    var strCurrentPage = "1"
    var strTotalPage = "0"
    
    @IBOutlet weak var pasttriptableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         tablecount = 0
         showLoaderWithoutBackground()
        self.callApi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if AppConstants.cancelbtnvaluematch == "2"{
            modelRideData.removeAll()
            AppConstants.cancelbtnvaluematch  = ""
            strCurrentPage = "1"
            self.callApi()
        }
    }
    
    func callApi(){
        
        tablecount = 0
        showLoaderWithoutBackground()
        AppConstants.tripstype = String((AppConstants.driverconfiguredata.data?.segments![0].id ?? 0)!)
        let dic1 = ["type": AppConstants.tripstype as AnyObject,
                    ] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.PASTRIDES + "?page=\(strCurrentPage)"
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PastTripModels.self)
    }
}

extension PastTripsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = pasttriptableview.dequeueReusableCell(withIdentifier: "pasttrip", for: indexPath) as! PastTripTableViewCell
        
        cell.pastmainview.edgeWithShadow(edge: 4.0)
        cell.lblTripIndex.text = "\(indexPath.row + 1)."

        cell.pastcarnamenolbl.text = modelRideData[indexPath.row].highlightedLeftText ?? ""
        
        cell.pastcarnamenolbl.textColor = PListUtility.getColorFromHex(hexString:  modelRideData[indexPath.row].highlightedLeftTextColor!)
        
        cell.pastdatetimelbl.text = modelRideData[indexPath.row].smallLeftText ?? ""
        
        cell.pastpaymentlbl.text = modelRideData[indexPath.row].highlightedRightText ?? ""
        
        cell.pastpaymentlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + modelRideData[indexPath.row].highlightedRightTextColor!)
        
        cell.pastpickuploclbl.text = modelRideData[indexPath.row].pickLocation ?? ""
        
        cell.pastdroploclbl.text = modelRideData[indexPath.row].dropLocation ?? ""
        
        cell.pastridestatuslbl.text = modelRideData[indexPath.row].statusText ?? ""
        
        cell.pastridestatuslbl.textColor = PListUtility.getColorFromHex(hexString: "#" + modelRideData[indexPath.row].statusTextColor!)
        
        if modelRideData[indexPath.row].userDescriptionLayoutVisibility!{
            
            cell.pastimgnamenoview.isHidden = false
            
            cell.pastuserimgview.makeViewCircular()
            
            let newstring = modelRideData[indexPath.row].circularImage ?? ""
            
            if newstring == ""{
                
            }else{
                AppConstants.downloadimage(imagename: newstring, imageview: cell.pastuserimgview, placeholderimage: "mandy")
                
            }
            //cell.driverratingvalue.editable = false
            
            cell.pastusernamelbl.text = modelRideData[indexPath.row].userNameText ?? ""
                        
            //cell.driverratingvalue.rating = Float((activeridedata.data![indexPath.row].driverRating)!)!
            
        }else{
            
            cell.pastimgnamenoview.isHidden = true
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastSectionIndex = pasttriptableview.numberOfSections - 1
        let lastRowIndex = pasttriptableview.numberOfRows(inSection: lastSectionIndex) - 1
        
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            
            self.pasttriptableview.tableFooterView?.isHidden = false
            
            if strCurrentPage != strTotalPage {
                
                let strPage = String(format: "%d", Int(self.strCurrentPage)! + 1)
                
                self.strCurrentPage = strPage
                
                //self.callApi()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pasttriptableview.deselectRow(at: indexPath, animated: true)
        AppConstants.bookingid = String((modelRideData[indexPath.row].bookingId)!)
        AppConstants.triptypeid = 3
        self.presentVC("FullTripDetailsViewController")
        
        //        AppConstants.bookingId = String((activeridedata.data![indexPath.row].bookingId)!)
        //
        //        self.presentVC("FullTripDetailsViewController")
        
    }
}

extension PastTripsViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? PastTripModels{
            
            let data:PastTripModels = responseData
            
            pasttripdata = data
            
            if pasttripdata.result == "1" {
                
                hideLoaderWithoutBackground()
                pasttriptableview.isHidden = false
               
                self.toastLabel.isHidden = true
                
                self.modelRideList = self.pasttripdata
                
                self.strTotalPage = String((self.pasttripdata.totalPages ?? 0)!)
                self.strCurrentPage = String((self.pasttripdata.currentPage ?? 1)!)
                
                for newData in self.modelRideList.data! {
                    
                    self.modelRideData.append(newData)
                }
                
                tablecount = self.modelRideData.count
                pasttriptableview.reloadData()
                
            }else if pasttripdata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                pasttriptableview.isHidden = true
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




