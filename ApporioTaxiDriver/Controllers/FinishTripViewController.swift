//
//  UploadDropoffImagesController.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 6/7/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import SkyFloatingLabelTextField
import CoreLocation
import JLStickerTextView

class FinishTripViewController: BaseViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    var consignmentModel : ConsignmentDataModel!
    var additionalInfoData : DriverTripAdditionalDropoffInfoData?

    var firstImage: Data?
    var secondImage: Data?
    var thirdImage: Data?
    var firstImageName: String?
    var secondImageName: String?
    var thirdImageName: String?
    
    @IBOutlet weak var dropoffItemListView: UIView!
    @IBOutlet weak var btnShipLabel: UIButton!
    @IBOutlet weak var btnRightSide: UIButton!
    @IBOutlet weak var imgMapview: UIImageView!
    var checkImageValue = 0
    var imagearray: [Data] = []
    var imagestring: [String] = []
    var reportIssueImageData: Data?
    let locationManager = CLLocationManager()
    @IBOutlet weak var btnScanCode: UIButton!
    @IBOutlet weak var btnVerifyPackages: UIButton!
    @IBOutlet weak var segmentOTPandQR: UISegmentedControl!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var reportIssueMainview: UIView!
    var isImageForReportIssueAvail: Bool? = false
    
    @IBOutlet weak var txtviewIssueDetails: UITextView!
    @IBOutlet weak var btnSubmitDetails: UIButton!
    var segmentControlValue: Int?
    @IBOutlet weak var btnTripIssues: UIButton!
    @IBOutlet weak var textEnterOTPvalue: SkyFloatingLabelTextField!
    @IBOutlet weak var textReceiverName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btnCallOperator: UIButton!
    @IBOutlet weak var lblImportantMsgTotal: UILabel!
    var totalImportantMsgs = 0
    @IBOutlet weak var imgProofOfDeliveryAttempt: UIImageView!
    var isDropoffImage: Bool?
    
    @IBOutlet weak var lblScannedNumber: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        scrollImagesView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 692.0)
    }
    
    @IBOutlet weak var scrollImagesView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AppConstants.imagearray.removeAll()
        AppConstants.imagestring.removeAll()
        self.locationManager.startUpdatingLocation()
//        generateMapImage()
        lblNote.text = "Note: OTP sent to receiver via message".localized
        segmentOTPandQR.selectedSegmentIndex = 0
        textReceiverName.text = AppConstants.receiverData.userName ?? ""
//        reportIssueMainview.isHidden = true
        segmentControlValue = 0
        lblImportantMsgTotal.text = "0"

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if (AppConstants.customerQRcodeForTrackRiderVC! != "")
        {
            segmentOTPandQR.selectedSegmentIndex = 1
            textEnterOTPvalue.text = AppConstants.customerQRcodeForTrackRiderVC
            textEnterOTPvalue.placeholder = "Enter QR code"
            lblNote.text = "Note: QR code sent to receiver via Message".localized
        }
        
        btnSubmitDetails.layer.cornerRadius = 3.0
        btnCallOperator.layer.cornerRadius = 3.0
//        if isDropoffImage == false
//        {
//            reportIssueMainview.isHidden = false
//        }
        
        let dic1 = ["booking_id": Int(AppConstants.bookingid) as AnyObject] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERADDITIONALDROPOFFINFO
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverTripAdditionalDropoffInfoModel.self)
    }
    
    @IBAction func btnImportantMsgClicked(_ sender: Any) {
        
        presentVC("ImportantUpdatesMessagesController")
    }
    
    
    @IBAction func calloperatorClicked(_ sender: Any) {
        if let url = URL(string: "telprompt://\(AppConstants.receiverData.userPhone ?? "345678")") {
            
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
        }
    }
    
    @IBAction func checkDropoffPackages(_ sender: Any) {
        presentVC("OrderDetailsViewController")
    }
    
    @IBAction func btnPhoneTapped(_ sender: Any) {
        
        if let url = URL(string: "telprompt://\(AppConstants.receiverData.userPhone ?? "345678")") {
            
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
        }
    }
    
    @IBAction func ImgShipLabelTapped(_ sender: Any) {
        checkImageValue = 1
        self.imageIconTapped()
        isDropoffImage = true
    }
    
    @IBAction func ImgRightTapped(_ sender: Any) {
        checkImageValue = 2
        self.imageIconTapped()
        isDropoffImage = true
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
            case 0:
            textEnterOTPvalue.text = ""
            textEnterOTPvalue.placeholder = "Enter OTP".localized
            lblNote.text = "Note: OTP sent to receiver via message".localized
            segmentControlValue = 0
            
            case 1:
            textEnterOTPvalue.text = ""
            textEnterOTPvalue.placeholder = "Enter QR code".localized
            lblNote.text = "Note: QR code sent to receiver via Message".localized
            segmentControlValue = 1
            presentVC("QRCodeController")
            
            default:
            textEnterOTPvalue.text = ""
            textEnterOTPvalue.placeholder = "Enter OTP".localized
            lblNote.text = "Note: Note: OTP sent to receiver via message".localized
            segmentControlValue = 0
        }
        AppConstants.customerQRcodeForTrackRiderVC = ""
    }
    
    func uploadImagesAndFinishTrip()
    {
        if textReceiverName.text == "" {
            showErrorAlert("Alert", alertMessage: "Please enter receiver name" , VC: self)
        }else if textEnterOTPvalue.text == ""{
            showErrorAlert("Alert", alertMessage: "Please enter OTP first" , VC: self)
        }else{
            
            showLoaderWithoutBackground()

            var dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                        "latitude": AppConstants.driverselectaddressLat as AnyObject,
                        "longitude": AppConstants.drivertselectaddressLng as AnyObject,
                        "accuracy": String(AppConstants.calculatedAccuracy),
                        "send_meter_value": AppConstants.meterreadingvalue,
                ] as [String : AnyObject]
                
                if segmentOTPandQR.selectedSegmentIndex == 0
                {
                    dic1["receiver_otp"] = textEnterOTPvalue.text! as AnyObject
                    dic1["validation_type"] = "0" as AnyObject
                }
                else
                {
                    dic1["customer_qrcode"] = textEnterOTPvalue.text! as AnyObject
                    dic1["validation_type"] = "1" as AnyObject
                }
                dic1["receiver_name"] = textReceiverName.text! as AnyObject
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERENDRIDE

                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: AppConstants.imagearray, imageParamName:AppConstants.imagestring, returningClass: DriverEndRideModel.self)
        }
    }
    
    @IBAction func btnSelectDropoffImageSelected(_ sender: Any) {
        //method to upload image for proof of delivery attempt while reporting issue.
        
        let alertView = UIAlertController(title: "Select Option".localized, message: "", preferredStyle: .alert)
        let Camerabutton = UIAlertAction(title: "Camera".localized, style: .default, handler: { (alert) in

            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()

                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        let Gallerybutton = UIAlertAction(title: "Gallery".localized, style: .default, handler: { (alert) in

            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum){
                print("Button capture")
                let imagePicker = UIImagePickerController()

                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
                imagePicker.allowsEditing = false

                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel".localized,
                style: .cancel, handler: nil)
        alertView.addAction(Camerabutton)
        alertView.addAction(Gallerybutton)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)        
    }
    
    
    @IBAction func reportIssueCancelBtnClicked(_ sender: Any) {
        reportIssueMainview.isHidden = true
        txtviewIssueDetails.text = ""
        imgProofOfDeliveryAttempt.image = UIImage(named: "house_placeholder")
    }
    
    @IBAction func reportIssueSubmitBtnClicked(_ sender: Any) {
        
        if (txtviewIssueDetails.text == "" || txtviewIssueDetails.text.count < 15)
        {
            showErrorAlert("Alert", alertMessage: "Please enter enough details", VC: self)
        }
        else if let imageData: Data = reportIssueImageData
        {
            showLoaderWithoutBackground()
            let dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                        "message": txtviewIssueDetails.text!,
                ] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERREPORTTRIPENDISSUE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithSingleImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imageData:imageData, imageParamName: "drop_images", returningClass: ConsignmentDataModel.self)
        }
        else
        {
            showErrorAlert("Alert", alertMessage: "Please upload drop location image", VC: self)
        }
    }
    
    
    func addTextLayerToImageview(view: UIButton){
        let textLayer = CATextLayer()
        let firstpoint = CGPoint(x: 10, y: view.frame.size.height - 100)
        let rect1 = CGRect(origin: firstpoint, size: CGSize(width: view.frame.size.width-20, height: 80))
        
        let locationText = "location (\(AppConstants.Lat),\(AppConstants.Lng))"
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let date = Date()
        let dateText = dateFormatter.string(from: date)
        
        textLayer.string = locationText + " " + dateText
        textLayer.frame = rect1
        
        let fontName: CFString = "Noteworthy-Light" as CFString
        textLayer.font = CTFontCreateWithName(fontName, 40, nil)
        
        textLayer.foregroundColor = UIColor.darkGray.cgColor
        textLayer.isWrapped = true
        textLayer.alignmentMode = CATextLayerAlignmentMode.left
        textLayer.contentsScale = UIScreen.main.scale
//        view.addSublayer(textLayer)
    }
    
    func textValueForDropoffImage() -> String
    {
        let locationText = "location (\(AppConstants.Lat),\(AppConstants.Lng))"
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let date = Date()
        let dateText = dateFormatter.string(from: date)
        
        let output_string = locationText + " " + dateText
        return output_string
    }
    
    func generateMapImage()
    {
        let imageUrl = "https://maps.googleapis.com/maps/api/staticmap?center=\(AppConstants.Lat),\(AppConstants.Lng)&zoom=20&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C\(AppConstants.Lat),\(AppConstants.Lng)&key=\(AppConstants.KeyName.GoogleMapKey)"
        
        let url12 = removeSpecialCharsFromString(imageUrl)
        AppConstants.downloadimage(imagename: url12, imageview: imgMapview, placeholderimage: "mandy")
//        if let image = imgMapview.image {
//            imagearray.append(image.jpegData(compressionQuality: 1.0)!)
//            imagestring.append("dropOff_mapview")
//        }
    }
    
    func textToImage(drawTextinImage image: UIImage) -> UIImage {
        let textColor = UIColor.white
        let backColor = UIColor.black
        let textFont = UIFont(name: "Helvetica Bold", size: 100)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.backgroundColor: backColor
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let locationText = "location (\(AppConstants.Lat),\(AppConstants.Lng))"
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let date = Date()
        let dateText = dateFormatter.string(from: date)
        
        let firstpoint = CGPoint(x: 10, y: image.size.height - 400)
        let secondpoint = CGPoint(x: 10, y: image.size.height - 200)
        let rect1 = CGRect(origin: firstpoint, size: CGSize(width: image.size.width, height: 150))
        locationText.draw(in: rect1, withAttributes: textFontAttributes)
        let rect2 = CGRect(origin: secondpoint, size: CGSize(width: image.size.width, height: 150))
        dateText.draw(in: rect2, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    
    @IBAction func btnSaveImagesTapped(_ sender: Any)
    {
        if firstImage != nil {
            imagearray.append(firstImage!)
            imagestring.append(firstImageName!) }
        
        if secondImage != nil {
            imagearray.append(secondImage!)
            imagestring.append(secondImageName!) }
        
        AppConstants.imagearray = imagearray
        AppConstants.imagestring = imagestring
        
        uploadImagesAndFinishTrip()
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func btnScanCodeTapped(_ sender: Any) {
        AppConstants.isDropoffScanning = true
        presentVC("QRCodeController")
    }
    
    @IBAction func btnTripIssueClicked(_ sender: Any) {
        
        reportIssueMainview.isHidden = false
        isDropoffImage = false
    }
    
    @objc func imageIconTapped()
    {
        let alertView = UIAlertController(title: "Select Option".localized, message: "", preferredStyle: .alert)
        let Camerabutton = UIAlertAction(title: "Camera".localized, style: .default, handler: { (alert) in

            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        let Gallerybutton = UIAlertAction(title: "Gallery".localized, style: .default, handler: { (alert) in

            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum){
                print("Button capture")
                let imagePicker = UIImagePickerController()

                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
                imagePicker.allowsEditing = false

                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel".localized,
                style: .cancel, handler: nil)
        alertView.addAction(Camerabutton)
        alertView.addAction(Gallerybutton)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
         func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        
            if isDropoffImage == true
            {
                if self.checkImageValue == 1{
                    
                    self.btnShipLabel.layer.cornerRadius = 35.0
//                    self.btnShipLabel.setImage(pickedImage, for: .normal)

//                    DispatchQueue.global(qos: .userInitiated).async {
//
//                        DispatchQueue.main.async {
//                            self.imgviewFardistance.image = pickedImage
//                            self.imgviewFardistance.addLabel(text:self.textValueForDropoffImage())
//                            self.firstImage = self.imgviewFardistance.image!.jpegData(compressionQuality: 0.5)
////                            self.firstImageName = "dropOff_image1"
//                            print("first image \(self.firstImage)")
//                        }
//                    }
                    
                    var image = UIImage()

                    DispatchQueue.global(qos: .userInitiated).async {
                        
                        image = self.textToImage(drawTextinImage: pickedImage)
                        
                        DispatchQueue.main.async {
                            self.firstImage = image.jpegData(compressionQuality: 0.05)
                            self.btnShipLabel.setImage(image, for: .normal)
                            print("image 1 \(String(describing: self.firstImage))")
                            self.firstImageName = "dropOff_image1"
                        }
                    }
                }
                
                else if self.checkImageValue == 2{
                    self.btnRightSide.layer.cornerRadius = 35.0
                    var image = UIImage()

                    DispatchQueue.global(qos: .userInitiated).async {
                        image = self.textToImage(drawTextinImage: pickedImage)

                        DispatchQueue.main.async {
                            self.btnRightSide.setImage(image, for: .normal)
                            self.secondImage = image.jpegData(compressionQuality: 0.05)
                            print("image 2 \(String(describing: self.secondImage))")
                            self.secondImageName = "dropOff_image2"
                        }
                    }
                }
            }
            else
            {
                DispatchQueue.global(qos: .userInitiated).async {
                    let image = self.textToImage(drawTextinImage: pickedImage)

                    DispatchQueue.main.async {
                        self.imgProofOfDeliveryAttempt.image = image
                        self.isImageForReportIssueAvail = true
                        self.reportIssueImageData = image.jpegData(compressionQuality: 0.2)
                    }
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func removeSpecialCharsFromString(_ text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_@/%?//&[]")
        return String(text.filter {okayChars.contains($0) })
    }
}

extension FinishTripViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        hideLoaderWithoutBackground()

        if let responseData = response as? DriverEndRideModel{
            let data:DriverEndRideModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                self.presentVC("OnlineViewController")
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? ConsignmentDataModel{
            
            if (responseData.result == "1") {
                
                hideLoaderWithoutBackground()
                self.presentVC("OnlineViewController")
                
            }else if responseData.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: responseData.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverTripAdditionalDropoffInfoModel{
            
            if (responseData.result == "1") {
                if let dropInfoData = responseData.data
                {
                    additionalInfoData = dropInfoData
                    AppConstants.additionalDropoffInfo = dropInfoData
                    
                    if let operation_message = additionalInfoData?.operation_message{
                        if operation_message != ""{
                            totalImportantMsgs += 1
                        }
                    }
                    
                    if let customer_message = additionalInfoData?.customer_message{
                        
                        if customer_message != ""
                        {
                            totalImportantMsgs += 1
                        }
                    }
                    
                    if let corporate_information = additionalInfoData?.corporate_information{
                        if corporate_information != ""
                        {
                            totalImportantMsgs += 1
                        }
                    }
                    
                    lblImportantMsgTotal.text = "\(totalImportantMsgs)"
                    if totalImportantMsgs > 0 {
                        showErrorAlert("Alert", alertMessage: "You have \(totalImportantMsgs) notifications for dropoff order. Please check on top right corner.", VC: self)
                    }
                    
                    
                    
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


