//
//  DriverRatingViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 3/7/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import StarryStars
import ObjectMapper

class DriverRatingViewController: BaseViewController {
    
    var currentdate: String = "yyyy-MM-dd"
    
    

    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var driverratingtoplbl: UILabel!
    @IBOutlet weak var topbtnview: UIView!
    @IBOutlet weak var dailybtnview: UIView!
    @IBOutlet weak var weeklybtnview: UIView!
    @IBOutlet weak var monthlybtnview: UIView!
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var selectdatefordailyview: UIView!
    @IBOutlet weak var hiddenselectdateview: UIView!
    @IBOutlet weak var driverdetailsmainview: UIView!
    @IBOutlet weak var driverimageview: UIImageView!
    @IBOutlet weak var drivernameview: UILabel!
    @IBOutlet weak var driverratingview: RatingView!
    @IBOutlet weak var driverratinglbl: UILabel!
    @IBOutlet weak var startdateview: UIView!
    @IBOutlet weak var startdatelbl: UILabel!
    @IBOutlet weak var startcurrentdatelbl: UILabel!
    @IBOutlet weak var enddateview: UIView!
    @IBOutlet weak var enddatelbl: UILabel!
    @IBOutlet weak var enddatecurrentlbl: UILabel!
    @IBOutlet weak var selectdatedailylbl: UILabel!
    @IBOutlet weak var currentdatedailylbl: UILabel!
    @IBOutlet weak var dailybtn: UIButton!
    @IBOutlet weak var weeklybtn: UIButton!
    @IBOutlet weak var monthlybtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateInFormat = dateFormatter.string(from: NSDate() as Date)
        print(dateInFormat)
        
        currentdate = dateInFormat
        currentdatedailylbl.text = currentdate
        
        hiddenselectdateview.isHidden = true
        
        dailybtnview.edgeWithShadow(edge: 4.0)
        dailybtnview.layer.borderWidth = 1
        dailybtnview.layer.borderColor = UIColor.appThemeColor().cgColor
        weeklybtnview.edgeWithShadow(edge: 4.0)
        weeklybtnview.layer.borderWidth = 1
        weeklybtnview.layer.borderColor = UIColor.appThemeColor().cgColor
        monthlybtnview.edgeWithShadow(edge: 4.0)
        monthlybtnview.layer.borderWidth = 1
        monthlybtnview.layer.borderColor = UIColor.appThemeColor().cgColor
        
        driverimageview.makeViewCircular()
        driverdetailsmainview.edgeWithShadow(edge: 4.0)
        dailybtnview.layer.backgroundColor = UIColor.appThemeColor().cgColor
        
        startdatelbl.text = "Start Date".localized
        enddatelbl.text = "End Date".localized
        startcurrentdatelbl.text = "select date".localized
        enddatecurrentlbl.text = "select date".localized
        driverratingtoplbl.text = "Driver Ratings".localized
        dailybtn.setTitle("Daily".localized, for: .normal)
        weeklybtn.setTitle("Weekly".localized, for: .normal)
        monthlybtn.setTitle("Monthly".localized, for: .normal)
        selectdatedailylbl.text = "Select date".localized
       

        let dic1 = ["start_date": currentdate,
                    "end_date": currentdate
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHECKRATING
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCheckRatingModel.self)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if AppConstants.selectcheck == "1"{
            AppConstants.selectcheck = "0"
            currentdatedailylbl.text = AppConstants.documentdateselected
            
            if currentdatedailylbl.text != ""{
                
                let dic1 = ["start_date": AppConstants.documentdateselected,
                            "end_date": AppConstants.documentdateselected
                    ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHECKRATING
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCheckRatingModel.self)
                
            }else
            {
                showErrorAlert("Alert".localized, alertMessage: "Please select date first".localized, VC: self)
            }
            

            
        }else if AppConstants.startcheck == "1"{
            AppConstants.startcheck = "0"
            startcurrentdatelbl.text = AppConstants.superdateselected
            
            
            if startcurrentdatelbl.text != "select date" && enddatecurrentlbl.text != "select date"{
                
                let dic1 = ["start_date": AppConstants.superdateselected,
                            "end_date": AppConstants.endsuperdateselected
                    ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHECKRATING
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCheckRatingModel.self)
                
            }else
            {
                showErrorAlert("Alert".localized, alertMessage: "Please select end date".localized, VC: self)
            }
            
            
        }else if AppConstants.endcheck == "1"{
            AppConstants.endcheck = "0"
            enddatecurrentlbl.text = AppConstants.endsuperdateselected
            
            
            if startcurrentdatelbl.text != "select date" && enddatecurrentlbl.text != "select date"{
                
                let dic1 = ["start_date": AppConstants.superdateselected,
                            "end_date": AppConstants.endsuperdateselected
                    ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHECKRATING
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCheckRatingModel.self)
                
            }else
            {
                showErrorAlert("Alert".localized, alertMessage: "Please select start date".localized, VC: self)
            }
            
            
        }else{
            
        }
    }
    
    
    @IBAction func backbtn_click(_ sender: Any) {
        
        self.dismissVC()
        
    }
    @IBAction func dailybtn_click(_ sender: Any) {
         hiddenselectdateview.isHidden = true
        monthlybtnview.layer.backgroundColor = UIColor.white.cgColor
        dailybtnview.layer.backgroundColor = UIColor.appThemeColor().cgColor
        weeklybtnview.layer.backgroundColor = UIColor.white.cgColor
        
        driverdetailsmainview.isHidden = false
        
        //if AppConstants.selectcheck == "1"{
            
            if currentdatedailylbl.text != ""{

            let dic1 = ["start_date": AppConstants.documentdateselected,
                        "end_date": AppConstants.documentdateselected
                ] as [String : AnyObject]

            showLoaderWithoutBackground()



            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHECKRATING
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCheckRatingModel.self)

        }else
        {
            showErrorAlert("Alert".localized, alertMessage: "Please select date first".localized, VC: self)
        }


    }
    @IBAction func weeklybtn_click(_ sender: Any) {
         hiddenselectdateview.isHidden = false
        monthlybtnview.layer.backgroundColor = UIColor.white.cgColor
        dailybtnview.layer.backgroundColor = UIColor.white.cgColor
        weeklybtnview.layer.backgroundColor = UIColor.appThemeColor().cgColor
        
        //if AppConstants.startcheck == "1" && AppConstants.endcheck == "1"{
//
        if startcurrentdatelbl.text == "select date" || enddatecurrentlbl.text == "select date"{
       
        driverdetailsmainview.isHidden = true
            
                showErrorAlert("Alert".localized, alertMessage: "Please select date first".localized, VC: self)
            
            
        }else
        {
        //driverdetailsmainview.isHidden = false
        
            let dic1 = ["start_date": AppConstants.superdateselected,
                        "end_date": AppConstants.endsuperdateselected
                ] as [String : AnyObject]

            showLoaderWithoutBackground()



            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHECKRATING
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCheckRatingModel.self)

        }
        
}
    
    @IBAction func monthlybtn_click(_ sender: Any) {
         hiddenselectdateview.isHidden = false
        monthlybtnview.layer.backgroundColor = UIColor.appThemeColor().cgColor
        dailybtnview.layer.backgroundColor = UIColor.white.cgColor
        weeklybtnview.layer.backgroundColor = UIColor.white.cgColor
        
        if startcurrentdatelbl.text == "select date" || enddatecurrentlbl.text == "select date"{
            
            driverdetailsmainview.isHidden = true
             showErrorAlert("Alert".localized, alertMessage: "Please select date first".localized, VC: self)
            
        }else
        {
            //driverdetailsmainview.isHidden = false
        
        
        //if AppConstants.startcheck == "1" && AppConstants.endcheck == "1"{
            if startcurrentdatelbl.text != "select date" && enddatecurrentlbl.text != "select date"{

            let dic1 = ["start_date": AppConstants.superdateselected,
                        "end_date": AppConstants.endsuperdateselected
                ] as [String : AnyObject]

            showLoaderWithoutBackground()



            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHECKRATING
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverCheckRatingModel.self)

        }
        
           
        
        }
    }
    @IBAction func selectdatefordailybtn_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkfordriverrating = "selectdatedriverrating"
        self.present(next, animated: true, completion: nil)

    }
    @IBAction func startdatebtn_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkfordriverrating = "startdriverrating"
        self.present(next, animated: true, completion: nil)

        
    }
    @IBAction func enddatebtn_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkfordriverrating = "enddriverrating"
        self.present(next, animated: true, completion: nil)
        
        
    }
    
}

extension DriverRatingViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverCheckRatingModel{
            let data:DriverCheckRatingModel = responseData
            
            //superdriverdata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                driverdetailsmainview.isHidden = false
                
                driverratingview.rating = Float((data.data?.rating)!)!
                driverratinglbl.text = data.data?.rating
                drivernameview.text = (data.data?.firstname ?? "")! + " " +  (data.data?.lastname ?? "")!
                
                let newString = data.data!.image
                
                AppConstants.downloadimage(imagename: newString!, imageview: driverimageview, placeholderimage: "profileeee")
                
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



