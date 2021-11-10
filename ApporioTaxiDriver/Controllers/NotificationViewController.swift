//
//  NotificationViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 28/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class NotificationViewController: BaseViewController {
    
    @IBOutlet weak var toppromotiontextlbl: UILabel!
    
    @IBOutlet weak var notificationtableview: UITableView!
    
    var notificationdata: NotificationModel!
    
     var size = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toppromotiontextlbl.text = "Promotions".localized
        
        
        AppConstants.notificationvalue = "1"
        
        showLoaderWithoutBackground()
        
       AppConstants.dialogopen = "0"
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERPROMOTIONNOTIFICATION
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: NotificationModel.self)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backbtnclick(_ sender: Any) {
        AppConstants.notificationvalue = ""
          self.dismissVC()
    }
    

}


extension NotificationViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return size
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = notificationtableview.dequeueReusableCell(withIdentifier: "notificationcell", for: indexPath) as! NotficationTableViewCell
        
        cell.labeltext.text = notificationdata.data![indexPath.row].message ?? ""
        
        cell.headinglabel.text = notificationdata.data![indexPath.row].title ?? ""
        
        let newString = notificationdata.data![indexPath.row].image ?? ""
        
            
            if newString == ""{
                cell.imageviewheight.constant = 0
            }
            else
            {
                AppConstants.downloadimage(imagename: newString, imageview: cell.imageview, placeholderimage: "mandy")
            }
        
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        notificationtableview.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("Row: \(row)")
        
        
        
        if (notificationdata.data![indexPath.row].url == "")
        {
            
            
        }else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myModalViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController")as! WebViewController
            myModalViewController.weblinkurl = notificationdata.data![indexPath.row].url!
            self.present(myModalViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}


extension NotificationViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? NotificationModel{
            
            let data:NotificationModel = responseData
            
            self.notificationdata = data
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                if(notificationdata.result == "0"){
                   
                    self.toastLabel.isHidden = true
                    
                    size = 0
                    
                }else{
                  
                    self.toastLabel.isHidden = true
                    
                    size = (notificationdata.data?.count)!
                    
                }
                
                notificationtableview.reloadData()
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                hideLoaderWithoutBackground()
                //showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
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
