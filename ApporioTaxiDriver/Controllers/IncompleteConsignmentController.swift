//
//  IncompleteConsignmentController.swift
//  ApporioTaxiDriver
//
//  Created by Ankit's Mac on 16/6/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftQRScanner

class IncompleteConsignmentController: BaseViewController{
    
    var consignmentModel : ConsignmentDataModel!
    
    var consignmentData : [CorporateBookingData] = []
    var installedNavigationApps : [String] = ["Apple Maps"]
    var AreAllItemsPickedUp = false
    
    @IBOutlet weak var tbl_incompleteConsignment: UITableView!
        
    @IBOutlet weak var btnNavigation: UIButton!
  
    var scannedConsignmentList: [String] = []
    @IBOutlet weak var btnScanBarcode: UIButton!
    
    @objc func navigationBtnTapped(_ sender: UIButton)
    {
        if AreAllItemsPickedUp == true
        {
            if sender.tag == 0
            {
                let delivery_latitude = self.consignmentData[sender.tag].delivery_latitude!
                let delivery_longitude = self.consignmentData[sender.tag].delivery_longitude!

                    self.installedNavigationApps.removeAll()
                    
                if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.apple.com")! as URL)){
                    
                    self.installedNavigationApps.append("Apple Maps")

                }
                    if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)){
                        
                        self.installedNavigationApps.append("Google Maps")
                    }
                    
                    // if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.waze.com")! as URL)){
                    
                    if(UIApplication.shared.canOpenURL(URL(string:"waze://")!)){
                        
                        self.installedNavigationApps.append("Waze")
                    }
                    
                    let alert = UIAlertController(title: NSLocalizedString("Selection".localized, comment: ""), message: NSLocalizedString("Select Navigation App".localized, comment: ""), preferredStyle: .actionSheet)
                    for app in self.installedNavigationApps {
                        let button = UIAlertAction(title: app, style: .default, handler: { (action) in
                            
                            
                            if(app == "Google Maps"){
                   
                    UIApplication.shared.open(NSURL(string:"comgooglemaps-x-callback://?saddr=&daddr=\(delivery_latitude),\(delivery_longitude)&directionsmode=driving")! as URL, completionHandler: { (success) in
                                            print("Settings opened: \(success)") // Prints true
                                    })
                                }
                           
                             else if(app == "Waze"){
                                
                                    let urlStr:NSString = NSString(format: "waze://?ll=%f,%f&navigate=yes",delivery_latitude, delivery_longitude)
                                    print(urlStr)
                                    
                                UIApplication.shared.open(NSURL(string: urlStr as String)! as URL, completionHandler: { (success) in
                                        print("Settings opened: \(success)") // Prints true
                                    })
                                    
                                    //  UIApplication.shared.openURL(NSURL(string: (urlStr as String) as String)! as URL)
                                
                                }
                            
                                else if(app == "Apple Maps"){
                                    
                                    UIApplication.shared.open(NSURL(string:
                                        "http://maps.apple.com/?saddr=&daddr=\(delivery_latitude),\(delivery_longitude)&directionsmode=driving")! as URL, completionHandler: { (success) in
                                            print("Settings opened: \(success)") // Prints true
                                    })
                            } else{
                                    
                                }
                    })
                       
                        alert.addAction(button)
                    }
                    
                    let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""),
                                                     style: .cancel, handler: nil)
                    alert.addAction(cancelAction)
                    
                    alert.popoverPresentationController?.sourceView = self.view
                    alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
                    alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                    
                    self.present(alert, animated: true){
                        print("option menu presented")
                    }
            }
            else
            {
                showErrorAlert("Alert".localized, alertMessage:"Start navigation from first delivery".localized, VC:self)
            }

        }
        else
        {
            showErrorAlert("Alert".localized, alertMessage:"Scan all barcodes first".localized, VC:self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnQRCodeTapped(_ sender: Any) {
        self.presentVC("QRCodeController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        consignmentData.removeAll()
        self.callApi()
    }
    
    func callApi(){
      
        showLoaderWithoutBackground()
        let dic1 = ["booking_id": AppConstants.bookingid,"booking_status":"incomplete"] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.INCOMPLETECONSIGNMENT
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ConsignmentDataModel.self)
        
    }
    
    func updateBookingStatus(tracking_id:String, booking_status: String) {
          
            showLoaderWithoutBackground()
            
            let dic1 = ["tracking_id":tracking_id, "booking_status": booking_status] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.BOOKINGSTATUSUPDATE
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverAppConfigureModel.self)
      }
}

extension IncompleteConsignmentController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consignmentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_incompleteConsignment.dequeueReusableCell(withIdentifier: "IncompleteConsignmentCell", for: indexPath) as! IncompleteConsignmentCell
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.btnNavigation.tag = indexPath.row
        cell.btnNavigation.addTarget(self, action: #selector(navigationBtnTapped(_:)), for: .touchUpInside)
        cell.lblReceiverName.text = consignmentData[indexPath.row].receiver_name
        cell.lblTrackingID.text = consignmentData[indexPath.row].tracking_id
        cell.cellBackView.edgeWithShadow(edge: 4.0)
        
        cell.lblScheduledDate.text = consignmentData[indexPath.row].schedule_date
        cell.lblPhone.text = consignmentData[indexPath.row].receiver_contact_number
        cell.lblPickupAddress.text = consignmentData[indexPath.row].pickup_address
        
        var deliveryAddress = consignmentData[indexPath.row].delivery_address!
        deliveryAddress += ", " + consignmentData[indexPath.row].delivery_suburb!
        deliveryAddress += " " + consignmentData[indexPath.row].delivery_state!
        deliveryAddress += " " + consignmentData[indexPath.row].delivery_postcode!

        cell.lblDeliveryAddress.text = deliveryAddress
        
        cell.lblNumOfScannedParcels.layer.cornerRadius = cell.lblNumOfScannedParcels.bounds.width/2
        cell.lblNumOfScannedParcels.layer.borderWidth = 5.0
        cell.lblNumOfScannedParcels.layer.backgroundColor = UIColor.clear.cgColor
        cell.lblRowIndex.text = String("\(indexPath.row+1)")
        
        var productsList : [String] = []
        var scannedProductList : [String] = []
        
        
        if consignmentData[indexPath.row].product_label != nil
        {
            productsList = consignmentData[indexPath.row].product_label!
            
        }
        
        if consignmentData[indexPath.row].scanned_product_label != nil
        {
            scannedProductList = consignmentData[indexPath.row].scanned_product_label!
        }
        
        cell.lblBookingStatus.text = "Driver Assigned"

        if productsList.count == scannedProductList.count {
            
            cell.lblBookingStatus.text = "Driver Picked Up"
            cell.btnNavigation.isHidden = false

            cell.lblNumOfScannedParcels.layer.borderColor = UIColor.green.cgColor
            //add this order into scanned order list
            scannedConsignmentList.append(consignmentData[indexPath.row].tracking_id!)
            
            //check if all orders in this consignment are scanned
            if scannedConsignmentList.count == consignmentData.count{
                AreAllItemsPickedUp = true
                
                AppConstants.OngoingTripTrackingID = consignmentData[0].tracking_id!
                updateBookingStatus(tracking_id: consignmentData[0].tracking_id!, booking_status: "Next Deliver")
            }
        }else{
            cell.lblNumOfScannedParcels.layer.borderColor = UIColor.red.cgColor
        }
        cell.lblNumOfScannedParcels.text = String("\(scannedProductList.count)") + String("/") + String("\(productsList.count)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppConstants.orderDetailsData = consignmentData[indexPath.row]
        presentVC("OrderDetailsViewController")
    }
}


extension IncompleteConsignmentController : ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? ConsignmentDataModel{

            let data:ConsignmentDataModel = responseData

            consignmentModel = data

            if consignmentModel.result == "1" {

                consignmentData = consignmentModel.data!
                AppConstants.remainedDeliveriesInThisConsignment = consignmentData.count
                hideLoaderWithoutBackground()
                
                consignmentData = consignmentData.sorted { $0.geo_map_distance_short! < $1.geo_map_distance_short! }
                tbl_incompleteConsignment.isHidden = false

                self.toastLabel.isHidden = true
                
                tbl_incompleteConsignment.delegate = self
                tbl_incompleteConsignment.dataSource = self
                tbl_incompleteConsignment.reloadData()
                AppConstants.remainedDeliveriesInThisConsignment = consignmentData.count
              
                
            }else if consignmentModel.result == "999" {

                UserDefaultUtility.removeAllUserDefault()

                self.presentVC("SplashViewController")

            } else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                tbl_incompleteConsignment.isHidden = true
                hideLoaderWithoutBackground()
             //   showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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


