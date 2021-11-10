//
//  UploadPhotoViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 11/09/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class UploadPhotoViewController: BaseViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var datelabeltext: UILabel!
    
    var imagearray: [Data] = []
    var imagestring: [String] = []
    
    //var documentuploaddata: DocumentUploadModel!
     @IBOutlet weak var dateview: UIView!
     var driverid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.DRIVER_ID)
    
    @IBOutlet weak var uploadagoodqualitytextlabel: UILabel!
    
    
    @IBOutlet weak var enterexpirydatetextlabel: UILabel!
    @IBOutlet weak var camerabtntext: UIButton!
    
    @IBOutlet weak var gallerybtntext: UIButton!
    
    @IBOutlet weak var submitbtntext: UIButton!
    @IBOutlet weak var innerview: UIView!
    
    @IBOutlet weak var selectimageview: UIImageView!
    
     var viewcontrollerself : UIViewController!
    
     var comefrompersonal = "0"
    
    //var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadagoodqualitytextlabel.text = "Upload a good quality of your document in order to submit your application".localized
        camerabtntext.setTitle("Camera".localized, for: UIControl.State.normal)
        gallerybtntext.setTitle("Gallery".localized, for: UIControl.State.normal)
        enterexpirydatetextlabel.text = "Enter Expiry date of your document".localized
        submitbtntext.setTitle("Submit".localized, for: UIControl.State.normal)
        
        AppConstants.documentimageselect = 0
        view.backgroundColor = UIColor.clear
        view.isOpaque = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back_btn_click(_ sender: Any) {
        self.dismissVC()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        
        if AppConstants.documentstatus == "1"
        {
            dateview.isHidden = false
            enterexpirydatetextlabel.isHidden = false
            
        }
            
        else
        {
            dateview.isHidden = true
            enterexpirydatetextlabel.isHidden = true
            
        }
        

         if AppConstants.movefromcalender == 4{
            datelabeltext.text = AppConstants.documentdateselected
           // GlobalVariables.movefromcalender = 0
        }
    }


    @IBAction func Select_photo_gallery_btn(_ sender: Any) {


        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum){
            print("Button capture")
            let imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            imagePicker.allowsEditing = false

            self.present(imagePicker, animated: true, completion: nil)
        }




    }

    @IBAction func Capturefromcamera_btn(_ sender: Any) {


        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }




    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        
        imagestring.removeAll()
        imagearray.removeAll()
        
         selectimageview.image = image
          AppConstants.documentimageselect = 1
        AppConstants.dynamicdocumentimage = self.RBResizeImage(image, targetSize: CGSize(width: 500,height: 500))

        let imageData = selectimageview.image!.jpegData(compressionQuality: 0.5)
        imagearray.append(imageData!)
        imagestring.append("document_image")

        }
        //  GlobalVariables.meterimage = image
        self.dismiss(animated: true, completion: nil)


        if AppConstants.documentstatus == "1"
        {
            dateview.isHidden = false
            enterexpirydatetextlabel.isHidden = false
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
            next.checkmovefrom = "uploaddocument"
            AppConstants.movefromcalender = 4
            self.present(next, animated: true, completion: nil)
            
            
        }
        else
        {
            
            dateview.isHidden = true
            enterexpirydatetextlabel.isHidden = true
            
        }
    }


    @IBAction func selectdatebtn_click(_ sender: Any) {


        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkmovefrom = "uploaddocument"
        AppConstants.movefromcalender = 4
        self.present(next, animated: true, completion: nil)

    }


    @IBAction func submitbtn_click(_ sender: Any) {
        
        if self.comefrompersonal == "1"
        {
            
            if AppConstants.documentstatus == "1"
            {
                
                
                if   AppConstants.documentimageselect == 0 {
                    let alert = UIAlertController(title: "Upload Documadents".localized, message: "Please upload document image first ".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else if AppConstants.documentdateselected == "DD MM YYYY" {
                    let alert = UIAlertController(title:  "Upload Documents".localized, message: "Please enter document Expiration Date".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else{
                    AppConstants.movefromcalender = 0
                    
                    
                    let dic = ["driver": self.driverid,
                               "expire_date": AppConstants.documentdateselected as AnyObject,
                               "document": AppConstants.selecteddocumentId,
                               "type": AppConstants.managedocumenttype
                        
                        ] as [String : AnyObject]
                    
                    showLoaderWithoutBackground()
                    
                    
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERADDDOCUMENT
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, imagesData: imagearray, imageParamName: imagestring, returningClass: AddDocumentModel.self)
                }
            }else{
                
                if   AppConstants.documentimageselect == 0 {
                    let alert = UIAlertController(title: "Upload Documents".localized, message: "Please upload document image first ".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else{
                    AppConstants.movefromcalender = 0
                    
                    
                    let dic = ["driver": self.driverid,
                              "document": AppConstants.selecteddocumentId,
                               "type": AppConstants.managedocumenttype
                        
                        ] as [String : AnyObject]
                    
                    showLoaderWithoutBackground()
                    
                    
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERADDDOCUMENT
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, imagesData: imagearray, imageParamName: imagestring, returningClass: AddDocumentModel.self)
                    
                }
                
                
                
            }
            
        }else{
            
            
            if AppConstants.documentstatus == "1"
            {
                
                
                if   AppConstants.documentimageselect == 0 {
                    let alert = UIAlertController(title: "Upload Documents".localized, message: "Please upload document image first ".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else if AppConstants.documentdateselected == "DD MM YYYY" {
                    let alert = UIAlertController(title:  "Upload Documents".localized, message: "Please enter document Expiration Date".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else{
                    AppConstants.movefromcalender = 0
                    
                    
                    let dic = ["driver": self.driverid,
                               "expire_date": AppConstants.documentdateselected as AnyObject,
                               "document": AppConstants.selecteddocumentId,
                               "driver_vehicle_id":AppConstants.drivervehicleid,
                               "type": AppConstants.managedocumenttype
                        
                        
                        ] as [String : AnyObject]
                    
                    showLoaderWithoutBackground()
                    
                    
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERVEHICLEADDDOCUMENT
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, imagesData: imagearray, imageParamName: imagestring, returningClass: AddDocumentModel.self)
                }
            }else{
                
                if   AppConstants.documentimageselect == 0 {
                    let alert = UIAlertController(title: "Upload Documents".localized, message: "Please upload document image first ".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else{
                    AppConstants.movefromcalender = 0
                    
                    
                    let dic = ["driver": self.driverid,
                               "document": AppConstants.selecteddocumentId,
                               "driver_vehicle_id":AppConstants.drivervehicleid,
                               "type": AppConstants.managedocumenttype
                        
                        ] as [String : AnyObject]
                    
                    showLoaderWithoutBackground()
                    
                    
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERVEHICLEADDDOCUMENT
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, imagesData: imagearray, imageParamName: imagestring, returningClass: AddDocumentModel.self)
                    
                }
                
                
                
            }
            
        }
        
    }
    
    
    
    
}


    



extension UploadPhotoViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
       
        
        if let responseData = response as? AddDocumentModel{
            let data:AddDocumentModel = responseData
            
            //vehiclemodeldata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                //hiddenview.isHidden = false
                AppConstants.documentdateselected = "DD MM YYYY"
                  comefrompersonal = "0"
                AppConstants.dynamicdocumentimage = UIImage()
                self.dismissVC()
                self.viewcontrollerself.viewWillAppear(true)
              
                
            }else if
                data.result == "999"{
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
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




extension UploadPhotoViewController
{


    func RBResizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        let heightInPoints = newImage?.size.height
        let heightInPixels = heightInPoints! * (newImage?.scale)!
        print(heightInPixels)

        let widthInPoints = newImage?.size.width
        let widthInPixels = widthInPoints! * (newImage?.scale)!
        print(widthInPixels)


        return newImage!
    }
}

