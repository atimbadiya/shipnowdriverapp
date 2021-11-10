//
//  UploadDocumentsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class UploadDocumentsViewController: BaseViewController {
    
    @IBOutlet weak var vehicledocumentview: UIView!
    
    @IBOutlet weak var vehicledocumentviewheight: NSLayoutConstraint!
    @IBOutlet weak var toppersonaldocumentview: UIView!
    @IBOutlet weak var underreviewtextlbl: UILabel!
    @IBOutlet weak var headerviewheight: NSLayoutConstraint!
    @IBOutlet weak var donebtntext: UIButton!
    
    var status = 1
    var firsttableheight = 120.0
    var moveDfrom: Int = movedFromDocVer.loginScreen.rawValue
//    var vehicledocsarray = ["card", "licence"]
//    var personaldocsarray = ["aadhar","passport"]
    
    var driverdocumentlist : DriverDocumentListModel!
    var personaldoccount = 0
    var vehicledoccount = 0
    var tablecount = 0
    var secondheight = 100.0
    
    var driverid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.DRIVER_ID)
    var vehicleid = UserDefaultUtility.retrievObjectWithKey(AppConstants.UserDefaultKeys.VEHICLE_ID)

    @IBOutlet weak var documentslabel: UILabel!
    @IBOutlet weak var personaldocumentlabel: UILabel!
    @IBOutlet weak var vehicledocumentlabel: UILabel!
    @IBOutlet weak var personaldocumentstableview: UITableView!
    @IBOutlet weak var vehicledocumenttableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppConstants.drivervehicleid = vehicleid as! String
        documentslabel.text = "Documents".localized
        personaldocumentlabel.text = "Driver's Personal Documents".localized
        vehicledocumentlabel.text = "Vehicle Documents".localized
        donebtntext.setTitle("DONE".localized, for: .normal)
        
        if AppConstants.documentscreenapi == "1"{
            self.callApi()
        }else{
            self.callApi1()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if AppConstants.documentscreenapi == "1"{
            self.callApi()
        }else{
            self.callApi1()
        }
    }
    
    
    func callApi(){
        
        let dic = ["driver": self.driverid
            
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDOCUMENTLIST
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: DriverDocumentListModel.self)
    }
    
    func callApi1(){
        
        let dic = ["driver": self.driverid,
                   "driver_vehicle": vehicleid
            
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.VEHICLEDRIVERDOCUMENTLIST
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: DriverDocumentListModel.self)
    }
    
    
    @IBAction func donebtnclick(_ sender: Any) {
        
        let statusvalue = driverdocumentlist.data?.docinfo?.verificationstatus ?? "0"
        if statusvalue == "0" || statusvalue == "3"{
            
         self.showErrorAlert(driverdocumentlist.data?.docinfo?.title ?? "Documents Not uploaded".localized, alertMessage: driverdocumentlist.data?.docinfo?.dialogmessage ?? "Please upload required document first!".localized, VC: self)
        }else{
            
            // self.showErrorAlert("Document Under Review!".localized, alertMessage: "You document is in under review, we will notify you soon after verifying your document".localized, VC: self)
            let dic = ["driver": self.driverid
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERWAITING
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic, requestHeader: AppConstants.dicwithpublic, returningClass: DriverDocumentListModel.self)
            
            let alertController = UIAlertController(title: driverdocumentlist.data?.docinfo?.title ?? "Document Under Review!".localized, message: driverdocumentlist.data?.docinfo?.dialogmessage ?? "You document is in under review, we will notify you soon after verifying your document".localized, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                switch self.moveDfrom {
                case 0,2:
                    self.dismissVC()
                case 3,4,5:
                    self.presentingViewController?.presentingViewController?.dismissVC()
                case 1 :
                    self.presentingViewController?.presentingViewController?.presentingViewController?.dismissVC()
                default:
                    self.dismissVC()
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        AppConstants.documentscreenapi = "1"
        switch moveDfrom {
        case 0,2:
            self.dismissVC()
        case 3,4,5:
            self.presentingViewController?.presentingViewController?.dismissVC()
        case 1 :
            self.presentingViewController?.presentingViewController?.presentingViewController?.dismissVC()
        default:
            self.dismissVC()
        }
    }
}

extension UploadDocumentsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1{
            return personaldoccount
            
        }else{
            if vehicledoccount == 0 {
                vehicledocumentview.isHidden = true
            } else {
                vehicledocumentview.isHidden = false
            }
            return vehicledoccount
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1{
            
            let cell1 = personaldocumentstableview.dequeueReusableCell(withIdentifier: "personaldocs", for: indexPath) as! PersonalDocsTableViewCell
            
            cell1.personaldocumenttypelabel.text = driverdocumentlist.data?.personal![indexPath.row].documentname
            
            let documentverificationid = driverdocumentlist.data?.personal![indexPath.row].documentVerificationStatus ?? 0
            
            if driverdocumentlist.data?.personal?[indexPath.row].documentNeed == 1
            {
                cell1.mandatoryLabel.isHidden = false
            }
            else
            {
                cell1.mandatoryLabel.isHidden = true
            }
            
            if documentverificationid == 0{
                
                cell1.personaluploaddocument.text = "Upload Document".localized
                
            }
            if documentverificationid == 1{
                
                cell1.personaluploaddocument.text = "Verification Pending".localized
            }
            if documentverificationid == 2{
                
                cell1.personaluploaddocument.text = "Verified".localized
                
            }
            if documentverificationid == 3{
                
                cell1.personaluploaddocument.text = "REJECTED".localized
            }
            
           let tableheight = personaldocumentstableview.contentSize.height
            
            print("dvbfmn,g\(tableheight)")
            
            firsttableheight = Double(tableheight + CGFloat(secondheight))

//            print(tableheight)
            headerviewheight.constant = tableheight + CGFloat(secondheight)

            let headerView = vehicledocumenttableview.tableHeaderView!

            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()

            var frame = headerView.frame
            frame.size.height = CGFloat(firsttableheight)
            headerView.frame = frame

            vehicledocumenttableview.tableHeaderView = headerView
           
            return cell1
            
        }else{
            
             let cell = vehicledocumenttableview.dequeueReusableCell(withIdentifier: "vehicledocs", for: indexPath) as! VehicleDocsTableViewCell
            
            cell.vehicledocnamelabel.text = driverdocumentlist.data?.vehicle![indexPath.row].documentname
            
            let documentverificationid = driverdocumentlist.data?.vehicle![indexPath.row].documentVerificationStatus ?? 0
            
            if driverdocumentlist.data?.vehicle?[indexPath.row].documentNeed == 1
            {
                cell.mandatoryLabel.isHidden = false
            }
            else
            {
                cell.mandatoryLabel.isHidden = true
            }
            
            if documentverificationid == 0{
                
                cell.vehicleuploaddoclabel.text = "Upload Document".localized
                
            }
            if documentverificationid == 1{
                
                cell.vehicleuploaddoclabel.text = "Verification Pending".localized
            }
            if documentverificationid == 2{
                
                cell.vehicleuploaddoclabel.text = "Verified".localized
            }
            
            if documentverificationid == 3{
                
                cell.vehicleuploaddoclabel.text = "REJECTED".localized
            }
            
            if personaldoccount == 0{
                
              //  headerviewheight.constant = 40.0
                vehicledocumentviewheight.constant = 50.0
                firsttableheight = Double(0.0 + 50.0)
                let headerView = vehicledocumenttableview.tableHeaderView!
                headerView.setNeedsLayout()
                headerView.layoutIfNeeded()
                
                var frame = headerView.frame
                frame.size.height = CGFloat(firsttableheight)
                headerView.frame = frame
                
                vehicledocumenttableview.tableHeaderView = headerView
            }else{
                
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.tag == 1{
            personaldocumentstableview.deselectRow(at: indexPath, animated: true)
             AppConstants.selecteddocumentId = String((driverdocumentlist.data?.personal![indexPath.row].id)!)
            
            AppConstants.documentstatus = String((driverdocumentlist.data?.personal![indexPath.row].expireDate)!)
            
             let documentverificationid = driverdocumentlist.data?.personal![indexPath.row].documentVerificationStatus ?? 0
            
            if documentverificationid == 0{
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
                next.viewcontrollerself = self
                // next.movefrom = "documentphoto"
                 next.comefrompersonal = "1"
                AppConstants.managedocumenttype = "1"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
                
            }
            if documentverificationid == 1{
                
            }
            if documentverificationid == 2{
                
            }
            if documentverificationid == 3{
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
                next.viewcontrollerself = self
               
                 next.comefrompersonal = "1"
                AppConstants.managedocumenttype = "1"
                // next.movefrom = "documentphoto"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
                
            }
        }else{
            
             vehicledocumenttableview.deselectRow(at: indexPath, animated: true)
             AppConstants.selecteddocumentId = String((driverdocumentlist.data?.vehicle![indexPath.row].id)!)
            
            AppConstants.documentstatus = String((driverdocumentlist.data?.vehicle![indexPath.row].expireDate)!)
            
            AppConstants.drivervehicleid = String((driverdocumentlist.data?.vehicle![indexPath.row].drivervehicleID)!)
            
            
            let documentverificationid = driverdocumentlist.data?.vehicle![indexPath.row].documentVerificationStatus ?? 0
            
            if documentverificationid == 0{
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
                next.viewcontrollerself = self
                 next.comefrompersonal = "2"
                AppConstants.managedocumenttype = "1"
                // next.movefrom = "documentphoto"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
                
            }
            if documentverificationid == 1{
                
            }
            if documentverificationid == 2{
                
            }
            if documentverificationid == 3{
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
                next.viewcontrollerself = self
                 next.comefrompersonal = "2"
                AppConstants.managedocumenttype = "1"
                // next.movefrom = "documentphoto"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
                
            }
        }
    }
}


extension UploadDocumentsViewController: ApiResponseReceiver{
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverDocumentListModel{
            let data:DriverDocumentListModel = responseData
            
            driverdocumentlist = data
            
            if (driverdocumentlist.result == "1") {
                
                hideLoaderWithoutBackground()
                //hiddenview.isHidden = false
                
                personaldoccount = (driverdocumentlist.data?.personal?.count)!
                vehicledoccount = (driverdocumentlist.data?.vehicle?.count)!
                
                if personaldoccount == 0{
                    toppersonaldocumentview.isHidden = true
                 //   headerviewheight.constant = 50.0
                  //  secondheight = 50.0
                    
                }else{
                    toppersonaldocumentview.isHidden = false
                    headerviewheight.constant = 130.0
                  //  secondheight = 100.0
                }
                
                tablecount = personaldoccount + vehicledoccount
                
                underreviewtextlbl.text = driverdocumentlist.data?.docinfo?.message
                underreviewtextlbl.textColor = PListUtility.getColorFromHex(hexString: "#" + (driverdocumentlist.data?.docinfo?.color!)!)
                personaldocumentstableview.reloadData()
                vehicledocumenttableview.reloadData()
                
                
                
//                hiddenview.isHidden = false
//                vehiclemodeldatahiddenview.isHidden = true
//                checkbtnclick = 3
//                
//                tablecountvehiclemodel = data.data?.count
//                hiddenvehicletableview.reloadData()
                
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
