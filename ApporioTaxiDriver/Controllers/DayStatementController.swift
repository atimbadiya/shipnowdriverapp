//
//  DayStatementController.swift
//  Apporio Taxi Driver
//
//  Created by Nitu on 14/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

import ObjectMapper

class DayStatementController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var selectedday = ""
    var mydata: DriverDailyEarningsModel!
//    var driverreportdata: DriverReportModel!
    
  //  @IBOutlet weak var rideforthedaylbl: UILabel!
   // @IBOutlet weak var tablecellmainview: UIView!
    var daysize = 0
 //   @IBOutlet weak var netearnedtextlabel: UILabel!
   // @IBOutlet weak var commisiondeductedtextlabel: UILabel!
    
   // @IBOutlet weak var totalbilledtocustomertextlabel: UILabel!
   // @IBOutlet weak var tripearningtextlabel: UILabel!

    
    @IBOutlet weak var overallratingtextlabel: UILabel!
    @IBOutlet weak var onlinetimetextlabel: UILabel!
    @IBOutlet weak var totalearningtextlabel: UILabel!
    @IBOutlet weak var dailyearningtextlabel: UILabel!
    
    @IBOutlet weak var completedtripstextlabel: UILabel!
    
    @IBOutlet weak var dayTable: UITableView!
    
    @IBOutlet weak var acceptanceratetextlabel: UILabel!
    
    @IBOutlet weak var totalearningview: UIView!
    
 //   @IBOutlet weak var totalamountview: UIView!
    
   // @IBOutlet weak var totalAmountLabel: UILabel!
   // @IBOutlet weak var taxiFeeLabel: UILabel!
  //  @IBOutlet weak var fareEarnedLabel: UILabel!
    @IBOutlet weak var completedTripsLabel: UILabel!
    @IBOutlet weak var totalEarningLabel: UILabel!
    @IBOutlet weak var oneDateLabel: UILabel!
    
    @IBOutlet weak var onlinetimetext: UILabel!
    
    @IBOutlet weak var acceptanceratetext: UILabel!
    
    @IBOutlet weak var ratingvaluetext: UILabel!
    
    @IBAction func back_click(_ sender: Any) {
       self.dismissVC()
    }
    // let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    
    func setupView(){
     dailyearningtextlabel.text = "Earnings Details".localized
        totalearningtextlabel.text = "Total Earning".localized
        
        completedtripstextlabel.text = "Completed Trips".localized
        acceptanceratetextlabel.text = "Acceptance Rate".localized
        onlinetimetextlabel.text = "Online Time".localized
        overallratingtextlabel.text = "Overall Rating".localized
        
//        tripearningtextlabel.text = "Trips Earnings".localized
//        totalbilledtocustomertextlabel.text = "Total billed to customer".localized
//        commisiondeductedtextlabel.text = "Commision Deducted".localized
//        netearnedtextlabel.text = "Net Earned".localized
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
       
        
        
          totalearningview.edgeWithShadow(edge: 5)
      //    totalamountview.edgeWithShadow(edge: 5)
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoaderWithoutBackground()
        
        let dic1 = ["bill_period": AppConstants.checkdate] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERDAILYEARNINGS;       ServiceManager.sharedInstance.delegate = self        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverDailyEarningsModel.self)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.daysize)
        return self.daysize

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = dayTable.dequeueReusableCell(withIdentifier: "daycell", for: indexPath) as! DayStatementTableViewCell


//        let mainview : UIView = (cell.contentView.viewWithTag(3) as? UIView)!
//        let totalearning : UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
//        let rideid : UILabel = (cell.contentView.viewWithTag(1) as? UILabel)!
//
//        mainview.layer.shadowColor = UIColor.gray.cgColor
//        mainview.layer.shadowOpacity = 1
//        mainview.layer.shadowOffset = CGSize(width: 0, height: 2)
//        mainview.layer.shadowRadius = 2

//        if (self.mydata.details?.fullRideDetails?[indexPath.row].amount!)! == "0.00"{
//
//            mainview.isHidden = true
//
//        }else{
//
//              mainview.isHidden = false
        cell.daydetaillbl.text =  (self.mydata.data?.ridesData![indexPath.row].rideName)
        cell.numberofrideslbl.text = (self.mydata.data?.ridesData![indexPath.row].rideEarning)
        
        cell.daydetaillbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((self.mydata.data?.ridesData![indexPath.row].ridesColor)!))
        //}

        return cell



    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        dayTable.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("Row: \(row)")
        AppConstants.bookingid = String((mydata.data?.ridesData![row].rideId)!)
        
        self.presentVC("FullTripDetailsViewController")
      //  dayTable.reloadData()
        
//        if (self.mydata.details?.fullRideDetails?[indexPath.row].amount!)! != "0.00"{
//
//            var ridemodevalue =  (self.mydata.details?.fullRideDetails?[indexPath.row].ridemode!)!
//
//            var ridestatusvalue = "7"
//
//            if(ridemodevalue == "1"){
//
//                ridestatusvalue = "7"
//            }else{
//
//                ridestatusvalue = "16"
//
//            }


//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//            let next = storyBoard.instantiateViewController(withIdentifier: "FullDetailsViewController") as! FullDetailsViewController
//            next.rideid = (self.mydata.details?.fullRideDetails?[indexPath.row].rideId!)!
//            next.ridestausvalue = ridestatusvalue
//            next.ridemode = ridemodevalue
//            self.present(next, animated:true, completion:nil)

        }
    }


//    func onSuccessState(_ data: AnyObject , resultCode: Int) {
//
//        if resultCode == 667{
//
//            if let mydata = data as? DayStatement{
//
//                self.mydata = mydata
//            if(self.mydata.result == 419){
//
//                NsUserDefaultManager.SingeltonInstance.logOut()
//                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
//                self.present(next, animated: true, completion: nil)
//
//
//
//            }else if(mydata.result == 0){
//
//            dayTable.isHidden = true
//
//
//            }else{
//
//                dayTable.isHidden = false
//
//                oneDateLabel.text = mydata.details?.date
//                completedTripsLabel.text = mydata.details?.rides
//
//                totalAmountLabel.text = GlobalVariables.currencysymbol + " " + (mydata.details?.amount)!
//             taxiFeeLabel.text =  GlobalVariables.currencysymbol + " " + (mydata.details?.companyCut)!
//               fareEarnedLabel.text =  GlobalVariables.currencysymbol + " " + (mydata.details?.fareRecevied)!
//                totalEarningLabel.text =  GlobalVariables.currencysymbol + " " + (mydata.details?.amount)!
//
//                daysize = (self.mydata.details?.fullRideDetails?.count)!
//                 print(daysize)
//                dayTable.reloadData()
//
//                APIManager.sharedInstance.delegate = self
//                APIManager.sharedInstance.DriverReportUrl(DriverId: self.driverid)
//
//            }
//            }
//        }
//
//          if resultCode == 8024{
//
//            if let driverreportdata = data as? DriverReportModel{
//
//                self.driverreportdata = driverreportdata
//            if(self.driverreportdata.status == 419){
//
//                NsUserDefaultManager.SingeltonInstance.logOut()
//                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
//                self.present(next, animated: true, completion: nil)
//
//
//
//            }else if(self.driverreportdata.status == 1){
//
//
//                acceptanceratetext.text = driverreportdata.details?.dailyAcceptanceRate
//                onlinetimetext.text = driverreportdata.details?.onlineTime
//                ratingvaluetext.text = "\(driverreportdata.details?.avrageRating ?? 4)"
//                //ratingvaluetext.text = Int((driverreportdata.details?.avrageRating)!)
//
//
//            }else{
//
//
//            }
//
//
//            }
//
//        }
//    }
//
    

extension DayStatementController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? DriverDailyEarningsModel{
    let data:DriverDailyEarningsModel = responseData
    
    mydata = data
    
    if (data.result == "1") {
        
        daysize = (data.data!.ridesData?.count)!
        dayTable.reloadData()
        hideLoaderWithoutBackground()
        oneDateLabel.text = data.data?.date ?? ""
        totalEarningLabel.text = data.data?.totalEarning ?? ""
        completedTripsLabel.text = String((data.data?.completedTrip ?? 0)!)
        acceptanceratetext.text = data.data?.acceptanceRate ?? ""
        onlinetimetext.text = data.data?.onlineTime ?? ""
        ratingvaluetext.text = data.data?.overallRating ?? ""
//        fareEarnedLabel.text = data.data?.totalBilledToCustomer
//        taxiFeeLabel.text = data.data?.comissionDeducted
//        totalAmountLabel.text = data.data?.totalEarning
//
        
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
    hideLoaderWithoutBackground()
    showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
}
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }

}



