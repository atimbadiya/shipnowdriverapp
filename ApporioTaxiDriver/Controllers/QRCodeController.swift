//
//  QRCodeController.swift
//  ApporioTaxiDriver
//
//  Created by Ankit's Mac on 21/6/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit
import SwiftQRScanner
import ObjectMapper
import AVFoundation

class QRCodeController: BaseViewController,UINavigationControllerDelegate {
    

    @IBOutlet weak var lblBookingStatus: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var lblQRcode: UILabel!
    var customerQRcode = ""

//    @IBOutlet weak var dropImageUploadView: UIView!
    
    @IBOutlet weak var btnImageUploads: UIButton!  
    
    var consignmentModel : ConsignmentDataModel!
    var consignmentData : [CorporateBookingData] = []
    var customerQRData : [CorporateBookingData] = []
    var customerQRModel : ScanCustomerQRcodeModel!
    var driverModel : SuperDriverModel!
    var customerModel : ManageCardsModel!
    var configureModel : DriverAppConfigureModel!
    var isCodeScanned = false
    var player: AVAudioPlayer?

    var checkImageValue = ""
  
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismissVC()
    }
 
    @IBAction func btnDropoffImageUploadTapped(_ sender: Any) {
        AppConstants.UploadDropoffImagesFromVC = "QRCodeController"
        self.presentVC("UploadDropoffImagesController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppConstants.isDropoffScanning = false
        hideLoaderWithoutBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        showLoaderWithStatus(status: "Loading")
        loadScanningView()
        AppConstants.customerQRcodeForTrackRiderVC = ""
    }
    
    func loadScanningView() {
        let scannerVC = QRCodeScannerController(cameraImage: UIImage(named: "camera"), cancelImage: UIImage(named: "cancel"), flashOnImage: UIImage(named: "flash-on"), flashOffImage: UIImage(named: "flash-off"))
        scannerVC.delegate = self
//        self.present(scannerVC, animated: true, completion: nil)
        
        self.present(scannerVC, animated: true, completion: {
            scannerVC.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })
    }
     
    func receiveOrderDetailsByQRCode(code: String) {
        showLoaderWithoutBackground()
      
        let dic1 = ["tracking_id": code] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERORDER
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ConsignmentDataModel.self)
    }
    
    func validateDropoffPackages(code: String){
        showLoaderWithoutBackground()

        let dic1 = ["tracking_id": code,"booking_id":AppConstants.bookingid, "drop_off_product_scan": "1"] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERORDER
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ActivateSubscriptionModel.self)
    }
    
    func receiveOrderDetailsByBarCode(code:String){
      
        showLoaderWithoutBackground()
      
        let dic1 = ["barcode_id": code] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SCANBARCODE
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SuperDriverModel.self)
    }
    
    func updateBookingStatus(booking_status: String) {
        
        showLoaderWithoutBackground()

        let dic1 = ["tracking_id":consignmentData[0].tracking_id , "booking_status": booking_status] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.BOOKINGSTATUSUPDATE
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverAppConfigureModel.self)
    }
    
    func scanCustomerQRcode(customer_code: String) {
        
          showLoaderWithoutBackground()
          
          let dic1 = ["customer_qr_code": customer_code] as [String : AnyObject]
          let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SCANCUSTOMERQRCODE
          ServiceManager.sharedInstance.delegate = self
          ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ScanCustomerQRcodeModel.self)
    }
}

extension QRCodeController: ApiResponseReceiver {
    func onSuccess<T>(_ response: T) where T : Mappable {
        hideLoaderWithoutBackground()

        if let responseData = response as? ConsignmentDataModel{
            let data:ConsignmentDataModel = responseData
            consignmentModel = data
            if consignmentModel.result == "1"
            {
                consignmentData = consignmentModel.data!
                let booking_status = consignmentData[0].booking_status!
                if booking_status == AppConstants.UserDefaultKeys.DRIVERASSIGNED{
                    updateBookingStatus(booking_status: AppConstants.UserDefaultKeys.DRIVERPICKEDUP)
                }
                else if booking_status == AppConstants.UserDefaultKeys.DRIVERPICKEDUP{
                    let alert = UIAlertController(title: "Alert", message:"This order is already picked up.", preferredStyle: UIAlertController.Style.alert)
                    let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
                    }
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Alert", message:consignmentModel.message, preferredStyle: UIAlertController.Style.alert)
                    let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
                    }
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                let alert = UIAlertController(title: "Alert", message:"This order is already picked up.", preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
                }
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        if let responseData = response as? ActivateSubscriptionModel{
            let data:ActivateSubscriptionModel = responseData
            if data.result == "1"
            {
                let path = Bundle.main.path(forResource: "scan_successful", ofType : "wav")!
                    let url = URL(fileURLWithPath : path)
                    do {
                        player = try AVAudioPlayer(contentsOf: url)
                        player!.play()
                    } catch {
                        print ("There is an issue in playing sound!")
                    }
            }
            else if data.result == "2"
            {
                let path = Bundle.main.path(forResource: "scan_fail", ofType : "wav")!
                    let url = URL(fileURLWithPath : path)
                    do {
                        player = try AVAudioPlayer(contentsOf: url)
                        player!.play()
                        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)){
                            print("device vibrated")
                        }
                    } catch {
                        print ("There is an issue in playing sound!")
                    }
            }
            self.loadScanningView()
        }
        
        if let responseData = response as? SuperDriverModel{
                let data: SuperDriverModel = responseData
                driverModel = data
                let alert = UIAlertController(title: "Alert", message:driverModel.message, preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
            }
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        if let responseData = response as? ScanCustomerQRcodeModel {
            let data: ScanCustomerQRcodeModel = responseData
            customerQRModel = data

            if customerQRModel.result == "1" {
              
                customerQRData = customerQRModel.data!
                AppConstants.OngoingTripTrackingID = customerQRData[0].tracking_id!
        
//                presentVC("UploadDropoffImagesController")
                self.dismissVC()
            }else{

                let alert = UIAlertController(title: "Alert", message:customerQRModel.message, preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.dismissVC()
                }
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        if let responseData = response as? DriverAppConfigureModel {
            let data: DriverAppConfigureModel = responseData
            configureModel = data
            if configureModel.result == "1" {
                let alert = UIAlertController(title: "Alert", message:configureModel.message, preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
                }
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(title: "Alert", message:configureModel.message, preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
                }
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        let alert = UIAlertController(title: "Error", message:errorResponse, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        let alert = UIAlertController(title: "Error", message:errorResponse, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in self.loadScanningView()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: SwiftQRScanner delegate methods

extension QRCodeController: QRScannerCodeDelegate{
    
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String, metadataType: String) {
        topView.isHidden = false
        hideLoaderWithoutBackground()
        if metadataType == ".qr"
        {
            if result.count > 38 {
                customerQRcode = result
                AppConstants.customerQRcodeForTrackRiderVC = result
                scanCustomerQRcode(customer_code: result)
            }
            else if AppConstants.isDropoffScanning == true{
                validateDropoffPackages(code: result)
            }
            else{
                receiveOrderDetailsByQRCode(code: result)
            }
        }
        if metadataType == ".code128" {
            receiveOrderDetailsByBarCode(code: result)
        }
    }
    
    func qrScannerDidFail(_ controller: UIViewController, error: String) {
        hideLoaderWithoutBackground()
        print("error:\(error)")
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
        hideLoaderWithoutBackground()
        self.dismissVC()
    }
}
