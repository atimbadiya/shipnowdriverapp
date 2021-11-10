//
//  RideFareViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/8/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import StarryStars
import SkyFloatingLabelTextField
import ObjectMapper

class RideFareViewController: BaseViewController,RatingViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var inputableview: UITableView!
    @IBOutlet weak var maintoptableview: UITableView!
    @IBOutlet weak var dynamicviewheight: NSLayoutConstraint!
    @IBOutlet weak var inputtableheight: NSLayoutConstraint!
    @IBOutlet weak var driveryesbtnviewheight: NSLayoutConstraint!
    @IBOutlet weak var driveryesbtntext: UIButton!
    @IBOutlet weak var driveryesbtninnerview: UIView!
    
    @IBOutlet weak var driveryesviewtext: UILabel!
    
    @IBOutlet weak var driveryesbtnview: UIView!
    
    var textfldValueArray: [Int] = []
    
    var fieldIdArray: [Int] = []
    
    var driverrecieptdata: DriverRecieptModel!
    var selectindexvalue = 0
    var tablecount:Int?
    var inputCount:Int?
    var ratingValue: String = ""
    var rating: Float = 0.0
    
    
    
    var strJsonData : String = ""
    var pidarray:NSMutableArray = []
    
    var fieldId: Int?
    
    var tableheaderheightvalue = 800
    
    @IBOutlet weak var dynamicbillmainview: UIView!
    @IBOutlet weak var dynamicbilllbl: UILabel!
    @IBOutlet weak var maxbillamountlbl: UILabel!
//    @IBOutlet weak var totalfarelbl: UILabel!
//    @IBOutlet weak var enteramountvalurtxtfld: UITextField!
    @IBOutlet weak var timevaluelbl: UILabel!
    @IBOutlet weak var kmvaluelbl: UILabel!
    @IBOutlet weak var cashtobecollectedview: UIView!
    @IBOutlet weak var cashtobecollectedlbl: UILabel!
    @IBOutlet weak var bottombtnview: UIView!
    @IBOutlet weak var bootomlbl: UILabel!
    @IBOutlet weak var detailsmainview: UIView!
    @IBOutlet weak var pleaseconfirnlbl: UILabel!
    @IBOutlet weak var servicetypelbl: UILabel!
    @IBOutlet weak var carimageview: UIImageView!
    @IBOutlet weak var carnamelbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var locationview: UIView!
    @IBOutlet weak var viewrecieptview: UIView!
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var stackpickupview: UIView!
    @IBOutlet weak var stackdropview: UIView!
    @IBOutlet weak var picklbl: UILabel!
    @IBOutlet weak var pickuplocationlbl: UILabel!
    @IBOutlet weak var droplbl: UILabel!
    @IBOutlet weak var droplocationlbl: UILabel!
    @IBOutlet weak var viewrecieptlbl: UILabel!
    @IBOutlet weak var hiddenrecieptview: UIView!
    @IBOutlet weak var hiddenrecieptinnerview: UIView!
    @IBOutlet weak var hiddenrecieptlbl: UILabel!
    @IBOutlet weak var hiddenrecieptkmtimeview: UIView!
    //@IBOutlet weak var hiddenrecieptbilldetailslbl: UILabel!
    @IBOutlet weak var hiddenreciepttableview: UITableView!
    @IBOutlet weak var hiddenratingview: UIView!
    @IBOutlet weak var hiddenratinginnerview: UIView!
    @IBOutlet weak var rateuserlbl: UILabel!
    @IBOutlet weak var driverrating: RatingView!
    //    @IBOutlet weak var hidddenratingview: RatingView!
    @IBOutlet weak var hiddenratingcommenttxtfld: SkyFloatingLabelTextField!
    @IBOutlet weak var hiddenratingsubmitbtn: UIButton!
    @IBOutlet weak var innerviewheight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        driveryesbtnviewheight.constant = 0.0
        
       driveryesbtninnerview.edgeWithOutShadow(edge: 8)
        
        inputableview.delegate = self
        inputableview.dataSource = self
        driveryesbtnview.isHidden = true
        driveryesbtnview.edgeWithShadow(edge: 8)
        AppConstants.trackingscreenvalue = ""
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
       
        //enteramountvalurtxtfld.delegate = self
        dynamicbillmainview.edgeWithShadow(edge: 5.0)
        detailsmainview.edgeWithShadow(edge: 5.0)
        locationview.edgeWithShadow(edge: 5.0)
        viewrecieptview.edgeWithShadow(edge: 5.0)
        carimageview.makeViewCircular()
        bottombtnview.edgeWithShadow(edge: 5.0)
        tablecount = 0
        inputCount = 0
        
        pleaseconfirnlbl.text = "Please confirm this reciept with the customer".localized
        picklbl.text = "Pick".localized
        droplbl.text = "Drop".localized
        viewrecieptlbl.text = "View Receipt".localized
        hiddenrecieptlbl.text = "Receipt".localized
        rateuserlbl.text = "Rate User".localized
        hiddenratingcommenttxtfld.placeholder = "Comment(If Any)".localized
        hiddenratingsubmitbtn.setTitle("Submit".localized, for: .normal)
        //enteramountvalurtxtfld.placeholder = "Enter Amount".localized
        
    self.hiddenrecieptview.isHidden = true
    self.hiddenratingview.isHidden = true
        
        driverrating.editable = true
        driverrating.delegate = self
        
        showLoaderWithoutBackground()
        
        let dic1 = ["booking_id":AppConstants.bookingid as AnyObject,
                    
            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERRECIEPT
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverRecieptModel.self)
        
    }
    
    
    
    @IBAction func driveryesbtnclick(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title:  "", message: driverrecieptdata.data?.holderDriverRidePayment?.dialogText ?? "Are you sure to complete this ride".localized, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Confirm".localized , style: .default, handler: { (action: UIAlertAction!) in
            
            
            self.showLoaderWithoutBackground()
            
            let dic1 = ["booking_id":AppConstants.bookingid as AnyObject,
                        
                        ] as [String : AnyObject]
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.RIDEPAYMENTSTATUS
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DeleteCardModel.self)
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel".localized, style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
  
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    func ratingView(_ ratingView: RatingView, didChangeRating newRating: Float) {
        print("newRating: \(newRating)")
        rating = newRating
        ratingValue = String(rating)
        
    }
    
    @IBAction func btninbill_click(_ sender: Any) {
        
      
        self.showErrorAlert("", alertMessage: (driverrecieptdata.data?.holderInputInfo?.fields![0].fieldInfo ?? "")!, VC: self)
        
    }
   
    @IBAction func hiderecieptbackbtn_click(_ sender: Any) {
        
        hiddenrecieptview.isHidden = true
        
    }
    @IBAction func hiddenratingsubmitbtn_click(_ sender: Any) {
        
        if ratingValue == "0.0"{
            showErrorAlert("Alert".localized, alertMessage: "Please Give Rating First".localized, VC: self)
        }else{
        
        showLoaderWithoutBackground()
        
        let dic1 = ["booking_id": AppConstants.bookingid as AnyObject,
                    "rating": ratingValue,
                    "comment": hiddenratingcommenttxtfld.text!
            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERRATING
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverRatingModel.self)
        
        }
    }
    @IBAction func viewtecieptbtn_click(_ sender: Any) {
        self.hiddenrecieptview.isHidden = false
        self.hiddenratingview.isHidden = true
    }
    @IBAction func completebottombtn_click(_ sender: Any) {
        
        if driverrecieptdata.data?.bottomButton?.action ?? "" == "INPUT_PRICES"{
            
            var nsdic : [String: AnyObject] = [:]
            
            //if textfldValueArray[i] == -1 {

                if textfldValueArray.contains(-1) {
                    
                showErrorAlert("Alert".localized, alertMessage: "Please Fill All Required Fields".localized, VC: self)

            }else
            {

                pidarray.removeAllObjects()
                strJsonData.removeAll()

                for i in 0...inputCount! - 1 {
                
                nsdic.updateValue(fieldIdArray[i] as AnyObject, forKey: "parameter")
                nsdic.updateValue(textfldValueArray[i] as AnyObject, forKey: "amount")
                
                print(nsdic)
                pidarray.add(nsdic)
                strJsonData = json(from: pidarray)!
                    
                }
//                print(pidarray)
//                print(strJsonData)
            
                let dic1 = ["booking_id":AppConstants.bookingid as AnyObject,
                            "input_values":strJsonData

                    ] as [String : AnyObject]

                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCLOSE
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCloseModel.self)

            }
            


        }else if driverrecieptdata.data?.bottomButton?.action ?? "" == "COMPLETE"{
        
            
            let dic1 = ["booking_id":AppConstants.bookingid as AnyObject
                        
                ] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCLOSE
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCloseModel.self)
            
            
        }else{
            
            
            if (driverrecieptdata.data?.paymentHolder?.amountchange)!{
                
                let refreshAlert = UIAlertController(title: "", message: "Do you want to add change amount to rider's wallet".localized, preferredStyle: UIAlertController.Style.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "YES".localized , style: .default, handler: { (action: UIAlertAction!) in
                    
                    let alertController = UIAlertController(title: self.driverrecieptdata.data?.paymentHolder?.amountchangetext ?? "Enter Change Amount To Send User", message: "", preferredStyle: .alert)
                    
                    //the confirm action taking the inputs
                    let confirmAction = UIAlertAction(title: "Done".localized, style: .default) { (_) in
                        
                        //getting the input values from user
                        
                        
                        let textField = alertController.textFields![0] as UITextField
                        textField.keyboardType = UIKeyboardType.decimalPad
                        
                        let value = textField.text!
                        
                    
                        
                        let dic1 = ["booking_id":AppConstants.bookingid,
                             "amount":value] as [String : AnyObject]
                        
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SendMoneyToUserURL
                        ServiceManager.sharedInstance.delegate = self                        
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverLogout.self)
                        //            self.checkoutApi()
                    }
                    
                    //the cancel action doing nothing
                    let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel) { (_) in
                        
                        //            self.checkoutApi()
                    }
                    
                    //adding textfields to our dialog box
                    alertController.addTextField { (textField) in
                        textField.placeholder = "Enter amount".localized
                    }
                    
                    //adding the action to dialogbox
                    alertController.addAction(confirmAction)
                    alertController.addAction(cancelAction)
                    
                    //finally presenting the dialog box
                    self.present(alertController, animated: true, completion: nil)
                    
                   
                    
                }))
                
                
                refreshAlert.addAction(UIAlertAction(title: "NO".localized, style: .default, handler: { (action: UIAlertAction!) in
                    
                    
                    self.hiddenratingview.isHidden = false
                    self.hiddenrecieptview.isHidden = true
                   
                    
                    
                }))
                
                present(refreshAlert, animated: true, completion: nil)
                
                
                
            }else{


            self.hiddenratingview.isHidden = false
            self.hiddenrecieptview.isHidden = true


            }
            
        }
        }
    
    @objc func infoBtn(_ Sender: UIButton){
        
        let fieldInfonew = driverrecieptdata.data?.holderInputInfo?.fields?[Sender.tag].fieldInfo ?? ""
        
        showErrorAlert("", alertMessage: fieldInfonew, VC: self)
        
    }
    
    func sizetofit(){
        
        let headerView = maintoptableview.tableHeaderView!
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        var frame = headerView.frame
        frame.size.height = CGFloat(tableheaderheightvalue)
        headerView.frame = frame
        
        maintoptableview.tableHeaderView = headerView
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let cell: UITableViewCell = textField.superview?.superview as! UITableViewCell
        let table: UITableView = cell.superview as! UITableView
        let textFieldIndexPath = table.indexPath(for: cell)
        
        print(textFieldIndexPath![1])
        
        let textfieldText = textField.text
        let textfieldText1 = Int(textfieldText!)
        
        if textfieldText1 == Int(""){
        }else{
        textfldValueArray[textFieldIndexPath![1]] = textfieldText1!
        }
        print(textfldValueArray)
        
//        if textField == driverrecieptdata.data?.holderInputInfo?.fields?[] {
//
//            bottombtnview.isHidden = false
//
//        }else
//        {
//            bottombtnview.isHidden = true
//        }
    }
    
}

extension RideFareViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print(AppConstants.driverconfiguredata.data?.countries?.count)
        
        if tableView.tag == 1{
            
            return inputCount!
            
        }else{
            print(tablecount)
            return (tablecount)!
        }
   
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1{
            let cell1 = inputableview.dequeueReusableCell(withIdentifier: "inputbydriver", for: indexPath) as! InputByDriverTableViewCell
            
            cell1.amounttextfield.delegate = self
            cell1.amounttextfield.tag = indexPath.row
            
//            if let field = driverrecieptdata.data?.holderInputInfo?.fields?[indexPath.row].fieldId{
//                let fieldId = field
//            }
            
            cell1.amounttypelabel.text = driverrecieptdata.data?.holderInputInfo?.fields?[indexPath.row].fieldName ?? ""
            
            cell1.amounttextfield.placeholder = driverrecieptdata.data?.holderInputInfo?.fields?[indexPath.row].fieldHint ?? ""
            fieldIdArray[indexPath.row] = (driverrecieptdata.data?.holderInputInfo?.fields?[indexPath.row].fieldId)!
            
            let tableheight = inputableview.contentSize.height
            
            inputtableheight.constant = tableheight + 75
            dynamicviewheight.constant = tableheight + 150
            
            if indexPath.row == 0{
            tableheaderheightvalue += Int(tableheight)
            }else{
            tableheaderheightvalue += 28
            }
            
            sizetofit()
//            print(tableheight)
//            print(tableheaderheightvalue)
//            print(textfldValueArray.count)
//            print(textfldValueArray[indexPath.row])
            //fieldInfo =
            //textfldValueArray[indexPath.row] = fieldId!
            
            cell1.infobtn.tag = indexPath.row
            cell1.infobtn.addTarget(self, action: #selector(RideFareViewController.infoBtn(_:)), for: .touchUpInside)
            
            //cell1.amounttextfield.placeholder
            
//            cell1.amounttypelabel.text = driverrecieptdata.data?.holderInputInfo?.fields?[indexPath.row].fieldName
          
            return cell1
            
        }else{
        
        let cell = hiddenreciepttableview.dequeueReusableCell(withIdentifier: "ridefarecell", for: indexPath) as! RideFareTableViewCell
        
        //hiddenreciepttableview.backgroundColor = UIColor.green
        
        cell.billtypename.text = driverrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].highlightedText
        cell.pricelbl.text = driverrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].valueText
        print(driverrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].valueText)
        
        let tableheight = hiddenreciepttableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            innerviewheight.constant = tableheight + 100.0
            
        }else{
            
            innerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        //selectservicetableview.reloadData()
        //hiddenreciepttableview.reloadData()
        return cell
        
    }
    }
    
  
}



extension RideFareViewController: ApiResponseReceiver {
   
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        if let responseData = response as?  DriverLogout{
            let data:DriverLogout = responseData
            
            if (data.result == "1"){
                 hideLoaderWithoutBackground()
                self.hiddenratingview.isHidden = false
                self.hiddenrecieptview.isHidden = true
            }else{
                 hideLoaderWithoutBackground()
                self.showErrorAlert("", alertMessage: data.message ?? "Please try again".localized, VC: self)
            }
            
            
        }
        
        
        if let responseData = response as? DeleteCardModel{
            let data:DeleteCardModel = responseData
            
            
            if (data.result == "1") {
                
                 hideLoaderWithoutBackground()
                
                showLoaderWithoutBackground()
                
                let dic1 = ["booking_id":AppConstants.bookingid as AnyObject,
                            
                            ] as [String : AnyObject]
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERRECIEPT
                ServiceManager.sharedInstance.delegate = self
                print(apiRequestUrl)
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverRecieptModel.self)
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
            
        }

    if let responseData = response as? DriverRecieptModel{
    let data:DriverRecieptModel = responseData
        
        driverrecieptdata = data
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
        
        tablecount = driverrecieptdata.data?.holderRideInfo?.staticValues?.count
      
        hiddenreciepttableview.reloadData()
        
        if (data.data?.holderDriverRidePayment?.visiblity)!{

             driveryesbtnview.isHidden = false
            driveryesbtnviewheight.constant = 50.0

            driveryesviewtext.text = data.data?.holderDriverRidePayment?.message ?? ""
            driveryesbtntext.setTitle(data.data?.holderDriverRidePayment?.buttonText ?? "", for: .normal)


        }else{
            driveryesbtnviewheight.constant = 0.0
             driveryesbtnview.isHidden = true

        }

      
         cashtobecollectedlbl.text = data.data?.paymentHolder?.text ?? "Cash To Be Collected".localized
        
      
        
        if ((data.data?.holderRideInfo?.circularTextVisibility)!){
            
        self.servicetypelbl.text = data.data?.holderRideInfo?.circularTextOne
        self.carnamelbl.text = data.data?.holderRideInfo?.circularText
        self.servicetypelbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.holderRideInfo?.circularTextColor)!))
        self.carnamelbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.holderRideInfo?.circularTextColor)!))
        
        }
          else{
            
        }
        if ((data.data?.holderRideInfo?.circularImageVisibility)!){
            
            let newString = data.data?.holderRideInfo?.circularImage
            
            AppConstants.downloadimage(imagename: newString!, imageview: carimageview, placeholderimage: "mandy")
        }else{
            
            
        }
        if ((data.data?.holderRideInfo?.valueTextVisibility)!){
            
        self.pricelbl.text = data.data?.holderRideInfo?.valueText
        self.pricelbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.holderRideInfo?.valueTextColor)!))
        }else{
            
        }
        if ((data.data?.holderRideInfo?.pickLocationVisibility)!){
            
            self.pickuplocationlbl.text = data.data?.holderRideInfo?.pickLocaion
            
        }else{
            
        }
        if ((data.data?.holderRideInfo?.dropLocationVisibility)!){
            
            self.droplocationlbl.text = data.data?.holderRideInfo?.dropLocation
            
        }else{
            
        }
        if ((data.data?.holderRideInfo?.leftTextVisibility)!){
            
            self.kmvaluelbl.text = data.data?.holderRideInfo?.leftText
            self.kmvaluelbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.holderRideInfo?.leftTextColor)!))
           // self.kmvaluelbl.font = UIFont((data.data?.holderRideInfo?.leftTextStyle)!)
            self.timevaluelbl.text = data.data?.holderRideInfo?.rightText
            self.timevaluelbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.holderRideInfo?.rightTextColor)!))
            
        }else{
            
        }
        
        
        
        if data.data?.bottomButton?.action ?? "" == "INPUT_PRICES"{
            
            
            bottombtnview.isHidden = false
            dynamicbillmainview.isHidden = false
          //  fieldId = data.data?.holderInputInfo?.fields![0].fieldId

            bottombtnview.isHidden = false
            self.bootomlbl.text = data.data?.bottomButton?.text ?? "Complete"
            self.bottombtnview.backgroundColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.bottomButton?.textBackGroundColor ?? "2980b9")!))
            
            inputCount = driverrecieptdata.data?.holderInputInfo?.fields?.count
            
            for i in 0...inputCount! - 1{
                textfldValueArray.append(-1)
                fieldIdArray.append(0)
            }
            
            inputableview.reloadData()
            
            
            if ((data.data?.holderInputInfo?.headlineMajorVisibility)!){
                
                
                dynamicbilllbl.text = data.data?.holderInputInfo?.headlineMajor
                self.dynamicbilllbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.holderInputInfo?.headlineMajorColor)!))
                //self.dynamicbilllbl.font = UIFont(data.data?.holderInputInfo?.headlineMajorStyle)
            }else{
                
            }
            
            if ((data.data?.holderInputInfo?.headlineSmallTextVisibility)!){
                
                maxbillamountlbl.text = data.data?.holderInputInfo?.headlineSmallText
                self.maxbillamountlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.holderInputInfo?.headlineSmallTextColor)!))
                //maxbillamountlbl = UIFont(data.data?.holderInputInfo?.)
            }else{
                
            }
            
           
            
        }else if data.data?.bottomButton?.action ?? "" == "COMPLETE"{
            
            bottombtnview.isHidden = false
            
            self.bootomlbl.text = data.data?.bottomButton?.text ?? "Complete"
            self.bottombtnview.backgroundColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.bottomButton?.textBackGroundColor ?? "2980b9")!))
            dynamicbillmainview.isHidden = true
            
        }else
        {
            dynamicbillmainview.isHidden = true
            
            if ((data.data?.bottomButton?.visibility)!){
                bottombtnview.isHidden = false
                self.bootomlbl.text = data.data?.bottomButton?.text ?? "Complete"
                self.bottombtnview.backgroundColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.bottomButton?.textBackGroundColor ?? "2980b9")!))
                
            }else{
                bottombtnview.isHidden = true
            }
            
        }
        
        
    }else if data.result == "999" {
        
        UserDefaultUtility.removeAllUserDefault()
        
        self.presentVC("SplashViewController")
    }else{
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
    }
}
        if let responseData = response as? DriverRatingModel{
            let data:DriverRatingModel = responseData
            
           // driverrecieptdata = data
            
            if (data.result == "1") {
                
               // hideLoaderWithoutBackground()
                
                showLoaderWithoutBackground()
                
                
                
                let dic1 = ["booking_id":AppConstants.bookingid as AnyObject
                            
                            ] as [String : AnyObject]
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCLOSE
                ServiceManager.sharedInstance.delegate = self
                print(apiRequestUrl)
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCloseModel.self)
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        if let responseData = response as? DriverCloseModel{
            let data:DriverCloseModel = responseData
            
            // driverrecieptdata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                pidarray.removeAllObjects()
                strJsonData.removeAll()
                
              //  self.presentVC("OnlineViewController")
                
                self.view.window?.rootViewController?.dismiss(animated: true, completion: {
                    AppConstants.viewcontrollerself.viewDidLoad()
                })
              
            }else if data.result == "999" {
                
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
}
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }

}
