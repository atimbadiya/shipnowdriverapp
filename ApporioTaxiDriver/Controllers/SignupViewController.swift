//
//  SignupViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper

class SignupViewController: BaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    // var playerid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.PLAYER_ID)
    
    @IBOutlet weak var enterrefercodetext: UITextField!
    
    
    @IBOutlet weak var selectcountrytoptextlbl: UILabel!
    
    @IBOutlet weak var hiddencancelbtntextlbl: UIButton!
    
    @IBOutlet weak var hiddenokbtntextlbl: UIButton!
    
    
    
    @IBOutlet weak var entercpfnumber: SkyFloatingLabelTextField!
    
    @IBOutlet weak var allowusertosmokevaluetextlbl: UILabel!
    @IBOutlet weak var comissionview: UIView!
    @IBOutlet weak var selectedcomissionbtntext: UIButton!
    
    //MARK:- Properties
    //===========
    var selectcommisiontype = ""
    var selectareacommissionvalue = 0
    var isChecked: Bool = false
    var checkedImage: UIImage = UIImage()
    var uncheckedImage: UIImage = UIImage()
    var checkboxvalue: Int = 0
    var emailValid = true
    var checkGender: String = "1"
    var checkSmoker: String = "0"
    var selectCountry: String = ""
    var check = 0
    var selectindexvalue = 0
    var selectarea = ""
    var imagearray: [Data] = []
    var imagestring: [String] = []
    var driverprofileimg: UIImage = UIImage()
    var selectareaid: Int = 0
    var reflectScreenData: DriverAppConfigureRegister?
    var smokeacceptcheckboxvalue = "0"
    var termsMarkValue = "0"
    var countryId = ""
    var selectCountryCode = String((AppConstants.driverconfiguredata.data?.countries![0].phonecode)!)
     var selectCountryID = String((AppConstants.driverconfiguredata.data?.countries![0].id)!)
    var check1 = 0
    
    //MARK:- IBOUTLETS
    //===========
    @IBOutlet weak var cameraview: UIView!
    @IBOutlet weak var continuebtnview: UIView!
    @IBOutlet weak var innerviewheight: NSLayoutConstraint!
    @IBOutlet weak var registertextlabel: UILabel!
    @IBOutlet weak var backimageview: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableheader: UIView!
    @IBOutlet weak var profileimage: UIView!
    @IBOutlet weak var chooseimage: UIImageView!
    @IBOutlet weak var enteremailtxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var enterfullnametxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var enterLastNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var enterphonebtn: UIButton!
    @IBOutlet weak var enterpwdtxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var genderlabel: UILabel!
    @IBOutlet weak var malelabel: UILabel!
    @IBOutlet weak var femalelabel: UILabel!
    @IBOutlet weak var selectareabtn: UIButton!
    @IBOutlet weak var continuebtntext: UIButton!
    @IBOutlet weak var malebutton: UIButton!
    @IBOutlet weak var femalebutton: UIButton!
    @IBOutlet weak var maleimageview: UIImageView!
    @IBOutlet weak var femaleimageview: UIImageView!
    @IBOutlet weak var profileimageimgview: UIImageView!
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var innerview: UIView!
    @IBOutlet weak var selectservicelbl: UILabel!
    @IBOutlet weak var selectservicetableview: UITableView!
    @IBOutlet weak var phoneNumberContainerView: UIView!
    @IBOutlet weak var genderContainerView: UIView!
    @IBOutlet weak var selectAreaContainerView: UIView!
    @IBOutlet weak var smokerContainerView: UIView!
    @IBOutlet weak var smokerTitleLabel: UILabel!
    @IBOutlet weak var yesSmokerLabel: UILabel!
    @IBOutlet weak var noSmokerLabel: UILabel!
    @IBOutlet weak var yesSmokerImageView: UIImageView!
    @IBOutlet weak var noSmokerImageView: UIImageView!
    @IBOutlet weak var termsConditionView: UIView!
    @IBOutlet weak var termsMarkImage: UIImageView!
    @IBOutlet weak var termsConditionLabel: UILabel!
    @IBOutlet weak var enterPhoneWithoutVerTexField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailVerificationBtn: UIButton!
    @IBOutlet weak var emailverificationContainerView: UIView!
    @IBOutlet weak var phoneWithoutVerificationContainerView: UIView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var selectCountryCodeBtn: UIButton!
    @IBOutlet weak var checkboximageview: UIImageView!
    @IBOutlet weak var countryCodeHiddenView: UIView!
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var veriftinnerviewheight: NSLayoutConstraint!
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    
    //MARK:- UIVIEWLIFECYCLE
    //===========
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryCodeLabel.text = selectCountryCode
        
        hiddentableview.delegate = self
        hiddentableview.dataSource = self
        
         UserDefaultUtility.saveStringWithKey(selectCountryID, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
        
        UserDefaultUtility.saveStringWithKey(String((AppConstants.driverconfiguredata.data?.countries![0].distanceUnit)!), key: AppConstants.UserDefaultKeys.DISTANCE_UNIT)
        
        
        entercpfnumber.delegate = self
        
        checkboximageview.image = UIImage(named: "icons8-unchecked-checkbox-48")
        smokeacceptcheckboxvalue = "0"
        allowusertosmokevaluetextlbl.text = "Allow user to smoke".localized
        
     self.termsConditionLabel.text = "Terms And Condition".localized
     registertextlabel.text = "Register".localized
     enterfullnametxtfld.placeholder = "Enter First Name".localized
     enterLastNameTextField.placeholder = "Enter Last Name".localized
     enteremailtxtfld.placeholder = "Enter Email".localized
        emailVerificationBtn.setTitle("Enter Email".localized, for: .normal)
        enterPhoneWithoutVerTexField.placeholder = "Enter Mobile".localized
     enterphonebtn.setTitle("Enter Mobile".localized, for: .normal)
     enterpwdtxtfld.placeholder = "Enter Password".localized
    confirmPasswordTextField.placeholder = "Confirm Password".localized
     genderlabel.text = "Gender".localized
     malelabel.text = "Male".localized
     femalelabel.text = "Female".localized
    smokerTitleLabel.text = "Smoker".localized
    yesSmokerLabel.text = "Yes".localized
    noSmokerLabel.text = "No".localized
     selectareabtn.setTitle("Select Area".localized, for: .normal)
     continuebtntext.setTitle("Continue".localized, for: .normal)
        selectservicelbl.text = "Select City".localized
        selectcountrytoptextlbl.text = "Select Country".localized
        hiddenokbtntextlbl.setTitle("Ok".localized, for: .normal)
        hiddencancelbtntextlbl.setTitle("Cancel".localized, for: .normal)
        selectedcomissionbtntext.setTitle("Select type of Model".localized, for: .normal)
        
        hiddenview.isHidden = true
        countryCodeHiddenView.isHidden = true
        checkedImage = UIImage(named: "radio-on-button")! as UIImage
        uncheckedImage = UIImage(named: "icons8-0-percent-filled-50")! as UIImage
        termsMarkImage.image = UIImage(named: "icons8-unchecked-checkbox-48")
        maleimageview.image = uncheckedImage
        femaleimageview.image = uncheckedImage
        
        noSmokerImageView.image = uncheckedImage
        yesSmokerImageView.image = uncheckedImage
        
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.referralcodemandatory == true{
            enterrefercodetext.placeholder = "Enter Referral Code".localized
            
        }else{
            
            enterrefercodetext.placeholder = "Enter Referral Code(if any)".localized
            
        }
        
        
        if (AppConstants.driverconfiguredata.data?.generalConfig!.drivercpfnumberenable)!{
            
            
            entercpfnumber.isHidden = false
            
        }else{
            
             entercpfnumber.isHidden = true
        }
        
        enterfullnametxtfld.selectedTitleColor = UIColor.appDarkThemeColor()
       // enterfullnametxtfld.selectedLineColor = UIColor.clear
        
        enteremailtxtfld.selectedTitleColor = UIColor.appDarkThemeColor()
      //  enteremailtxtfld.selectedLineColor = UIColor.clear
        
        enterpwdtxtfld.selectedTitleColor = UIColor.appDarkThemeColor()
        confirmPasswordTextField.selectedTitleColor = UIColor.appDarkThemeColor()
      //  enterpwdtxtfld.selectedLineColor = UIColor.clear
        
        chooseimage.image = chooseimage.image!.withRenderingMode(.alwaysTemplate)
        chooseimage.tintColor = UIColor.appTextMidLightColor()
        
        continuebtnview.edgeWithOutShadow(edge: 8.0)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(SignupViewController.imageTapped(_:)))
        profileimage.isUserInteractionEnabled = true
        profileimage.addGestureRecognizer(tapGestureRecognizer)
        
        profileimage.layer.cornerRadius =  profileimage.frame.width/2
        profileimage.clipsToBounds = true
        profileimage.layer.borderWidth = 1
        profileimage.layer.borderColor = UIColor.gray.cgColor
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target:self, action:#selector(SignupViewController.imageTapped(_:)))
        profileimage.isUserInteractionEnabled = true
        profileimage.addGestureRecognizer(tapGestureRecognizer1)
        
        
        cameraview.layer.cornerRadius =  cameraview.frame.width/2
        cameraview.clipsToBounds = true
        cameraview.layer.borderWidth = 1
        cameraview.layer.borderColor = UIColor.gray.cgColor
        
        let imageTap = UITapGestureRecognizer(target:self, action:#selector(SignupViewController.termsImageTapped(_:)))
        self.termsMarkImage.isUserInteractionEnabled = true
        self.termsMarkImage.addGestureRecognizer(imageTap)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        AppConstants.documentscreenapi = "1"
//        if AppConstants.checkphonenumber == 1{
//        enterphonebtn.setTitle(AppConstants.enterdriverphonenumber, for: .normal)
//         emailVerificationBtn.setTitle(AppConstants.enterDriverEmailAddress, for: .normal)
//            AppConstants.checkphonenumber = 0
//        }else{
//
//        }
        
        
        if AppConstants.checkphonenumber == 1{
            if !AppConstants.enterdriverphonenumber.isEmpty {
                enterphonebtn.setTitle(AppConstants.enterdriverphonenumber, for: .normal)
            }
            if !AppConstants.enterDriverEmailAddress.isEmpty{
                emailVerificationBtn.setTitle(AppConstants.enterDriverEmailAddress, for: .normal)
            }
            AppConstants.checkphonenumber = 0
        }else{
            
        }
        
        
        if let signUpFormData = reflectScreenData {
            
            if signUpFormData.emailVerification! == true {
                enteremailtxtfld.isHidden = true
                emailverificationContainerView.isHidden = false
            } else {
                enteremailtxtfld.isHidden = false
                emailverificationContainerView.isHidden = true
            }
            
            if signUpFormData.phoneVerification! == true {
                phoneWithoutVerificationContainerView.isHidden = true
                phoneNumberContainerView.isHidden = false
            } else {
                phoneWithoutVerificationContainerView.isHidden = false
                phoneNumberContainerView.isHidden = true
            }
            
            if signUpFormData.gender! {
                genderContainerView.isHidden = false
            } else {
                genderContainerView.isHidden = true
            }
            
            if signUpFormData.smoker! {
                smokerContainerView.isHidden = false
            } else {
                smokerContainerView.isHidden = true
            }
            if signUpFormData.driverCommissionChoice! {
              comissionview.isHidden = false
            } else {
              comissionview.isHidden = true
            }
            
        }
        
        
    }
    
    //-----Action performed-------
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    
    //MARK:- OPEN TERMS AND CONDITION
    //===============================
    @IBAction func termsConditionTapped(_ sender: Any)
    {
        self.countryId = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.COUNTRY_ID)
        if self.countryId == ""
        {
            showErrorAlert("Alert".localized, alertMessage: "Please enter phone number first.".localized, VC: self)
        }
        else
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsViewController") as! TermsConditionsViewController
            verifyViewController.source = "SIGNUP"
            self.present(verifyViewController, animated:true, completion:nil)
            //            self.presentVC("TermsConditionsViewController")
            
        }
    }
    
    @IBAction func allowuserlosmokebtnclick(_ sender: Any) {
        
        if let button = sender as? UIButton
        {
            if button.isSelected
            {
                
                checkboximageview.image = UIImage(named: "icons8-checked-checkbox-48") as UIImage?
                smokeacceptcheckboxvalue = "1"
                button.isSelected = false
                
                
            }else{
                checkboximageview.image = UIImage(named: "icons8-unchecked-checkbox-48") as UIImage?
                smokeacceptcheckboxvalue = "0"
                button.isSelected = true
                
              
            }
        }
    }
    
    //MARK:- MARK CHECK TO TERMS AND CONDITION
    //========================================
    @objc func termsImageTapped(_ img: AnyObject)
    {
        if self.termsMarkValue == "0"
        {
            self.termsMarkValue = "1"
            termsMarkImage.image = UIImage(named: "icons8-checked-checkbox-48")
        }
        else if self.termsMarkValue == "1"
        {
            self.termsMarkValue = "0"
            termsMarkImage.image = UIImage(named: "icons8-unchecked-checkbox-48")
        }
    }
    
    @objc func imageTapped(_ img: AnyObject)
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
            
            imagearray.removeAll()
            imagestring.removeAll()

            profileimageimgview.image = pickedImage
            
            let imageData = profileimageimgview.image!.jpegData(compressionQuality: 0.5)
            
            imagearray.append(imageData!)
            print(imagearray)
             imagestring.append("image")
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectcomissionbtn_click(_ sender: Any) {
        
        hiddenview.isHidden = false
        selectareacommissionvalue = 1
        check = 1000
        selectservicelbl.text = "Select type of Model".localized
        selectservicetableview.reloadData()
        
    }
    
    @IBAction func enterphone_btn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = ""
        verifyViewController.verifyMailOrPhone = .phone
        self.present(verifyViewController, animated:true, completion:nil)
    }
    
    @IBAction func onTapEmailBtn(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = ""
        verifyViewController.verifyMailOrPhone = .email
        self.present(verifyViewController, animated:true, completion:nil)

    }
    
    @IBAction func onTapSelectCountryCodeBtn(_ sender: UIButton) {
        self.countryCodeHiddenView.isHidden = false
    }
    
    @IBAction func hiddenviewokbtn_click(_ sender: Any) {
        countryCodeHiddenView.isHidden = true
    }
    
    @IBAction func hiddenviewcancelbtn_click(_ sender: Any) {
        countryCodeHiddenView.isHidden = true
    }

    @IBAction func selectfemale_btn(_ sender: Any) {
        
        checkGender = "2"
        self.maleimageview.image = uncheckedImage
        
        if self.femaleimageview.image == checkedImage{
            
        }else{
          self.femaleimageview.image = checkedImage
        }
        
    }
    
    @IBAction func selectmale_btn(_ sender: Any) {
        
        checkGender = "1"
        self.femaleimageview.image = uncheckedImage
        
        if self.maleimageview.image == checkedImage{
            
        }else{
          self.maleimageview.image = checkedImage
            
        }
        
    }
        
    @IBAction func onTapYesSmokerBtn(_ sender: UIButton) {
        checkSmoker = "1"
        self.noSmokerImageView.image = uncheckedImage
        
        if self.yesSmokerImageView.image == checkedImage{
            
        }else{
            self.yesSmokerImageView.image = checkedImage
            
        }
    }
    
    @IBAction func onTapNoSmokerBtn(_ sender: UIButton) {
        checkSmoker = "0"
        self.yesSmokerImageView.image = uncheckedImage
        
        if self.noSmokerImageView.image == checkedImage{
            
        }else{
            self.noSmokerImageView.image = checkedImage
        }
    }
    

    @IBAction func selectarea_btn_click(_ sender: Any) {
        
        hiddenview.isHidden = false
        selectareacommissionvalue = 0
        check = 1000
        selectservicelbl.text = "Select City".localized
        selectservicetableview.reloadData()
    }
    
    @IBAction func continue_btn_click(_ sender: Any) {
        var enteredEmail =  ""
        var phoneNo = ""
        
        if let signUpFormData = reflectScreenData {
            
            if signUpFormData.emailVerification! == true {
                enteredEmail = (emailVerificationBtn.titleLabel?.text)!
            } else {
                enteredEmail = enteremailtxtfld.text!
            }
            
            if signUpFormData.phoneVerification! == true {
                
                phoneNo = (enterphonebtn.titleLabel?.text)!
                
                
                if phoneNo == "" || phoneNo == "Enter Mobile".localized  {
                    self.showErrorAlert("", alertMessage: "Please Enter Mobile Number First".localized, VC: self)
                    return
                }
                
                
            } else {
               if (self.enterPhoneWithoutVerTexField.text?.count)! >= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)! &&  (self.enterPhoneWithoutVerTexField.text?.count)! <= (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!{
                 phoneNo = countryCodeLabel.text! + enterPhoneWithoutVerTexField.text!
                
                
               }else{
                
                self.showErrorAlert("", alertMessage: "phone number should exist between ".localized + "\((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].minNumPhone)!)" + " to ".localized + "\((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].maxNumPhone)!)" + " digits.".localized, VC: self)
                
                }
            }
        }
        
        if  (reflectScreenData?.email)! {
            if enteredEmail.isEmail{
                self.emailValid=true
                
            }else{
                self.emailValid=false
            }
        }

        if (self.enterfullnametxtfld.text?.count)! < 2 {
            
            self.showErrorAlert("", alertMessage: "Please Enter First Name".localized, VC: self)
            
            return
        }
        
//        if  (reflectScreenData?.phone)! {
//            if phoneNo.isEmpty {
//                self.showErrorAlert("", alertMessage: "Please Enter Mobile Number First".localized, VC: self)
//                return
//            }
//        }
//

        
        if (self.enterpwdtxtfld.text?.count)! < 6{
        self.showErrorAlert("", alertMessage: "Password length should not be less than 6".localized, VC: self)
        
        return
        
        }
        if profileimageimgview.image == nil{
            self.showErrorAlert("", alertMessage: "Please Select Image First".localized, VC: self)
            
            return

        }
            
            if self.selectareabtn.currentTitle == "Select Area".localized {
                self.showErrorAlert("", alertMessage: "Please Select Area First".localized, VC: self)
                
                return
            }
        
        if (reflectScreenData?.gender)! {
            if self.femaleimageview.image == uncheckedImage && maleimageview.image == uncheckedImage {
                
                self.showErrorAlert("", alertMessage: "Please Select Gender First".localized, VC: self)
                
                return
                
            }
        }

        if (reflectScreenData?.smoker)! {
            if self.yesSmokerImageView.image == uncheckedImage && noSmokerImageView.image == uncheckedImage {
                
                self.showErrorAlert("", alertMessage: "Please Select Option Regarding Smoke".localized, VC: self)
                
                return
                
            }
        }
        
        if self.termsMarkValue == "0" {
            self.showErrorAlert("", alertMessage: "Please Accept Terms And Conditions".localized, VC: self)
            
            return
        }
        
        if ((reflectScreenData?.driverCommissionChoice)!) {
            
            if selectcommisiontype == ""{
                
                self.showErrorAlert("", alertMessage: "Please select type of Model".localized, VC: self)
                
                return
            }
        }
        
        
        if (AppConstants.driverconfiguredata.data?.generalConfig?.drivercpfnumberenable)!{
            
            let success = BooleanValidator().validate(cpf: entercpfnumber.text!)
            
            if !success {
                self.showErrorAlert("Alert", alertMessage: "Please enter Valid CPF Number".localized, VC: self)
                
            }
        }
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.referralcodemandatory == true{
            
            if self.enterrefercodetext.text!.isEmpty{
                
                self.showErrorAlert("", alertMessage: "Please enter referral code first".localized, VC: self)
                
                return
                
            }
        }
        
        if self.emailValid {
            if enterpwdtxtfld.text == confirmPasswordTextField.text {
                
                let selectCountryID1 = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.COUNTRY_ID)
                
                var dic = ["first_name": enterfullnametxtfld.text! as AnyObject,
                           "last_name": enterLastNameTextField.text!,
                           "phone":phoneNo,
                           "email": enteredEmail,
                           "password": enterpwdtxtfld.text!,
                           "area": selectarea,
                           "referral_code":enterrefercodetext.text!,
                           "country_id":selectCountryID1
                           
                    ] as [String : AnyObject]
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.PLAYER_ID){
                    
                    
                    dic["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID) as AnyObject
                    
                }else{
                    dic["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
                    
                }
                
                if reflectScreenData!.gender! {
                    dic["driver_gender"] = checkGender as AnyObject
                }
                if reflectScreenData!.smoker! {
                    dic["smoker_type"] = checkSmoker as AnyObject
                    dic["allow_other_smoker"] = smokeacceptcheckboxvalue as AnyObject
                }
                
                
                if reflectScreenData!.driverCommissionChoice! {
                    dic["driver_commission_type"] = selectcommisiontype as AnyObject
                }
                
                
                 if (AppConstants.driverconfiguredata.data?.generalConfig?.drivercpfnumberenable)!{
                     dic["driver_cpf_number"] = self.entercpfnumber.text! as AnyObject
                    
                }
                
                showLoaderWithoutBackground()
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSIGNUP
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, imagesData: imagearray, imageParamName: imagestring, returningClass: DriverSignUp.self)
            } else {
                      self.showErrorAlert("", alertMessage: "Password Does Not Match".localized, VC: self)
            }
        }else{
            self.showErrorAlert("", alertMessage: "Please fill email properly.".localized, VC: self)
            
        }
        }
}

extension SignupViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(AppConstants.driverconfiguredata.data?.countries?.count)
        if tableView == selectservicetableview{
            if selectareacommissionvalue == 1{
                
                return (AppConstants.driverconfiguredata.data?.driverCommissionChoices?.count)!
                
            }else{
                    return (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].countryArea?.count)!
            }
        } else {
             return (AppConstants.driverconfiguredata.data?.countries?.count)!
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == selectservicetableview {
            let cell = selectservicetableview.dequeueReusableCell(withIdentifier: "selectservice", for: indexPath) as! SignUpSelectServiceTableViewCell
            
            if selectareacommissionvalue == 1{
                
                
                cell.servicecityname.text = AppConstants.driverconfiguredata.data?.driverCommissionChoices![indexPath.row].langData
                
            }else{
            
            cell.servicecityname.text = AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].countryArea![indexPath.row].areaName
            //cell.servicecityname.text = AppConstants.driverconfiguredata.data?.countries![1].countryArea![indexPath.row].id
            }
            let tableheight = selectservicetableview.contentSize.height
            
            if tableheight < AppConstants.screenframeheight - 200.0{
                
                innerviewheight.constant = tableheight + 100.0
                
            }else{
                
                innerviewheight.constant = AppConstants.screenframeheight - 200.0
            }
            
            if check == indexPath.row{
                cell.servicecityimageview.image = UIImage(named: "radio-on-button")
            }else{
                cell.servicecityimageview.image = UIImage(named: "icons8-0-percent-filled-50")
            }
            
            //selectservicetableview.reloadData()
            
            return cell
        } else {
            let cell = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath) as! SelectCountryTableViewCell
            cell.countryname.text = (AppConstants.driverconfiguredata.data?.countries![indexPath.row].phonecode)! + " " + (AppConstants.driverconfiguredata.data?.countries![indexPath.row].name)!
            //cell.countryimage
            
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
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == selectservicetableview {
            selectservicetableview.deselectRow(at: indexPath, animated: true)
            check = indexPath.row
            selectindexvalue = indexPath.row
            selectservicetableview.reloadData()
            hiddenview.isHidden = true
            
            if selectareacommissionvalue == 1{
                selectedcomissionbtntext.setTitle(AppConstants.driverconfiguredata.data?.driverCommissionChoices![indexPath.row].langData, for: .normal)
                
                
                selectcommisiontype = String((AppConstants.driverconfiguredata.data?.driverCommissionChoices![indexPath.row].id)!)
                
            }else{
            
            selectareabtn.setTitle(AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].countryArea![selectindexvalue].areaName, for: .normal)
            
            selectarea = String(((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].countryArea![selectindexvalue].id)!)!)
                
            }
        } else {
            hiddentableview.deselectRow(at: indexPath, animated: true)
            check1 = indexPath.row
            AppConstants.selectindexvalue4 = indexPath.row
            print(AppConstants.selectindexvalue4)
            hiddentableview.reloadData()
            hiddenview.isHidden = true
            
            selectCountryCode = (AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].phonecode)!
            selectCountryID = String((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].id)!)
            
            
            UserDefaultUtility.saveStringWithKey(selectCountryID, key: AppConstants.UserDefaultKeys.COUNTRY_ID)
            
            
            UserDefaultUtility.saveStringWithKey(String((AppConstants.driverconfiguredata.data?.countries![AppConstants.selectindexvalue4].distanceUnit)!), key: AppConstants.UserDefaultKeys.DISTANCE_UNIT)
            
            //        AppConstants.countryId = Int(selectCountryCode)!
            print(selectCountryCode)
            countryCodeLabel.text = selectCountryCode
        }
  
    }
    
}

//------Api Response------

extension SignupViewController: ApiResponseReceiver{
   
   
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverSignUp{
            let data:DriverSignUp = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.saveStringWithKey("1", key: AppConstants.UserDefaultKeys.SIGNUP_STEP)
                
                UserDefaultUtility.saveBoolForKey(AppConstants.UserDefaultKeys.FIREBASE_ONESIGNAL_CHECK, value: data.data?.pushNotification?.fireBase ?? false)
                
                UserDefaultUtility.saveStringWithKey(((data.data?.email ?? "")!), key: AppConstants.UserDefaultKeys.EMAIL_ID)
                
                 UserDefaultUtility.saveStringWithKey((String((data.data?.id ?? 0)!)), key: AppConstants.UserDefaultKeys.DRIVER_ID)
                
                UserDefaultUtility.saveStringWithKey((data.data?.phoneNumber ?? "")!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                
//                UserDefaultUtility.saveStringWithKey((data.data?.fullName ?? "")!, key: AppConstants.UserDefaultKeys.NAME)
                
//                UserDefaultUtility.saveStringWithKey((data.data?.firstName ?? "Not Found"), key: AppConstants.UserDefaultKeys.FIRST_NAME)
//                
//                UserDefaultUtility.saveStringWithKey((data.data?.lastName ?? "Not Found"), key: AppConstants.UserDefaultKeys.LAST_NAME)
                
                UserDefaultUtility.saveStringWithKey((data.data?.password ?? "")!, key: AppConstants.UserDefaultKeys.PASSWORD)
                
                UserDefaultUtility.saveStringWithKey((data.data?.profileImage ?? "")!, key: AppConstants.UserDefaultKeys.DRIVER_IMAGE)
               
                UserDefaultUtility.saveStringWithKey((data.data?.driverGender ?? "")!, key: AppConstants.UserDefaultKeys.DRIVER_GENDER)
                
                UserDefaultUtility.saveStringWithKey((data.data?.createdAt ?? "")!, key: AppConstants.UserDefaultKeys.DRIVER_REGISTERATION_DATE)
                
                UserDefaultUtility.saveStringWithKey((data.data?.countryAreaId ?? "")!, key: AppConstants.UserDefaultKeys.AREAID)
                
                var dic1 = ["driver_id": (String((data.data?.id ?? 0)!))
                           ] as [String : AnyObject]
                
                    if (data.data?.pushNotification?.fireBase ?? false){
                    
                    dic1["player_id"] = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.DEVICE_ID) as AnyObject
                        
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DriverUpdatePlayerID
                        ServiceManager.sharedInstance.delegate = self
                        
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: DemoLoginModel.self)
                    }else{
                    
                   
                    }
                
                //UserDefaultUtility.saveStringWithKey((data.data?.countryAreaId, key: AppConstants.UserDefaultKeys.AREAID)
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: VehicleInformationViewController = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
                nextController.movedFrom = movedFromDocVer.signUpScreen.rawValue
                self.present(nextController, animated: false, completion: nil)
                
                
//                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let nextController: VehicleInformationViewController = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
//
//                if let window = self.view.window{
//                    window.rootViewController = nextController
//                }
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                    hideLoaderWithoutBackground()
                    showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
    
        }
    
}
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
}


extension SignupViewController: UITextFieldDelegate{
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let val = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if textField == self.entercpfnumber{
            
            if string == ""
            {
                
                return true
            }
                
                
                //Check for max length including the spacers we added
            else if (val.count) > 14
            {
                
                return false
            }
                
                //Put / space after 2 digit
            else if val.count == 4
            {
                print(val)
                
                self.entercpfnumber.text = self.entercpfnumber.text! + "."
                
            }
            else if val.count == 8
            {
                print(val)
                
                self.entercpfnumber.text = self.entercpfnumber.text! + "."
                
            }
            else if val.count == 12
            {
                print(val)
                
                self.entercpfnumber.text = self.entercpfnumber.text! + "-"
                
            }
        }else if  textField == self.enterPhoneWithoutVerTexField{
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
        
        return true
        
    }
    
}


