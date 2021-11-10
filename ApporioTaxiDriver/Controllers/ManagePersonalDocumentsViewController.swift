//
//  ManagePersonalDocumentsViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/9/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ManagePersonalDocumentsViewController: BaseViewController {
    
    var personaldoccount = 0
    var vehicledoccount = 0
    
    var managedocdata: DriverPersonalDocumentModel!
    
    @IBOutlet weak var managedocstopview: UIView!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var managedocslbl: UILabel!
    @IBOutlet weak var managedocstableview: UITableView!
    
    @IBOutlet weak var vehicledocumentviewheight: NSLayoutConstraint!
   
    @IBOutlet weak var headerviewheight: NSLayoutConstraint!
    
    
    @IBOutlet weak var personaldocumenttextlbl: UILabel!
    
    @IBOutlet weak var toppersonaldocumentview: UIView!
    
    var firsttableheight = 120.0
  
    @IBOutlet weak var vehicledocumentlabel: UILabel!
   
    @IBOutlet weak var vehicledocumenttableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedocslbl.text = "Manage Personal Documents".localized
  
        showLoaderWithoutBackground()
        
        let dic1 = [:] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERPERSONALDOCUMENTS
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverPersonalDocumentModel.self)
        
    }
    
    
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
}

extension ManagePersonalDocumentsViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1{
            return personaldoccount
            
        }else{
            if vehicledoccount == 0 {
              //  vehicledocumentview.isHidden = true
            } else {
             //   vehicledocumentview.isHidden = false
            }
            return vehicledoccount
            
        }
        
        
       // return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView.tag == 1{
        
        let cell = managedocstableview.dequeueReusableCell(withIdentifier: "managepersonaldocs", for: indexPath) as! ManagePresonalDocsTableViewCell
        
        cell.managedocmainview.edgeWithShadow(edge: 4.0)
        
        let newString = managedocdata.data![indexPath.row].image
        
        AppConstants.downloadimage(imagename: newString!, imageview: cell.managedocdriverimgview, placeholderimage: "mandy")

        cell.idnamelbl.text = managedocdata.data![indexPath.row].documentname
        cell.uploaddatelbl.text = managedocdata.data![indexPath.row].uploadedAt
            cell.expierydatelbl.text = managedocdata.data![indexPath.row].expireDate ?? ""
        cell.verificationstatuslbl.text = managedocdata.data![indexPath.row].status
        cell.verificationstatuslbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((managedocdata.data![indexPath.row].statusColor)!))
      
        return cell
            
        }else{
            
             let cell = vehicledocumenttableview.dequeueReusableCell(withIdentifier: "managevehicledocs", for: indexPath) as! ManageVehicleDocsTableViewCell
            
            
//            cell.managedocmainview.edgeWithShadow(edge: 4.0)
//
//            let newString = managedocdata.vehicleDocument.vehicleDocuments![indexPath.row].
//
//            AppConstants.downloadimage(imagename: newString!, imageview: cell.managedocdriverimgview, placeholderimage: "mandy")
//
//            cell.idnamelbl.text = managedocdata.data![indexPath.row].documentname
//            cell.uploaddatelbl.text = managedocdata.data![indexPath.row].uploadedAt
//            cell.expierydatelbl.text = managedocdata.data![indexPath.row].expireDate ?? ""
//            cell.verificationstatuslbl.text = managedocdata.data![indexPath.row].status
//            cell.verificationstatuslbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((managedocdata.data![indexPath.row].statusColor)!))
//
//
//
//
            return cell
            
        }
      
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        managedocstableview.deselectRow(at: indexPath, animated: true)
        
        
        AppConstants.selecteddocumentId = String((managedocdata.data![indexPath.row].id)!)
        
        AppConstants.documentstatus = "1"
        
        
        let documentstatus = String((managedocdata.data![indexPath.row].documentVerificationStatus ?? 0)!)
        
        
        if managedocdata.data![indexPath.row].tempdocupload!{
            
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
            next.viewcontrollerself = self
            // next.movefrom = "documentphoto"
            next.comefrompersonal = "1"
            next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(next, animated: true, completion: nil)
            
        }else{
        
        
        
        if documentstatus == "2" || documentstatus == "1"{
            
            
        }else{
        
   
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
            next.viewcontrollerself = self
            // next.movefrom = "documentphoto"
            next.comefrompersonal = "1"
            next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(next, animated: true, completion: nil)
        }
            
        }
      
    }

}

extension ManagePersonalDocumentsViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? DriverPersonalDocumentModel{
    let data:DriverPersonalDocumentModel = responseData
    
    managedocdata = data
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
        
        personaldoccount = (data.data?.count)!
        
        managedocstableview.reloadData()
        
    }
    else if data.result == "999" {
        
        UserDefaultUtility.removeAllUserDefault()
        
        self.presentVC("SplashViewController")
    }else{
        hideLoaderWithoutBackground()
        // showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
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

