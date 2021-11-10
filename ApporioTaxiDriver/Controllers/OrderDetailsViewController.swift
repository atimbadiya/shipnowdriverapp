//
//  OrderDetailsViewController.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 14/7/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class OrderDetailsViewController: BaseViewController {

    @IBOutlet weak var tblOrderDetails: UITableView!
    var consignmentData : [CorporateBookingData] = []

    var totalItemsToCollect : [String] = []
    var totalItemsScanned : [String] = []
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let dic1 = ["tracking_id": AppConstants.OngoingTripTrackingID] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERORDER
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ConsignmentDataModel.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalItemsToCollect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblOrderDetails.dequeueReusableCell(withIdentifier: "OrderDetailsCell", for: indexPath) as! OrderDetailsCell
        cell.lblrowIndex.text = String("\(indexPath.row + 1)")
        cell.lblOrderBarcodeValue.text = totalItemsToCollect[indexPath.row]
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
//        cell.lblProductName.text =
        
        if totalItemsToCollect.contains(consignmentData[0].product_list![indexPath.row].sku!)
        {
            cell.lblSkuNumber.text = consignmentData[0].product_list![indexPath.row].sku!
            cell.lblProductName.text = consignmentData[0].product_list![indexPath.row].name!
        }
        
        if totalItemsScanned.contains(totalItemsToCollect[indexPath.row]) {
            cell.lblScanned.text = "SCANNED"
        }else{
            cell.lblScanned.text = "NOT SCANNED"
        }
        return cell
    }
}

extension OrderDetailsViewController: ApiResponseReceiver{
    func onSuccess<T>(_ response: T) where T : Mappable {
        if let responseData = response as? ConsignmentDataModel{
            let data:ConsignmentDataModel = responseData
            if data.result == "1"
            {
                consignmentData = data.data!
                if consignmentData.count > 0{
                    self.totalItemsScanned = consignmentData[0].scanned_product_label!
                    totalItemsToCollect = consignmentData[0].product_label!
                    tblOrderDetails.delegate = self
                    tblOrderDetails.dataSource = self
                    tblOrderDetails.reloadData()
                }
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
