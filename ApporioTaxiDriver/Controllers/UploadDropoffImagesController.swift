//
//  UploadDropoffImagesController.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 6/7/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class UploadDropoffImagesController: BaseViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    var consignmentModel : ConsignmentDataModel!

    @IBAction func ImgShipLabelTapped(_ sender: Any) {
        checkImageValue = 1
        self.imageIconTapped()
    }
    @IBAction func ImgRightTapped(_ sender: Any) {
        checkImageValue = 2
        self.imageIconTapped()
    }
    
    var firstImage: Data?
    var secondImage: Data?
    var thirdImage: Data?
    var firstImageName: String?
    var secondImageName: String?
    var thirdImageName: String?
    
    @IBOutlet weak var btnShipLabel: UIButton!
    @IBOutlet weak var btnRightSide: UIButton!
    @IBOutlet weak var imgMapview: UIImageView!
    var checkImageValue = 0
    var imagearray: [Data] = []
    var imagestring: [String] = []
    let locationManager = CLLocationManager()
    var dropoffLatitude = ""
    var dropoffLongitude = ""

    override func viewDidAppear(_ animated: Bool) {
        scrollImagesView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 550.0)
    }
    
    @IBOutlet weak var scrollImagesView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.startUpdatingLocation()
        generateMapImage()
    }
    
    func uploadImagesAndFinishTrip()
    {
        showLoaderWithoutBackground()

        let dic1 = ["tracking_id":AppConstants.OngoingTripTrackingID , "booking_status": "Complete"] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.BOOKINGSTATUSUPDATE
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: imagearray, imageParamName: imagestring, returningClass: ConsignmentDataModel.self)
    }
    
    func generateMapImage()
    {
        let imageUrl = "https://maps.googleapis.com/maps/api/staticmap?center=\(dropoffLatitude),\(dropoffLongitude)&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C\(dropoffLatitude),\(dropoffLongitude)&key=\(AppConstants.KeyName.GoogleMapKey)"
        
        let url12 = removeSpecialCharsFromString(imageUrl)
        AppConstants.downloadimage(imagename: url12, imageview: imgMapview, placeholderimage: "mandy")
        if let image = imgMapview.image {
            imagearray.append(image.jpegData(compressionQuality: 1.0)!)
            imagestring.append("dropOff_mapview")
        }
    }
    
    @IBAction func btnSaveImagesTapped(_ sender: Any)
    {
        if firstImage != nil {
            imagearray.append(firstImage!)
            imagestring.append(firstImageName!) }
        
        if secondImage != nil {
            imagearray.append(secondImage!)
            imagestring.append(secondImageName!) }
        
        if thirdImage != nil {
            imagearray.append(thirdImage!)
            imagestring.append(thirdImageName!) }
        
        if AppConstants.UploadDropoffImagesFromVC == "QRCodeController"
        {
            uploadImagesAndFinishTrip()
        }
        else if AppConstants.UploadDropoffImagesFromVC == "TrackRideViewController"
        {
            AppConstants.imagearray = imagearray
            AppConstants.imagestring = imagestring
            
            print("AppConstants.imagearray \(AppConstants.imagearray)")
            print("AppConstants.imagestring \(AppConstants.imagestring)")

            dismissVC()
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismissVC()
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
                        
            if self.checkImageValue == 1{
                
                self.btnShipLabel.layer.cornerRadius = 35.0
                self.btnShipLabel.setImage(pickedImage, for: .normal)
                //self.imageSelected = true
                firstImage = self.btnShipLabel.image(for:.normal)!.jpegData(compressionQuality: 1.0)
                firstImageName = "dropOff_image1"
            }
            else if self.checkImageValue == 2{
                self.btnRightSide.layer.cornerRadius = 35.0
                self.btnRightSide.setImage(pickedImage, for: .normal)
                //self.imageSelected = true
                secondImage = self.btnRightSide.image(for:.normal)!.jpegData(compressionQuality: 1.0)
                secondImageName = "dropOff_image2"
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

extension UploadDropoffImagesController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        hideLoaderWithoutBackground()

        if let responseData = response as? ConsignmentDataModel{
            let data:ConsignmentDataModel = responseData
            consignmentModel = data
            
            AppConstants.OngoingTripTrackingID = ""
            let alert = UIAlertController(title: "Success", message:"The trip has been completed", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in
                self.presentVC("OnlineViewController")
            }
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
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
