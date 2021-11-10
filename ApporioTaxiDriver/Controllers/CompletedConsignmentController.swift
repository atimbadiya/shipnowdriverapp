//
//  CompletedConsignmentController.swift
//  ApporioTaxiDriver
//
//  Created by Ankit's Mac on 16/6/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftQRScanner

class CompletedConsignmentController: BaseViewController {
    
    var consignmentModel : ConsignmentDataModel!
    
    var consignmentData : [CorporateBookingData] = []
    
    
    @IBAction func scanCodeTapped(_ sender: Any) {
        self.presentVC("QRCodeController")
    }
    
    @IBOutlet weak var tblCompletedConsignment: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
        }
    
    override func viewWillAppear(_ animated: Bool) {
        consignmentData.removeAll()
        self.callApi()

    }
    func callApi(){
      
        showLoaderWithoutBackground()
        let dic1 = ["booking_id": AppConstants.bookingid,"booking_status":"complete"] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.COMPLETEDCONSIGNMENT
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ConsignmentDataModel.self)
    }
}

extension CompletedConsignmentController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consignmentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCompletedConsignment.dequeueReusableCell(withIdentifier: "CompletedConsignmentCell", for: indexPath) as! CompletedConsignmentCell
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
        
        cell.lblReceiverName.text = consignmentData[indexPath.row].receiver_name ?? ""
        cell.lblTrackingID.text = consignmentData[indexPath.row].tracking_id ?? ""
        cell.lblRowIndex.text = String("\(indexPath.row+1)")

        cell.lblScheduledDate.text = consignmentData[indexPath.row].schedule_date ?? ""
        cell.lblBookingStatus.text = consignmentData[indexPath.row].booking_status ?? ""
        cell.lblPhone.text = consignmentData[indexPath.row].receiver_contact_number ?? ""
        cell.lblPickupAddress.text = consignmentData[indexPath.row].pickup_address ?? ""
        
        var deliveryAddress = consignmentData[indexPath.row].delivery_address ?? ""
        deliveryAddress += ", " + consignmentData[indexPath.row].delivery_suburb!
        deliveryAddress += " " + consignmentData[indexPath.row].delivery_state!
        deliveryAddress += " " + consignmentData[indexPath.row].delivery_postcode!

        cell.lblDeliveryAddress.text = deliveryAddress
        return cell
    }
}

extension CompletedConsignmentController : ApiResponseReceiver{
    func onSuccess<T>(_ response: T) where T : Mappable {
        if let responseData = response as? ConsignmentDataModel{

            let data:ConsignmentDataModel = responseData

            consignmentModel = data

            if consignmentModel.result == "1" {

                consignmentData = consignmentModel.data!
                hideLoaderWithoutBackground()
                
                tblCompletedConsignment.isHidden = false
                
                self.toastLabel.isHidden = true
                
                tblCompletedConsignment.delegate = self
                tblCompletedConsignment.dataSource = self
                tblCompletedConsignment.reloadData()

            }else if consignmentModel.result == "999" {

                UserDefaultUtility.removeAllUserDefault()

                self.presentVC("SplashViewController")

            } else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                tblCompletedConsignment.isHidden = true
                hideLoaderWithoutBackground()
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
