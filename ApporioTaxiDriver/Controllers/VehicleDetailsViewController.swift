//
//  VehicleDetailsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper

class VehicleDetailsViewController: BaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var wheelchairiamgeview: UIImageView!
    
    @IBOutlet weak var selectvehiclemakeheight: NSLayoutConstraint!
    
    @IBOutlet weak var selectvehiclemodelheight: NSLayoutConstraint!
    @IBOutlet weak var entervehiclemaketext: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var entervehiclemodelheight: NSLayoutConstraint!
    @IBOutlet weak var entervehiclemodeltext: SkyFloatingLabelTextField!
    @IBOutlet weak var entervehiclemodelview: UIView!
    
    
    @IBOutlet weak var enternumberofseattext: SkyFloatingLabelTextField!
    @IBOutlet weak var enternumberofseatsview: UIView!
    
    @IBOutlet weak var enternumberofseatviewheight: NSLayoutConstraint!
    
    
    @IBOutlet weak var entervehiclemakeviewheight: NSLayoutConstraint!
    @IBOutlet weak var entervehiclemakeview: UIView!
    
    
    
    
    
    
    @IBOutlet weak var wheelchairheight: NSLayoutConstraint!
    @IBOutlet weak var chaietextlbl: UILabel!
    @IBOutlet weak var wheelchairavailabletext: UILabel!
    @IBOutlet weak var wheelchairview: UIView!
    
    
    @IBOutlet weak var newtoptableview: UITableView!
    @IBOutlet weak var vehiclephotoimageview: UIImageView!
    @IBOutlet weak var numberplateimageview: UIImageView!
    @IBOutlet weak var secontableinnerviewheight: NSLayoutConstraint!
    @IBOutlet weak var vehiclemodellblnametext: UILabel!
    @IBOutlet weak var vehiclemodeldatahiddenview: UIView!
    @IBOutlet weak var vehiclemodaldatamainview: UIView!
    @IBOutlet weak var vehiclemodaldatatableview: UITableView!
    @IBOutlet weak var fourthview: UIView!
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var thirdview: UIView!
    @IBOutlet weak var hiddencancelbtn: UIButton!
    @IBOutlet weak var innerview: UIView!
  //  @IBOutlet weak var addvehiclelabel: UILabel!
    @IBOutlet weak var innerviewheight: NSLayoutConstraint!
    @IBOutlet weak var addvehiclebtntext: UIButton!
    @IBOutlet weak var createvehiclelbl: UILabel!
    @IBOutlet weak var selectvehicletypelabel: UILabel!
    @IBOutlet weak var vehicletype: UILabel!
    @IBOutlet weak var selectvehiclemakelabel: UILabel!
    @IBOutlet weak var selectvehiclemake: UILabel!
    @IBOutlet weak var selectvehicletypebtn: UIButton!
    @IBOutlet weak var selectvehiclemakebtn: UIButton!
    //@IBOutlet weak var selectvehiclemodellabel: UILabel!
    @IBOutlet weak var vehiclemodelhiddencancelbtn: UIButton!
    @IBOutlet weak var selectvehiclemodel: UILabel!
    @IBOutlet weak var selectvehiclemodellabel: UILabel!
    @IBOutlet weak var selectvehiclemodelbtn: UIButton!
    @IBOutlet weak var typeofservicelabel: UILabel!
    @IBOutlet weak var typeofservice: UILabel!
    @IBOutlet weak var typeservicebtn: UIButton!
    @IBOutlet weak var addvehicledetails: UIView!
    @IBOutlet weak var entervehiclenotxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var vehiclecolortxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var selectnoplateimage: UIButton!
    @IBOutlet weak var vehiclephoto: UIButton!
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var selectvehicletypelbl: UILabel!
    @IBOutlet weak var hiddenvehicletableview: UITableView!
 
    
    //OWNER VEHICLE DETAILS IBOUTLETS
    //===============================
    @IBOutlet weak var ownerNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var ownerNoTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var ownerEmailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var ownerBankNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var ownerBankCodeTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var ownerAccountnoTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var ownerDetailsMainStackView: UIStackView!
    @IBOutlet weak var ownerChequeButton: UIButton!
    @IBOutlet weak var ownerVehicleCheckBoxImage: UIImageView!
    @IBOutlet weak var mainViewHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var ownerChequeImageView: UIImageView!
    @IBOutlet weak var acCheckboxImageView: UIImageView!
    @IBOutlet weak var acTextLabel: UILabel!
    @IBOutlet weak var acView: UIView!
    @IBOutlet weak var babySeatView: UIView!
    @IBOutlet weak var babySeatViewHeightConstarint: NSLayoutConstraint!
    @IBOutlet weak var babySeatLabel: UILabel!
    @IBOutlet weak var babySeatImageView: UIImageView!
    @IBOutlet weak var acViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var ownerDetailsCheckBox: UIView!
    
    
    
    var selectedCells:[Int] = []
    var imagearray: [Data] = []
    var imagestring: [String] = []
    var selectiamgevalue = 0
    var selectedCellsvaluename:[String] = []
    var selectedCellsvalue:[String] = []
    var vehicleiamgeselct = 0
    var chequeImageSelect: Bool = false
    var carimagenumberimage = 0
    var tableheaderheightvalue = 1440.0
    var checkbtnclick:Int?
    var selectedimage:UIImage = UIImage()
    var tableCount: Int?
    var tableCountVehiclemake: Int?
    var tableVehicleServices: Int?
    var tablecountvehiclemodel: Int?
    var mydata: VehicleConfigureModel!
    var addvehicledata: AddVehicleModel!
    var vehiclemodeldata: DriverVehicleModelModel!
    var selectindexvalue10 = 0
    var selectindexvalue11 = 0
    var selectindexvalue12 = 0
    var selectindexvalue13 = 0
    var selectvehicletypeid:Int = 0
    var selectvehiclemakeid:Int = 0
    var selectvehiclemodelid:Int = 0
    var checkedImage = UIImage(named: "icons8-checked-checkbox-48")! as UIImage
    var uncheckedImage = UIImage(named: "icons8-unchecked-checkbox-48")! as UIImage
    var ownerType = "0"
    var acValue = "0"
    var babySeatValue = "0"
    var wheelchairValue = "0"
    var movedFrom = movedFromDocVer.loginScreen.rawValue
    var driverAreaId = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.AREAID)
     var driverid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.DRIVER_ID)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        entervehiclemaketext.placeholder = "Enter vehicle Make".localized
        entervehiclemodeltext.placeholder = "Enter Vehicle Model".localized
        enternumberofseattext.placeholder = "Enter Number Of Seats".localized
        
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.vehicleEnable == true
        {
            acView.isHidden = false
            acViewHeightConstraint.constant = 40
        }
        else
        {
            acView.isHidden = true
            acViewHeightConstraint.constant = 0
            tableheaderheightvalue = tableheaderheightvalue - 40.0
           
            
        }
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.vehiclemaketext == true
        {
            entervehiclemakeview.isHidden = false
            entervehiclemakeviewheight.constant = 40
            secondview.isHidden = true
            selectvehiclemakeheight.constant = 0.0
             tableheaderheightvalue = tableheaderheightvalue - 50.0
        }
        else
        {
            
            entervehiclemakeview.isHidden = true
            entervehiclemakeviewheight.constant = 0.0
            secondview.isHidden = false
            selectvehiclemakeheight.constant = 50.0
           
            tableheaderheightvalue = tableheaderheightvalue - 40.0
            
            
        }
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.vehiclemodeltext == true
        {
            entervehiclemodelview.isHidden = false
            entervehiclemodelheight.constant = 100
           
            thirdview.isHidden = true
            selectvehiclemodelheight.constant = 0.0
            tableheaderheightvalue = tableheaderheightvalue - 50.0
        }
        else
        {
            
            entervehiclemodelview.isHidden = true
            entervehiclemodelheight.constant = 0.0
            
            thirdview.isHidden = false
            selectvehiclemodelheight.constant = 50.0
            tableheaderheightvalue = tableheaderheightvalue - 100.0
            
            
        }
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.babySeatEnable == true
        {
            babySeatView.isHidden = false
            babySeatViewHeightConstarint.constant = 40
           
        }
        else
        {
            babySeatView.isHidden = true
            babySeatViewHeightConstarint.constant = 0
          tableheaderheightvalue = tableheaderheightvalue - 40.0
        }
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.wheelchairenable == true
        {
            wheelchairview.isHidden = false
            wheelchairheight.constant = 40
        }
        else
        {
            wheelchairview.isHidden = true
            wheelchairheight.constant = 0
           tableheaderheightvalue = tableheaderheightvalue - 40.0
            
        }
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.vehicleOwner == true
        {
            ownerDetailsCheckBox.isHidden = false
            self.mainViewHeightContraint.constant = 1440.0 - 370.0
            
            tableheaderheightvalue = tableheaderheightvalue - 370.0
            
            self.sizetofit()
            
        }
        else
        {
           
            ownerDetailsCheckBox.isHidden = true
            
            self.mainViewHeightContraint.constant = 1440.0 - 410.0
            
            tableheaderheightvalue = tableheaderheightvalue - 410.0
            
            self.sizetofit()
            
           
        }
        
        self.acCheckboxImageView.image = uncheckedImage
        self.babySeatImageView.image = uncheckedImage
        self.wheelchairiamgeview.image = uncheckedImage
        //OWNER DETAILS SET UP
        //===================
        self.ownerVehicleCheckBoxImage.image = uncheckedImage
        self.ownerDetailsMainStackView.isHidden = true
        self.mainViewHeightContraint.constant = 1440.0 - 370.0
        self.ownerNoTextField.delegate = self
        self.ownerNameTextField.placeholder = "Owner Name".localized
        self.ownerNoTextField.placeholder = "Owner Number".localized
        self.ownerEmailTextField.placeholder = "Owner Email".localized
        self.ownerBankNameTextField.placeholder = "Owner Bank Name".localized
        self.ownerBankCodeTextField.placeholder = "Owner Bank Code".localized
        self.ownerAccountnoTextField.placeholder = "Owner Account No.".localized
        self.ownerChequeButton.setTitle("Owner Cheque Image".localized, for: .normal)
        chequeImageSelect = false
        ownerType = "0"
        acValue = "0"
        babySeatValue = "0"
        wheelchairValue = "0"
        
        imagearray.removeAll()
        imagestring.removeAll()
        
        babySeatLabel.text = "Baby Seat Availablity".localized
       
        addvehiclebtntext.setTitle("Add Vehicle".localized, for: .normal)
        createvehiclelbl.text = "Create Vehicle".localized
        
        selectvehicletypelabel.text = "Select Vehicle Type".localized
        vehicletype.text = "Click to select".localized
        
        selectvehiclemakelabel.text = "Select Vehicle Make".localized
        selectvehiclemake.text = "Click to select".localized
        
        selectvehiclemodel.text = "Select Vehicle Model".localized
        selectvehiclemodellabel.text = "Click to select".localized
        
        typeofservicelabel.text = "Type of Service".localized
        typeofservice.text = "Click to select".localized
        
        entervehiclenotxtfld.placeholder = "Enter Vehicle number".localized
        vehiclecolortxtfld.placeholder = "Enter Vehicle Color".localized
        selectnoplateimage.setTitle("Select Number Plate Image".localized, for: .normal)
        vehiclephoto.setTitle("Select Vehicle Photo".localized, for: .normal)
        
        hiddencancelbtn.setTitle("Ok".localized, for: .normal)
        vehiclemodelhiddencancelbtn.setTitle("Ok".localized, for: .normal)
        
      
        
        firstview.setBorderToView(withWidth: 1.0, color: UIColor.gray)
        secondview.setBorderToView(withWidth: 1.0, color: UIColor.gray)
        thirdview.setBorderToView(withWidth: 1.0, color: UIColor.gray)
        fourthview.setBorderToView(withWidth: 1.0, color: UIColor.gray)
        
        entervehiclenotxtfld.selectedTitleColor = UIColor.appTextDarkColor()
        entervehiclenotxtfld.selectedLineColor = UIColor.clear
        vehiclecolortxtfld.selectedTitleColor = UIColor.appTextDarkColor()
        vehiclecolortxtfld.selectedLineColor = UIColor.clear
        
        tableCount = 0
        tableCountVehiclemake = 0
        tablecountvehiclemodel = 0
        tableVehicleServices = 0
        vehiclemodeldatahiddenview.isHidden = true
        hiddenview.isHidden = true
        
        print(driverAreaId)
        
        let dic = ["area": driverAreaId
            
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERVEHICLECONFIGURATION
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: VehicleConfigureModel.self)

        
    }
    
    
    func sizetofit(){
        
        
        let headerView = newtoptableview.tableHeaderView!
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        var frame = headerView.frame
        frame.size.height = CGFloat(tableheaderheightvalue)
        headerView.frame = frame
        
        newtoptableview.tableHeaderView = headerView
        
    }
    
    
    //-----Action Performed------
    
//    @IBAction func backbtn(_ sender: Any) {
//        self.dismissVC()
//    }
    @IBAction func addvehicle_btn_click(_ sender: Any)
    {
        if self.selectvehicletypeid == 0
        {
            
            self.showErrorAlert("Alert".localized, alertMessage: "Please select vehicle type first".localized, VC: self)
            
       
        }else if self.selectedCellsvaluename.count == 0{
            self.showErrorAlert("Alert", alertMessage: "Please select type of services".localized, VC: self)
            
        }else if (self.vehiclecolortxtfld.text?.count)! < 2 {
            
             self.showErrorAlert("Alert".localized, alertMessage: "Please enter car color first".localized, VC: self)
        }
        else if (self.entervehiclenotxtfld.text?.count)! < 2 {
            
            self.showErrorAlert("Alert".localized, alertMessage: "Please enter vehicle number  first", VC: self)
        }else if self.carimagenumberimage == 0 {
             self.showErrorAlert("Alert".localized, alertMessage: "Please enter vehicle number plate image first".localized, VC: self)
            
        }else if self.vehicleiamgeselct == 0 {
            self.showErrorAlert("Alert".localized, alertMessage: "Please enter vehicle image first".localized, VC: self)

       }
        else
        {
            
         
            var dic = ["vehicle_color": vehiclecolortxtfld.text! as AnyObject,
                       "vehicle_type": String(selectvehicletypeid) as AnyObject,
                       "vehicle_number": entervehiclenotxtfld.text!,
                       "driver_id": self.driverid,
                      "service_type": selectedCellsvalue.joined(separator: ","),
                        "ac_nonac": self.acValue
                ] as [String : AnyObject]
            
            
            
            if AppConstants.driverconfiguredata.data?.generalConfig?.vehiclemaketext == true{
                
                if (self.entervehiclemaketext.text?.count)! < 2{

                self.showErrorAlert("Alert".localized, alertMessage: "Please enter vehicle make first".localized, VC: self)
                
             }else{
                 dic["vehicle_make"] = self.entervehiclemaketext.text! as AnyObject
                
                }

                
                
            }else{
                
                if self.selectvehiclemakeid == 0{
                    
                                    self.showErrorAlert("Alert".localized, alertMessage: "Please select vehicle make first".localized, VC: self)
                    
                }else{
                    dic["vehicle_make"] = String(selectvehiclemakeid) as AnyObject
                    
                }
            }
            
            
             if AppConstants.driverconfiguredata.data?.generalConfig?.vehiclemodeltext == true{
                
                
                if (self.entervehiclemodeltext.text?.count)! < 2 {
                
                self.showErrorAlert("Alert".localized, alertMessage: "Please enter vehicle model first".localized, VC: self)
                
             }else{
                    dic["vehicle_model"] = self.entervehiclemodeltext.text! as AnyObject
                 dic["vehicle_seat"] = self.enternumberofseattext.text! as AnyObject
              }
                
             }else{
                
                 if self.selectvehiclemodelid == 0{
                                self.showErrorAlert("Alert".localized, alertMessage: "Please select vehicle model first", VC: self)
                    
                 }else{
                    dic["vehicle_model"] = String(selectvehiclemodelid) as AnyObject
                   
                    
                }
            }
            
            
            if AppConstants.driverconfiguredata.data?.generalConfig?.babySeatEnable == true
            {
                dic["baby_seat"] = babySeatValue as AnyObject
            }
            if AppConstants.driverconfiguredata.data?.generalConfig?.wheelchairenable == true
            {
                dic["wheel_chair"] = wheelchairValue as AnyObject
            }
            
            
            
            switch (ownerType)
            {
                case "0":
                    dic["owner_type"] = ownerType as AnyObject
                    self.callApi(data: dic)
    
                case "1":
                    let enteredEmail = self.ownerEmailTextField.text!
                    if self.ownerNameTextField.text == ""
                    {
                       self.showErrorAlert("Alert".localized, alertMessage: "Please Enter Vehicle Owner Name".localized, VC: self)
                    }
                    else if self.ownerNoTextField.text == ""
                    {
                        self.showErrorAlert("Alert".localized, alertMessage: "Please Enter Owner Number".localized, VC: self)
                    }
                    else if self.ownerNoTextField.text!.count < 7
                    {
                        self.showErrorAlert("Alert".localized, alertMessage: "Please Enter Valid Owner Number".localized, VC: self)
                    }
                    else if enteredEmail.isEmail == false
                    {
                        self.showErrorAlert("Alert".localized, alertMessage: "Please Enter Valid Email".localized, VC: self)
                    }
                    else if self.ownerBankNameTextField.text == ""
                    {
                        self.showErrorAlert("Alert".localized, alertMessage: "Please Enter Owner Bank Name".localized, VC: self)
                    }
                    else if self.ownerBankCodeTextField.text == ""
                    {
                        self.showErrorAlert("Alert".localized, alertMessage: "Please Enter Owner Bank Code".localized, VC: self)
                    }
                    else if self.ownerAccountnoTextField.text == ""
                    {
                        self.showErrorAlert("Alert".localized, alertMessage: "Please Enter Owner Account No".localized, VC: self)
                    }
                    else if self.chequeImageSelect == false
                    {
                        self.showErrorAlert("Alert".localized, alertMessage: "Please Upload Owner Cheque Image".localized, VC: self)
                    }
                    else
                    {
                        dic["owner_type"] = ownerType as AnyObject
                        dic["owner_name"] = ownerNameTextField.text! as AnyObject
                        dic["owner_phone"] = ownerNoTextField.text! as AnyObject
                        dic["owner_email"] = ownerEmailTextField.text! as AnyObject
                        dic["owner_bank_name"] = ownerBankNameTextField.text! as AnyObject
                        dic["owner_bank_code"] = ownerBankCodeTextField.text! as AnyObject
                        dic["owner_account_number"] = ownerAccountnoTextField.text! as AnyObject
                        self.callApi(data: dic)
                    }
                
                default:
                    dic["owner_type"] = ownerType as AnyObject
                    self.callApi(data: dic)
//                    showLoaderWithoutBackground()
//                    print(imagearray)
//                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERADDVEHICLE
//                    ServiceManager.sharedInstance.delegate = self
//                    ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, imagesData: imagearray, imageParamName: imagestring, returningClass: AddVehicleModel.self)
            }
            
        }
    }
    @IBAction func selectvehicletype_btn(_ sender: Any) {
        selectvehicletypelbl.text = "Select Vehicle Type".localized
        selectvehiclemakeid = 0
        selectvehiclemodelid = 0
        selectvehiclemodellabel.text  = "Click to select".localized
        selectvehiclemake.text = "Click to select".localized
        typeofservice.text = "Click to select".localized
        selectedCells.removeAll()
        selectedCellsvaluename.removeAll()
        selectedCellsvalue.removeAll()
        
        hiddenview.isHidden = false
        vehiclemodeldatahiddenview.isHidden = true
        checkbtnclick = 1
        hiddenvehicletableview.reloadData()
    }
    @IBAction func selectvehiclemakebtn_click(_ sender: Any) {
        
        selectvehicletypelbl.text = "Select Vehicle Make".localized
        // selectvehicletypelbl.text = "Select Vehicle Make"
        selectvehiclemodelid = 0
        selectvehiclemodellabel.text  = "Click to select".localized
        typeofservice.text = "Click to select".localized
        selectedCells.removeAll()
        selectedCellsvaluename.removeAll()
        selectedCellsvalue.removeAll()
        if self.selectvehicletypeid == 0{
            
            self.showErrorAlert("Alert".localized, alertMessage: "Please select vehicle type first".localized, VC: self)
            
        }else{
                
                let dic = [
                           "vehicle_type": selectvehicletypeid
                    
                    ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERVEHICLEMAKESELECT
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: VehicleMakeConfigureModel.self)

        }
    }
    
    @IBAction func wheelchairbtnclick(_ sender: Any) {
        
        
        if let button = sender as? UIButton
        {
            if button.isSelected
            {
                wheelchairValue = "0"
                self.wheelchairiamgeview.image = uncheckedImage
                button.isSelected = false
                
            }
            else
            {
                wheelchairValue = "1"
                self.wheelchairiamgeview.image = checkedImage
                button.isSelected = true
            }
        }
        
    }
    
    
    
    
    @IBAction func selectvehiclemodelbtn_click(_ sender: Any) {
       //  selectvehicletypelbl.text = "Select Vehicle Model".localized
        
        
        typeofservice.text = "Click to select".localized
        selectedCells.removeAll()
        selectedCellsvaluename.removeAll()
        selectedCellsvalue.removeAll()
        
        if  self.selectvehiclemakeid == 0{
            
             self.showErrorAlert("Alert".localized, alertMessage: "Please select vehicle make first".localized, VC: self)
            
        }else{
            
            
            let dic = ["vehicle_make": selectvehiclemakeid,
                       "vehicle_type": selectvehicletypeid
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERVEHICLEMODELSELECT
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: DriverVehicleModelModel.self)
            
        }
        
    }
    @IBAction func typeservicebtn_click(_ sender: Any) {
        
         vehiclemodellblnametext.text = "Select Type Of Services".localized
        
        
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.vehiclemodeltext == true{
            
            
            if (self.entervehiclemodeltext.text?.count)! < 2 {
                
                self.showErrorAlert("Alert".localized, alertMessage: "Please enter vehicle model first".localized, VC: self)
                
            }else{
               
                hiddenview.isHidden = true
                vehiclemodeldatahiddenview.isHidden = false
                checkbtnclick = 4
                vehiclemodaldatatableview.reloadData()
            }
            
        }else{
            
            if self.selectvehiclemodelid == 0{
                self.showErrorAlert("Alert".localized, alertMessage: "Please select vehicle model first", VC: self)
                
            }else{
                hiddenview.isHidden = true
                vehiclemodeldatahiddenview.isHidden = false
                checkbtnclick = 4
                vehiclemodaldatatableview.reloadData()
                
            }
        }
        
        
        
        
        
        
//        if self.selectvehiclemodelid == 0{
//              self.showErrorAlert("Alert".localized, alertMessage: "Please select vehicle model first".localized, VC: self)
//        }else{
//            hiddenview.isHidden = true
//            vehiclemodeldatahiddenview.isHidden = false
//        checkbtnclick = 4
//            vehiclemodaldatatableview.reloadData()
//
//        }
    }
    @IBAction func selectnoplateimgbtn(_ sender: Any) {
       selectiamgevalue = 1
        imagetapped()
        
    }
    @IBAction func vehiclephotobtn_click(_ sender: Any) {
        selectiamgevalue = 2
      imagetapped()
        
    }
    
    
    @IBAction func secondtablecancelbtnclick(_ sender: Any) {
        
        typeofservice.text = selectedCellsvaluename.joined(separator: ",")
        vehiclemodeldatahiddenview.isHidden = true
        
    }
    
    @IBAction func ownerDetailsTapped(_ sender: Any)
    {
        
        
        if let button = sender as? UIButton
        {
            if button.isSelected
            {
                
                self.ownerVehicleCheckBoxImage.image = uncheckedImage
                self.ownerDetailsMainStackView.isHidden = true
                self.mainViewHeightContraint.constant = 1430.0 - 370.0
                self.tableheaderheightvalue =  self.tableheaderheightvalue - 370.0
                self.sizetofit()
                button.isSelected = false
                self.ownerType = "0"
              
            }
            else
            {
                self.ownerVehicleCheckBoxImage.image = checkedImage
                self.ownerDetailsMainStackView.isHidden = false
                self.mainViewHeightContraint.constant = 1430.0
                self.tableheaderheightvalue = 1430.0
                self.sizetofit()
                button.isSelected = true
                self.ownerType = "1"
            }
        }
    }
    
    @IBAction func acButtonTapped(_ sender: Any)
    {
        
        
        
        if let button = sender as? UIButton
        {
            if button.isSelected
            {
                
                acValue = "0"
                self.acCheckboxImageView.image = uncheckedImage
                button.isSelected = false
              
            }
            else
            {
                
                acValue = "1"
                self.acCheckboxImageView.image = checkedImage
                button.isSelected = true
               
            }
        }
    }
    
    @IBAction func babySeatBtnTapped(_ sender: Any)
    {
        if let button = sender as? UIButton
        {
            if button.isSelected
            {
                babySeatValue = "0"
                self.babySeatImageView.image = uncheckedImage
                button.isSelected = false
                
            }
            else
            {
                babySeatValue = "1"
                self.babySeatImageView.image = checkedImage
                button.isSelected = true
            }
        }
    }
    
    
    @IBAction func ownerChequeImageTapped(_ sender: Any)
    {
        selectiamgevalue = 3
        self.imagetapped()
    }
    
    @IBAction func cancelbtn_click(_ sender: Any) {
        hiddenview.isHidden = true
    }
 
    //MARK:- CALL API AFTER ADD VEHICLE
    //=================================
    func callApi(data: [String:AnyObject])
    {
        showLoaderWithoutBackground()
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERADDVEHICLE
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: data, requestHeader: AppConstants.dicwithpublic, imagesData: imagearray, imageParamName: imagestring, returningClass: AddVehicleModel.self)
    }
    
    func imagetapped() {
    
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
                
                selectedimage = pickedImage
                
//                imagearray.removeAll()
//                imagestring.removeAll()
                
                if self.selectiamgevalue == 1{
                    
                    numberplateimageview.image = pickedImage
                    
                    let imageData = numberplateimageview.image!.jpegData(compressionQuality: 0.5)
                    carimagenumberimage = 1
                    imagearray.append(imageData!)
                    print(imagearray)
                    imagestring.append("vehicle_number_plate_image")
                    
                    
                }
                else if self.selectiamgevalue == 2
                {
                    vehiclephotoimageview.image = pickedImage
                    
                    let imageData = vehiclephotoimageview.image!.jpegData(compressionQuality: 0.5)
                    vehicleiamgeselct = 1
                    imagearray.append(imageData!)
                    print(imagearray)
                    imagestring.append("vehicle_image")
                }
                else if self.selectiamgevalue == 3
                {
                    self.ownerChequeImageView.image = pickedImage
                    
                    let imageData = self.ownerChequeImageView.image!.jpegData(compressionQuality: 0.5)
                    self.chequeImageSelect = true
                    imagearray.append(imageData!)
                    print(imagearray)
                    imagestring.append("bank_check_image")
                }
            }
            
            dismiss(animated: true, completion: nil)
        }
        
    }

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
{
        if range.location == -1 || string == ""
        {
            return true
        }
        return Int(string) != nil
}

    extension VehicleDetailsViewController: UITableViewDelegate,UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
     
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
             if tableView.tag == 1{
            
            if checkbtnclick == 1{
            return tableCount!
            }else if checkbtnclick == 2{
             return tableCountVehiclemake!
            }else if checkbtnclick == 3{
             return tablecountvehiclemodel!
            }else{
                
                 return 0
                }
             }else{
                // if checkbtnclick == 4{
                    return tableVehicleServices!
                
            
            
            }
        
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            if tableView.tag == 1{
                 let cell: SelectVehicleTableViewCell = hiddenvehicletableview.dequeueReusableCell(withIdentifier: "hiddenvehiclecell", for: indexPath) as! SelectVehicleTableViewCell
                
                if checkbtnclick == 1{
                    
                    cell.selectvehicletype.text = mydata!.data?.vehicleType![indexPath.row].vehicleTypeName
                    
                    let tableheight = hiddenvehicletableview.contentSize.height
                    
                    if tableheight < AppConstants.screenframeheight - 200.0{
                        
                        innerviewheight.constant = tableheight + 100.0
                        
                    }else{
                        
                        innerviewheight.constant = AppConstants.screenframeheight - 200.0
                    }
                    
                   
                    
                }else if checkbtnclick == 2{
                    
                    cell.selectvehicletype.text = mydata!.data?.vehicleMake![indexPath.row].vehicleMakeName
                    
                    let tableheight = hiddenvehicletableview.contentSize.height
                    
                    if tableheight < AppConstants.screenframeheight - 200.0{
                        
                        innerviewheight.constant = tableheight + 100.0
                        
                    }else{
                        
                        innerviewheight.constant = AppConstants.screenframeheight - 200.0
                    }
                    
                   
                    
                }else if checkbtnclick == 3{
                    
                    cell.selectvehicletype.text = vehiclemodeldata.data![indexPath.row].vehicleModelName
                    
                    let tableheight = hiddenvehicletableview.contentSize.height
                    
                    if tableheight < AppConstants.screenframeheight - 200.0{
                        
                        innerviewheight.constant = tableheight + 100.0
                        
                    }else{
                        
                        innerviewheight.constant = AppConstants.screenframeheight - 200.0
                    }
                    
                    
                    
                }
                return cell
            }else{
                
                let cell1: VehicleModelDataTableViewCell = vehiclemodaldatatableview.dequeueReusableCell(withIdentifier: "vehiclemodeldatacell", for: indexPath) as! VehicleModelDataTableViewCell
                
                if checkbtnclick == 4{
                    
                    cell1.vehiclemodeldatalbl.text = mydata!.data?.vehicleType![selectindexvalue10].services![indexPath.row].serviceName
                    
                    let tableheight = vehiclemodaldatatableview.contentSize.height
                    
                    
                    if tableheight < AppConstants.screenframeheight - 200.0{
                        
                        secontableinnerviewheight.constant = tableheight + 100.0
                        
                    }else{
                        
                        secontableinnerviewheight.constant = AppConstants.screenframeheight - 200.0
                    }
                    
                    
                    if self.selectedCells.contains(indexPath.row){
                        
                        cell1.vehiclemodeldataimageview.image = UIImage(named: "icons8-checked-checkbox-filled-50") as UIImage?
                    }else{
                        cell1.vehiclemodeldataimageview.image = UIImage(named: "icons8-unchecked-checkbox-filled-50") as UIImage?
                    }
                    
                  
                  
                
            }
          
         
         return cell1
        }
            
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
            if tableView.tag == 1{
            hiddenvehicletableview.deselectRow(at: indexPath, animated: true)
            if checkbtnclick == 1{
                selectindexvalue10 = indexPath.row
                hiddenvehicletableview.reloadData()
                hiddenview.isHidden = true
                selectvehicletypeid = (mydata!.data?.vehicleType![selectindexvalue10].id)!
                vehicletype.text = (mydata!.data?.vehicleType![selectindexvalue10].vehicleTypeName)!
                tableVehicleServices = mydata.data?.vehicleType![selectindexvalue10].services!.count
            }else if checkbtnclick == 2{
                selectindexvalue11 = indexPath.row
                hiddenvehicletableview.reloadData()
                hiddenview.isHidden = true
                selectvehiclemakeid = (mydata!.data?.vehicleMake![selectindexvalue11].id)!
                selectvehiclemake.text = (mydata!.data?.vehicleMake![selectindexvalue11].vehicleMakeName)!
            }else if checkbtnclick == 3{
                selectindexvalue12 = indexPath.row
                hiddenvehicletableview.reloadData()
                hiddenview.isHidden = true
                selectvehiclemodelid = vehiclemodeldata.data![selectindexvalue12].id!
                selectvehiclemodellabel.text = vehiclemodeldata.data![selectindexvalue12].vehicleModelName
              
            }else{
                
            }
                
            }else{
                 vehiclemodaldatatableview.deselectRow(at: indexPath, animated: true)
                
                if checkbtnclick == 4{
                    selectindexvalue13 = indexPath.row
                    
//                    typeofservice.text = mydata!.data?.vehicleType![selectindexvalue10].services![selectindexvalue13].serviceName
                    
                    
                    if self.selectedCells.contains(indexPath.row) {
                        
                        self.selectedCells.remove(at: self.selectedCells.index(of: indexPath.row)!)
                        
                        
                        self.selectedCellsvalue.remove(at: self.selectedCellsvalue.index(of: (String((mydata!.data?.vehicleType![selectindexvalue10].services![selectindexvalue13].id)!)))!)
                        
                        
                        self.selectedCellsvaluename.remove(at: self.selectedCellsvaluename.index(of: ((mydata!.data?.vehicleType![selectindexvalue10].services![selectindexvalue13].serviceName)!))!)
                        
                      

                       
                    }else{
                        
                        self.selectedCellsvalue.append(String((mydata!.data?.vehicleType![selectindexvalue10].services![selectindexvalue13].id)!))
                        
                        self.selectedCells.append(indexPath.row)
                        
                        self.selectedCellsvaluename.append((mydata!.data?.vehicleType![selectindexvalue10].services![selectindexvalue13].serviceName)!)
                    }
                    
                    vehiclemodaldatatableview.reloadData()
                }
                
            }
            
        }
        }


extension VehicleDetailsViewController: ApiResponseReceiver{
    func onSuccess<T>(_ response: T) where T : Mappable {
        
    if let responseData = response as? VehicleConfigureModel{
        let data:VehicleConfigureModel = responseData
        
        mydata = data
        
        if (data.result == "1") {
            
            hideLoaderWithoutBackground()
            //hiddenview.isHidden = false
    
            
            tableCount = data.data?.vehicleType!.count
            tableCountVehiclemake = data.data?.vehicleMake!.count
            tableVehicleServices = data.data?.vehicleType![selectindexvalue10].services?.count
          //  vehiclemodaldatatableview.reloadData()
            
            print("fdbggfnm,\(tableVehicleServices)")
            
            hiddenvehicletableview.reloadData()
            
          
        }else if
            data.result == "999"{
            UserDefaultUtility.removeAllUserDefault()
            
            self.presentVC("SplashViewController")
        }else{
            
            hideLoaderWithoutBackground()
            showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            
        }
}
        
         if let responseData = response as? VehicleMakeConfigureModel{
                let new_data:VehicleMakeConfigureModel! = responseData
                let vehicleMake = new_data!.data?.vehicleMake
                mydata!.data?.vehicleMake = vehicleMake
                
                if (new_data.result == "1") {
                    
                    hideLoaderWithoutBackground()
                    //hiddenview.isHidden = false
            
                    
                    tableCountVehiclemake = new_data.data?.vehicleMake!.count
                  //  vehiclemodaldatatableview.reloadData()
                    
                    print("fdbggfnm,\(tableVehicleServices)")
                    
                          
                          hiddenview.isHidden = false
                          vehiclemodeldatahiddenview.isHidden = true
                    checkbtnclick = 2
                    hiddenvehicletableview.reloadData()
                
                  
                }else if
                    new_data.result == "999"{
                    UserDefaultUtility.removeAllUserDefault()
                    
                    self.presentVC("SplashViewController")
                }else{
                    
                    hideLoaderWithoutBackground()
                    showErrorAlert("Alert".localized, alertMessage: new_data.message!, VC: self)
                    
                }
        }
        
        
        if let responseData = response as? AddVehicleModel{
            let data:AddVehicleModel = responseData
            
            addvehicledata = data
            
            if (addvehicledata.result == "1") {
                
                hideLoaderWithoutBackground()
                //hiddenview.isHidden = false
                AppConstants.drivervehicleid = String((addvehicledata.data?.id)!)
                
                
                UserDefaultUtility.saveStringWithKey("2", key: AppConstants.UserDefaultKeys.SIGNUP_STEP)
                
                UserDefaultUtility.saveStringWithKey(String((addvehicledata.data?.id ?? 0)!), key: AppConstants.UserDefaultKeys.VEHICLE_ID)
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: UploadDocumentsViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentsViewController") as! UploadDocumentsViewController
                nextController.moveDfrom = movedFrom
                self.present(nextController, animated: false, completion: nil)
                
           //   self.presentVC("UploadDocumentsViewController")
                
            }else if
                addvehicledata.result == "999"{
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
        }
        
        
        if let responseData = response as? DriverVehicleModelModel{
            let data:DriverVehicleModelModel = responseData
            
            vehiclemodeldata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                //hiddenview.isHidden = false
                
                hiddenview.isHidden = false
                vehiclemodeldatahiddenview.isHidden = true
                checkbtnclick = 3
                
                tablecountvehiclemodel = data.data?.count
                hiddenvehicletableview.reloadData()
                
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
