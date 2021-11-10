//
//  SuperDriverViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 3/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class SuperDriverViewController: BaseViewController {
    
    var currentdate: String = "yyyy-MM-dd"
    
    var tablecount: Int?
    
    var superdriverdata: SuperDriverModel!

    @IBOutlet weak var superdrivertableview: UITableView!
    @IBOutlet weak var superdrivertoplbl: UILabel!
    @IBOutlet weak var startdateview: UIView!
    @IBOutlet weak var startdatelbl: UILabel!
    @IBOutlet weak var startdatetext: UILabel!
    @IBOutlet weak var enddateview: UIView!
    @IBOutlet weak var enddatelbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var typemainview: UIView!
    @IBOutlet weak var profilepiclbl: UILabel!
    @IBOutlet weak var drivernamelbl: UILabel!
    @IBOutlet weak var totaltripslbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superdrivertoplbl.text = "Super Driver".localized
        
        startdateview.layer.borderWidth = 1.0
        startdateview.layer.borderColor = UIColor.appThemeColor().cgColor
        enddateview.layer.borderWidth = 1.0
        enddateview.layer.borderColor = UIColor.appThemeColor().cgColor
        
        tablecount = 0

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateInFormat = dateFormatter.string(from: NSDate() as Date)
        print(dateInFormat)
        
       currentdate = dateInFormat
        
       startdatetext.text = self.currentdate
       datelbl.text = self.currentdate
        
        showLoaderWithoutBackground()
        
        let dic1 = ["start_date": self.currentdate,
                    "end_date": self.currentdate] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SUPERDRIVERDETAILS
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SuperDriverModel.self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if AppConstants.checkfromsuperdriver == "1"{
            AppConstants.checkfromsuperdriver = "0"
            
             startdatetext.text = AppConstants.superdateselected
            
            showLoaderWithoutBackground()
            
            let dic1 = ["start_date": startdatetext.text!,
                        "end_date": self.currentdate] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SUPERDRIVERDETAILS
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SuperDriverModel.self)
            
            
        }else if AppConstants.endcheckfromsuperdriver == "1"{
        AppConstants.endcheckfromsuperdriver = "0"
            
            datelbl.text = AppConstants.endsuperdateselected
            
            let dic1 = ["start_date": startdatetext.text!,
                        "end_date": datelbl.text!] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SUPERDRIVERDETAILS
            ServiceManager.sharedInstance.delegate = self
            print(apiRequestUrl)
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SuperDriverModel.self)
         
        }else
        {
            
        }
       
    }
    
    @IBAction func backbtn_click(_ sender: Any) {
        
        self.dismissVC()
        
    }
    @IBAction func enddatebtn_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkfrom = "endsuperdriver"
        self.present(next, animated: true, completion: nil)
    
        
    }
    @IBAction func startdatebtn_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkfrom = "superdriver"
        self.present(next, animated: true, completion: nil)
        
    }
    
}

extension SuperDriverViewController: ApiResponseReceiver {

    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? SuperDriverModel{
    let data:SuperDriverModel = responseData
    
    superdriverdata = data
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
       
        tablecount = data.data?.count
        superdrivertableview.reloadData()
        
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

extension SuperDriverViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tablecount)
        return tablecount!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = superdrivertableview.dequeueReusableCell(withIdentifier: "superdriver", for: indexPath) as! SuperDriverTableViewCell
        
        let newString = superdriverdata.data![indexPath.row].driver?.profileImage

        AppConstants.downloadimage(imagename: newString!, imageview: cell.driverimageview, placeholderimage: "mandy")
        cell.celldrivername.text = superdriverdata.data![indexPath.row].driver?.fullName
        cell.celltotaltrips.text = String((superdriverdata.data![indexPath.row].driver?.totalTrips)!)
        cell.mainview.edgeWithShadow(edge: 0)
        
        return cell
    }
   
}
