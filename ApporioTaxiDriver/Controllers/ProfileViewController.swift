//
//  ProfileViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ProfileViewController: BaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var newview: UIView!
    @IBOutlet weak var newviewheight: NSLayoutConstraint!
    var editviewvalue = 548.0
    var newheightvalue = 640.0
    var loadingtablecheckvalue = 0
    var selectcomissionid = ""

//    @IBOutlet weak var changelogoutmainview: NSLayoutConstraint!
    @IBOutlet weak var hiddenselectcountrylbl: UILabel!
    @IBOutlet weak var comissionbtnviewheight: NSLayoutConstraint!
    @IBOutlet weak var comissionview: UIView!
    @IBOutlet weak var selectareabtntext: UIButton!
    @IBOutlet weak var emergencyviewheight: NSLayoutConstraint!
    @IBOutlet weak var changelogoutmainviewheight: NSLayoutConstraint!
    @IBOutlet weak var emergencycontactlbl: UILabel!
    @IBOutlet weak var emergencycontactview: UIView!
    @IBOutlet weak var genderviewheight: NSLayoutConstraint!
    @IBOutlet weak var gendermainview: UIView!
    @IBOutlet weak var editphonebtn: UIButton!
    @IBOutlet weak var editfemaleimage: UIImageView!
    @IBOutlet weak var stackview: UIView!
    @IBOutlet weak var mainstackview: UIStackView!
    @IBOutlet weak var stackyourearningview: UIView!
    @IBOutlet weak var stacktotalearninhview: UIView!
    @IBOutlet weak var stacktotalrideview: UIView!
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var manageprofilelbl: UILabel!
    @IBOutlet weak var editlbl: UIButton!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var editcameraview: UIView!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblmobileno: UILabel!
    @IBOutlet weak var lbltotalrides: UILabel!
    @IBOutlet weak var totalrides: UILabel!
    @IBOutlet weak var lblyourratings: UILabel!
    @IBOutlet weak var yourratings: UILabel!
    @IBOutlet weak var lblyourearnings: UILabel!
    @IBOutlet weak var yourearnings: UILabel!
    @IBOutlet weak var managedriverimage: UIImageView!
    @IBOutlet weak var managedriverimagecamera: UIImageView!
    @IBOutlet weak var lblchangepwd: UILabel!
    @IBOutlet weak var lbllogout: UILabel!
    @IBOutlet weak var changelogoutmainview: UIView!
    @IBOutlet weak var managemainview: UIView!
    @IBOutlet weak var lblmanagebankdetails: UILabel!
    @IBOutlet weak var lblmanagehomeaddress: UILabel!
    @IBOutlet weak var lblmanagepersonaldocs: UILabel!
    @IBOutlet weak var editprofilemainview: UIView!
    @IBOutlet weak var editprofileinnerview: UIView!
    @IBOutlet weak var edityourprofilelbl: UILabel!
    @IBOutlet weak var editprofileimageview: UIImageView!
    @IBOutlet weak var editprofileimageviewcamera: UIImageView!
    @IBOutlet weak var yournamelbl: UILabel!
    @IBOutlet weak var nametxtfls: UITextField!
    @IBOutlet weak var editemaillbl: UILabel!
    @IBOutlet weak var editemailtxtfld: UITextField!
    @IBOutlet weak var phonelbl: UILabel!
    @IBOutlet weak var genderlbl: UILabel!
    @IBOutlet weak var editmalelbl: UIImageView!
    @IBOutlet weak var editfemalelbl: UILabel!
    @IBOutlet weak var cancelbtntext: UIButton!
    @IBOutlet weak var savebtntext: UIButton!
    @IBOutlet weak var malelbl: UILabel!
    @IBOutlet weak var yourratinglbl: UILabel!
    @IBOutlet weak var smokerView: UIView!
    @IBOutlet weak var smokerLabel: UILabel!
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var yesImage: UIImageView!
    @IBOutlet weak var noImage: UIImageView!
    @IBOutlet weak var smokerViewHeightConstraint: NSLayoutConstraint!
    //@IBOutlet weak var editInnerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ratingView: UIView!
    var emailValid = true
    @IBOutlet weak var permissionContainerView: UIView!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var allowUserTitleLabel: UILabel!
    @IBOutlet weak var allowToSmokeBtn: UIButton!
    @IBOutlet weak var emailVerificationButton: UIButton!
    @IBOutlet weak var phoneNoWithoutVeriContainerView: UIView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var phoneNumerTextField: UITextField!
    @IBOutlet weak var countryCodeHiddenView: UIView!
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var veriftinnerviewheight: NSLayoutConstraint!
    @IBOutlet weak var hiddenviewokbtntxt: UIButton!
    @IBOutlet weak var hiddenviewcancelbtntxt: UIButton!
    @IBOutlet weak var emailVerificationContainerView: UIView!
    @IBOutlet weak var subscriptionView: UIView!
    @IBOutlet weak var manageHomeAddressView: UIView!
    @IBOutlet weak var manageBankDetailView: UIView!
    @IBOutlet weak var bankDetailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var homeAddressHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var subscriptionHeightConstraint: NSLayoutConstraint!
    
    var checkedImage: UIImage = UIImage()
    var uncheckedImage: UIImage = UIImage()
    var checkGender: String = "1"
    var checkSmoker: String = "0"
    var imagearray: [Data] = []
    var imagestring: [String] = []
    var selectCountryCode = String((AppConstants.driverconfiguredata.data?.countries![0].phonecode)!)
    var selectCountryId = String((AppConstants.driverconfiguredata.data?.countries![0].id)!)
    var check1 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryCodeLabel.text = selectCountryCode
        selectareabtntext.setTitle("Select Subscription".localized, for: .normal)
        emergencycontactlbl.text = "Emergency Contacts".localized
        
        self.ratingView.isHidden = true
        hiddentableview.delegate = self
        hiddentableview.dataSource = self
        self.countryCodeHiddenView.isHidden = true
        AppConstants.checkphonenumber = 0
        checkBoxImageView.image = UIImage(named: "icons8-unchecked-checkbox-48") as UIImage?
//        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ProfileViewController.imageTapped(_:)))
//        editprofileimageview.isUserInteractionEnabled = true
//        editprofileimageviewcamera.isUserInteractionEnabled = true
//        editprofileimageview.addGestureRecognizer(tapGestureRecognizer)
//        editprofileimageviewcamera.addGestureRecognizer(tapGestureRecognizer)
        
         if UserDefaultUtility.retrieveBoolForKey(AppConstants.UserDefaultKeys.Taxi_Company){
            
            self.subscriptionView.isHidden = true
            self.subscriptionHeightConstraint.constant = 0.0
            comissionview.isHidden = true
            comissionbtnviewheight.constant = 0
            newheightvalue = newheightvalue - 50.0
            
         }else{
             
             //SUBSCRIPTION VIEW VISIBILITY
             //============================
            if AppConstants.driverconfiguredata.data?.generalConfig?.subscriptionPackage == true
            {
                self.subscriptionView.isHidden = false
                self.subscriptionHeightConstraint.constant = 40.0
            }
            else
            {
                self.subscriptionView.isHidden = true
                self.subscriptionHeightConstraint.constant = 0.0
            }
            
            if ((AppConstants.driverconfiguredata.data?.register?.driverCommissionChoice)!){
                comissionview.isHidden = false
                comissionbtnviewheight.constant = 50
            }
            else
            {
                comissionview.isHidden = true
                comissionbtnviewheight.constant = 0
                newheightvalue = newheightvalue - 50.0
            }
        }
        
        //HOME ADDRESS VIEW VISIBILITY
        //============================
//        if AppConstants.driverconfiguredata.data?.generalConfig?.homeAddress == true
//        {
//            self.manageHomeAddressView.isHidden = false
//            self.homeAddressHeightConstraint.constant = 40.0
//        }
//        else
//        {
//            self.manageHomeAddressView.isHidden = true
//            self.homeAddressHeightConstraint.constant = 0.0
//        }
        
        self.manageHomeAddressView.isHidden = false
        self.homeAddressHeightConstraint.constant = 40.0
        //BANK DETAILS VIEW VISIBILITY
        //============================
        
        self.manageBankDetailView.isHidden = false
        self.bankDetailHeightConstraint.constant = 40.0
        
        //GENDER VIEW VISIBILITY
        //======================
        genderviewheight.constant = 0
        gendermainview.isHidden = true
        newheightvalue = newheightvalue - 45.0
        
        if AppConstants.driverconfiguredata.data?.register?.gender == true
        {
            genderviewheight.constant = 45
            gendermainview.isHidden = false
        }
        else
        {
            genderviewheight.constant = 0
            gendermainview.isHidden = true
            newheightvalue = newheightvalue - 45.0
        }

        if AppConstants.driverconfiguredata.data?.register?.smoker == true
        {
            self.smokerView.isHidden = false
            self.smokerViewHeightConstraint.constant = 75.0
        }
        else
        {
            self.smokerView.isHidden = true
            self.smokerViewHeightConstraint.constant = 0.0
            // editviewvalue = editviewvalue - 90.0
            newheightvalue = newheightvalue - 75.0
            //   self.editInnerViewHeightConstraint.constant = 548.0 - 90.0
        }
        
        if (AppConstants.driverconfiguredata.data?.generalConfig!.emergencyContact)!
        {
            emergencycontactview.isHidden = false
            emergencyviewheight.constant = 40
            changelogoutmainviewheight.constant = 145
        }
        else
        {
            emergencycontactview.isHidden = true
            emergencyviewheight.constant = 0
            changelogoutmainviewheight.constant = 105
        }
        manageprofilelbl.text = "Manage Your Profile".localized
        editlbl.setTitle("EDIT".localized, for: .normal)
        editlbl.isEnabled=true
        editlbl.isHidden=false
        lbltotalrides.text = "Total Rides".localized
        lblyourratings.text = "Your Ratings".localized
        lblyourearnings.text = "Your Earnings".localized
        lblchangepwd.text = "Change Password".localized
        lbllogout.text = "Logout".localized
        lblmanagebankdetails.text = "Manage Bank Details".localized
        lblmanagehomeaddress.text = "Manage Home Address".localized
        lblmanagepersonaldocs.text = "Manage Your Documents".localized
        edityourprofilelbl.text = "Edit Your Profile".localized
        editemaillbl.text = "Email".localized
        phonelbl.text = "Phone".localized
        genderlbl.text = "Gender".localized
        yournamelbl.text = "First Name".localized
        lastNameLabel.text = "Last Name".localized
        malelbl.text = "Male".localized
        editfemalelbl.text = "Female".localized
        smokerLabel.text = "Smoker".localized
        yesLabel.text = "Yes".localized
        noLabel.text = "No".localized
        allowUserTitleLabel.text = "Allow user to smoke".localized
        cancelbtntext.setTitle("CANCEL".localized, for: .normal)
        savebtntext.setTitle("SAVE".localized, for: .normal)
        self.hiddenviewokbtntxt.setTitle("OK".localized, for: .normal)
        self.hiddenviewcancelbtntxt.setTitle("CANCEL".localized, for: .normal)
        
        editcameraview.layer.cornerRadius = editcameraview.frame.width/2
        editcameraview.layer.masksToBounds = true
        editcameraview.layer.borderWidth = 1
        editcameraview.layer.borderColor = UIColor.black.cgColor
        
        editprofileimageview.layer.cornerRadius = editprofileimageview.frame.width/2
        editprofileimageview.layer.masksToBounds = true
        
        managedriverimage.makeViewCircular()
        topview.edgeWithShadow(edge: 0)
        managemainview.edgeWithShadow(edge: 0)
        changelogoutmainview.edgeWithShadow(edge: 0)
        editprofilemainview.edgeWithShadow(edge: 0)
        
        stackview.edgeWithShadow(edge: 12.0)
        
//        newviewheight.constant = CGFloat(newheightvalue)
        
        checkedImage = UIImage(named: "radio-on-button")! as UIImage
        uncheckedImage = UIImage(named: "icons8-0-percent-filled-50")! as UIImage
        
//        maleimageview.image = uncheckedImage
//        femaleimageview.image = uncheckedImage
//
        editprofilemainview.isHidden = true
        
//        lblname.text = data1.data?.fullName
//        lblemail.text = data1.data?.email
//        lblmobileno.text = data1.data?.phoneNumber
//        totalrides.text = String((data1.data?.totalEarning?.totalRide)!)
//        yourratings.text = data1.data?.rating
//        yourearnings.text = data1.data?.totalEarning?.totalEarning
//        let newString = data1.data?.profileImage
//        AppConstants.downloadimage(imagename: newString!, imageview: managedriverimage, placeholderimage: "profileeee")
        
         let dic1 = [:] as [String : AnyObject]
        
         showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDETAILS
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverLoginModel.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       // let dic1 = [:] as [String : AnyObject]
        
        
       // showLoaderWithoutBackground()
        
//        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDETAILS
//        ServiceManager.sharedInstance.delegate = self
//        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverLoginModel.self)
        
        if let verificationDetail = AppConstants.driverconfiguredata.data?.register {
            if verificationDetail.emailVerification! == true {
                editemailtxtfld.isHidden = true
                emailVerificationButton.isHidden = false
                emailVerificationContainerView.isHidden = false
            } else {
                editemailtxtfld.isHidden = false
                emailVerificationButton.isHidden = true
                emailVerificationContainerView.isHidden = true
            }
            
            if verificationDetail.phoneVerification! == true {
                phoneNoWithoutVeriContainerView.isHidden = true
                editphonebtn.isHidden = false
            } else {
                phoneNoWithoutVeriContainerView.isHidden = false
                editphonebtn.isHidden = true
            }
        }
        
        if AppConstants.checkphonenumber == 1{
            if let verificationDetail = AppConstants.driverconfiguredata.data?.register {
                if verificationDetail.emailVerification! == true {
                    if !AppConstants.enterDriverEmailAddress.isEmpty {
                        emailVerificationButton.setTitle(AppConstants.enterDriverEmailAddress, for: .normal)
                    }
                }
                if verificationDetail.phoneVerification! == true {
                    if !AppConstants.enterdriverphonenumber.isEmpty {
                        editphonebtn.setTitle(AppConstants.enterdriverphonenumber, for: .normal)
                    }
                }
            }
            AppConstants.checkphonenumber = 0
            
        }else{
            
        }
    }
    
    func imageTapped()
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
    @IBAction func emergencycontactbtn_click(_ sender: Any) {
        
        self.presentVC("EmergencyContactListViewController")
        
    }
    
    @IBAction func onTapEmailVerificationBtn(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = ""
        verifyViewController.verifyMailOrPhone = .email
        self.present(verifyViewController, animated:true, completion:nil)
    }
    
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        
            
            imagearray.removeAll()
            imagestring.removeAll()
            
            editprofileimageview.image = pickedImage
            
            let imageData = editprofileimageview.image!.jpegData(compressionQuality: 0.5)
            
            imagearray.append(imageData!)
            imagestring.append("profile_image")
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func comissionbtn_click(_ sender: Any) {
        
        loadingtablecheckvalue = 1
        hiddenselectcountrylbl.text = "Select Subscription Package".localized
        countryCodeHiddenView.isHidden = false
        hiddentableview.reloadData()
        
    }
    
    @IBAction func yourratingbtn_click(_ sender: Any) {
        
        self.presentVC("DriverRatingViewController")
        
    }
    
    @IBAction func subscriptionBtnTapped(_ sender: Any)
    {
        self.presentVC("SubscriptionListViewController")
    }
    
    
    @IBAction func editprofileimagebtn_click(_ sender: Any) {
        
       self.imageTapped()
        
    }
    
    @IBAction func editprofilecamerabtn_click(_ sender: Any) {
        
         self.imageTapped()
        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func editbtn_click(_ sender: Any) {
        
        
        imagearray.removeAll()
        imagestring.removeAll()
        
        let imageData = editprofileimageview.image!.jpegData(compressionQuality: 0.5)
        
        imagearray.append(imageData!)
        imagestring.append("profile_image")
        
     editprofilemainview.isHidden = false
        
    }
    
    @IBAction func changepwdbtn(_ sender: Any) {
        self.presentVC("ChangePasswordViewController")
    }
    
    @IBAction func logoutbtn_click(_ sender: Any) {
       
        let refreshAlert = UIAlertController(title:  "Log Out".localized, message: "Are You Sure to Log Out ?".localized, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Confirm".localized , style: .default, handler: { (action: UIAlertAction!) in
        
            
            self.showLoaderWithoutBackground()
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERLOGOUT
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: DriverLogout.self)
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel".localized, style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    @IBAction func managebankdetails_btn(_ sender: Any) {
        self.presentVC("ManagebankDetailsViewController")
    }
    @IBAction func managehome_btn(_ sender: Any) {
        self.presentVC("SetDestinationViewController")
    }
    @IBAction func managedocs_btn(_ sender: Any) {
       // self.presentVC("ManagePersonalDocumentsViewController")
        
        self.presentVC("NewPersonalDocumentViewController")
    }
    @IBAction func phonebtn_click(_ sender: Any)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = ""
        verifyViewController.verifyMailOrPhone = .phone
        self.present(verifyViewController, animated:true, completion:nil)
    }
    
    @IBAction func malebtn_click(_ sender: Any) {
        
        checkGender = "1"
        self.editfemaleimage.image = uncheckedImage
        
        if self.editmalelbl.image == checkedImage{
            
        }else{
            self.editmalelbl.image = checkedImage
        }
    }
    
    @IBAction func femalebtn_click(_ sender: Any) {
        
      
        checkGender = "2"
        self.editmalelbl.image = uncheckedImage
        
        if self.editfemaleimage.image == checkedImage{
            
        }else{
            self.editfemaleimage.image = checkedImage
        }
    }
    
    @IBAction func yesTapped(_ sender: Any)
    {
        self.checkSmoker = "1"
        self.yesImage.image = checkedImage
        self.noImage.image = uncheckedImage
    }
    
    @IBAction func noTapped(_ sender: Any)
    {
        self.checkSmoker = "2"
        self.yesImage.image = uncheckedImage
        self.noImage.image = checkedImage
    }
    
    @IBAction func onTapAllowUserSmoking(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true
        {
            checkBoxImageView.image = UIImage(named: "icons8-checked-checkbox-48") as UIImage?
        }else{
            checkBoxImageView.image = UIImage(named: "icons8-unchecked-checkbox-48") as UIImage?
        }
    }
    
    @IBAction func hiddenviewokbtn_click(_ sender: Any) {
        countryCodeHiddenView.isHidden = true
    }
    @IBAction func hiddenviewcancelbtn_click(_ sender: Any) {
        countryCodeHiddenView.isHidden = true
    }
    
    @IBAction func countrycodebtn_click(_ sender: Any) {
        
        loadingtablecheckvalue = 0
        hiddenselectcountrylbl.text = "Select Country".localized
        self.countryCodeHiddenView.isHidden = false
        hiddentableview.reloadData()
        
    }
    
    @IBAction func savebtn_click(_ sender: Any) {
        
        self.showLoaderWithoutBackground()
        var phoneNo = ""
        var emailAddress = ""
        
        if let verificationDetail = AppConstants.driverconfiguredata.data?.register {
            if verificationDetail.emailVerification! == true {
                emailAddress = (emailVerificationButton.titleLabel?.text)!
            } else {
                emailAddress = editemailtxtfld.text!
            }
            
            if verificationDetail.phoneVerification! == true {
                phoneNo = AppConstants.enterdriverphonenumber
                
                if phoneNo == "" || phoneNo == "Enter Mobile".localized  {
                    self.showErrorAlert("", alertMessage: "Please Enter Mobile Number First".localized, VC: self)
                    return
                }
                
                
            } else {
                
                if (self.phoneNumerTextField.text?.count)! >= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)! &&  (self.phoneNumerTextField.text?.count)! <= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!{
                    
                    
                   phoneNo = countryCodeLabel.text! + phoneNumerTextField.text!
                    
                    
                }else{
                    
                    self.showErrorAlert("", alertMessage: "phone number should exist between ".localized + "\((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)!)" + " to ".localized + "\((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!)" + " digits.".localized, VC: self)
                    
                }
            }
        }
        
        
        if  (AppConstants.driverconfiguredata.data?.register?.email)! {
            if emailAddress.isEmail{
                self.emailValid=true
                
            }else{
                self.emailValid=false
            }
        }
    if self.emailValid {
    
        var dic = ["phone":phoneNo,
            "first_name": nametxtfls.text!,
            "last_name": lastNameTextField.text!,
            "email": emailAddress
            
            
            ] as [String : AnyObject]
        
        
        if ((AppConstants.driverconfiguredata.data?.register?.gender)!){
            dic["driver_gender"] = checkGender as AnyObject
        }

        
        if ((AppConstants.driverconfiguredata.data?.register?.driverCommissionChoice)!){
            dic["driver_commission_type"] = selectcomissionid as AnyObject
        }
        
        
        if AppConstants.driverconfiguredata.data?.register?.smoker == true
        {
            let allowSmoking = (allowToSmokeBtn.isSelected == true) ? "1":"0"
            dic["smoker_type"] = checkSmoker as AnyObject
            dic["allow_other_smoker"] =  allowSmoking as AnyObject
        }
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.EDITPROFILE
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicauthorization, imagesData: imagearray, imageParamName: imagestring, returningClass: EditProfileModels.self)
        
    }else{
        self.showErrorAlert("", alertMessage: "Please fill email properly.".localized, VC: self)
        
        }
        
        }
    
    
    @IBAction func cancelbtn_click(_ sender: Any) {
        self.editprofilemainview.isHidden = true
    }
}


  extension ProfileViewController: ApiResponseReceiver {
     
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverLogout{
            let data:DriverLogout = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
            
            if let responseData = response as? DriverLoginModel{
                
                let data:DriverLoginModel = responseData
                
                AppConstants.driverlogindata = data
                
                if data.result == "1" {
                    
                    hideLoaderWithoutBackground()
                    
                    if ((AppConstants.driverconfiguredata.data?.register?.driverCommissionChoice)!){
                        
                    
                    if data.data?.subscriptionComission == "1"{
                        
                        check1 = 0; selectareabtntext.setTitle(data.data?.driverComissionChoices![0].langData, for: .normal)
                        
                    }else if data.data?.subscriptionComission == "2"{
                        
                        check1 = 1; selectareabtntext.setTitle(data.data?.driverComissionChoices![1].langData, for: .normal)
                        
                    }else{
                        
                        selectareabtntext.setTitle("Select Subscription".localized, for: .normal)
                        
                    }
                        
                    }else{
                        
                    }
                    
                    lblname.text = (data.data?.firstName ?? "") + " " + (data.data?.lastName ?? "")

                    lblemail.text = data.data?.email ?? ""
                    lblmobileno.text = (data.data?.phoneCode ?? "") + (data.data?.phoneNumber ?? "")
                    countryCodeLabel.text =  (data.data?.phoneCode ?? "+91")
                    totalrides.text = String((data.data?.totalEarning?.totalRide ?? 0)!)
                    yourratings.text = data.data?.rating ?? ""
                    yourearnings.text = data.data?.totalEarning?.totalEarning ?? ""
                    let newString = data.data?.profileImage
                    AppConstants.downloadimage(imagename: newString!, imageview: managedriverimage, placeholderimage: "profileeee")
                    checkGender = String((data.data?.driverGender ?? 0)!)
                    
                    //CHECK FOR DRIVER IS SMOKER OR NOT
                    //=================================
                    checkSmoker = (data.data?.smokerType ?? "0")!
                    if checkSmoker == "1"
                    {
                        self.yesImage.image = checkedImage
                        self.noImage.image = uncheckedImage
                    }
                    else if checkSmoker == "2"
                    {
                        self.yesImage.image = uncheckedImage
                        self.noImage.image = checkedImage
                    }
                    else
                    {
                        self.yesImage.image = uncheckedImage
                        self.noImage.image = uncheckedImage
                    }
                    
                    if ((data.data?.allowOtherSmoker) != nil) {
                        if data.data?.allowOtherSmoker == "1" {
                            allowToSmokeBtn.isSelected = true
                            checkBoxImageView.image = UIImage(named: "icons8-checked-checkbox-48") as UIImage?
                        }
                    } else {
                        allowToSmokeBtn.isSelected = false
                        checkBoxImageView.image = UIImage(named: "icons8-unchecked-checkbox-48") as UIImage?
                    }
                    
                    //CHECK FOR DRIVER'S GENDER
                    //=========================
                    if checkGender == "1"{
                     editmalelbl.image = checkedImage
                        editfemaleimage.image = uncheckedImage
                    }else{
                        editmalelbl.image = uncheckedImage
                        editfemaleimage.image = checkedImage
                    }
                    AppConstants.downloadimage(imagename: newString!, imageview: editprofileimageview, placeholderimage: "profileeee")

                    nametxtfls.text = data.data?.firstName ?? ""
                    lastNameTextField.text = data.data?.lastName ?? ""
                    editemailtxtfld.text = data.data?.email ?? "Not Found"
                    emailVerificationButton.setTitle(data.data?.email ?? "Not Found" , for: .normal)
                    phoneNumerTextField.text = data.data?.phoneNumber ?? "Not Found"
                    editphonebtn.setTitle((data.data?.phoneCode ?? "") + (data.data?.phoneNumber ?? ""), for: .normal)
                    
                    AppConstants.enterdriverphonenumber = (data.data?.phoneCode ?? "") + (data.data?.phoneNumber ?? "")
                    
                    AppConstants.selectedhomeaddress = (data.data?.selectedAddress ?? "")!
                    print("AppConstants.selectedhomeaddress \(AppConstants.selectedhomeaddress)")
                    
//                    AppConstants.homelocationactivestats = String((data.data?.homeLocationActive)!)
                }else if data.result == "999" {
                        
                        UserDefaultUtility.removeAllUserDefault()
                        
                        self.presentVC("SplashViewController")
                }else{
                    hideLoaderWithoutBackground()
                    showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                }
            
}
        
        if let responseData = response as? EditProfileModels{
            let data:EditProfileModels = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                editprofilemainview.isHidden = true
                
                let dic1 = [:] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDETAILS
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverLoginModel.self)
               
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //personaldocsarray.count
        
        if loadingtablecheckvalue == 1{
            
            return (AppConstants.driverconfiguredata.data?.driverCommissionChoices?.count)!
            
        }else
        {
        return (AppConstants.driverconfiguredata.data?.countries?.count)!
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath) as! SelectCountryTableViewCell
        
        if loadingtablecheckvalue == 1{
            
            cell.countryname.text = AppConstants.driverconfiguredata.data?.driverCommissionChoices![indexPath.row].langData
            
        }else{
        
        cell.countryname.text = (AppConstants.driverconfiguredata.data?.countries![indexPath.row].phonecode)! + " " + (AppConstants.driverconfiguredata.data?.countries![indexPath.row].name)!
        //cell.countryimage
        }
        
        let tableheight = hiddentableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            veriftinnerviewheight.constant = tableheight + 100.0
            
        }else{
            
            veriftinnerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        if(check1 == indexPath.row)
        {
            
            cell.countryimage.image = UIImage(named: "radio-on-button")
            
        }else{
            cell.countryimage.image = UIImage(named: "icons8-0-percent-filled-50")
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hiddentableview.deselectRow(at: indexPath, animated: true)
        check1 = indexPath.row
        AppConstants.selectindexvalue4 = indexPath.row
        print(AppConstants.selectindexvalue4)
        hiddentableview.reloadData()
        countryCodeHiddenView.isHidden = true
        
        if loadingtablecheckvalue == 1{
            
        selectareabtntext.setTitle(AppConstants.driverconfiguredata.data?.driverCommissionChoices![check1].langData, for: .normal)
            
            selectcomissionid = String((AppConstants.driverconfiguredata.data?.driverCommissionChoices![check1].id)!)
            
            //String((AppConstants.driverconfiguredata.data?.driverCommissionChoices![check1].id))
            
        }else{
        
        selectCountryCode = (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].phonecode)!
        UserDefaultUtility.saveStringWithKey(selectCountryCode, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
            
            UserDefaultUtility.saveStringWithKey(String((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].distanceUnit)!), key: AppConstants.UserDefaultKeys.DISTANCE_UNIT)
            
        //        AppConstants.countryId = Int(selectCountryCode)!
        print(selectCountryCode)
        countryCodeLabel.text = selectCountryCode
        }
    }
}


extension ProfileViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let val = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if  textField == self.phoneNumerTextField{
            //Range.Lenth will greater than 0 if user is deleting text - Allow it to replce
            if string == ""
            {
                return true
            }
                //Check for max length including the spacers we added
            else if (val.count) > (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!
            {
                return false
            }
            else{
                return true
            }
        }
            
        else{
            return true
        }
//        return true
    }
}
