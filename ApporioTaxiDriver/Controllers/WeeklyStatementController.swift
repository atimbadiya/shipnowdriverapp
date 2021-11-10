//
//  WeeklyStatementController.swift
//  Apporio Taxi Driver
//
//  Created by Nitu on 14/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
//import Firebase
import ObjectMapper

class WeeklyStatementController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

//***    var newdata: DriverEarningNew!
//
//    var weekdata: DriverEarningNew!
    
    var mydata: DriverEarningDetailsModels!
    
    var movefrom = ""
    var dateSelected = ""
    var selectindexvalue = 0
   
    
    @IBOutlet weak var maintableview: UIView!
    @IBOutlet weak var weeklymainviewheight: NSLayoutConstraint!
    @IBOutlet weak var netearnedtextlabel: UILabel!
    @IBOutlet weak var commisiondeductedtextlabel: UILabel!
    
    @IBOutlet weak var weeklyrideslbl: UILabel!
    @IBOutlet weak var totalbilledtocustomertextlabel: UILabel!
    @IBOutlet weak var tripearningtextlabel: UILabel!
    @IBOutlet weak var weeklystatementtextlabel: UILabel!
    
    @IBOutlet weak var totalearningtextlabel: UILabel!
    
    @IBOutlet weak var completedtripstextlabel: UILabel!
    
  //***  let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

    
    @IBOutlet weak var weekTable: UITableView!
    
    @IBOutlet weak var totaleaningview: UIView!
    
    @IBOutlet weak var totalamountview: UIView!
   
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var taxiFeeLabel: UILabel!
    @IBOutlet weak var fareEarnedLabel: UILabel!
    @IBOutlet weak var completedTripsLabel: UILabel!
    @IBOutlet weak var totalEarningLabel: UILabel!
    @IBOutlet weak var weekDateLabel: UILabel!
    var selecteddate = ""
    var tableSize = 0
    
    func setupView(){

        weeklystatementtextlabel.text = "Weekly Statement".localized
        totalearningtextlabel.text = "Total Earning".localized
        completedtripstextlabel.text = "Completed Trips".localized
        tripearningtextlabel.text = "Trips Earnings".localized
        totalbilledtocustomertextlabel.text = "Total Billed To Customer".localized
        commisiondeductedtextlabel.text = "Commision Deducted".localized
        netearnedtextlabel.text = "Net Earned".localized
        weeklyrideslbl.text = "Weekly Rides".localized
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        

        
        totaleaningview.edgeWithShadow(edge: 5)
        totalamountview.edgeWithShadow(edge: 5)
        
        maintableview.edgeWithShadow(edge: 5)
        

    }
    override func viewWillAppear(_ animated: Bool) {
        showLoaderWithoutBackground()
        
        print(AppConstants.dateselected)
        
        let dic1 = ["date": AppConstants.dateselected] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEREARNINGDETAILS
        ServiceManager.sharedInstance.delegate = self        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverEarningDetailsModels.self)
    }
    
    @IBAction func back_click(_ sender: Any) {

    self.dismissVC()
        }
//         if movefrom == "calender" {
//
//            self.presentingViewController!.presentingViewController!.dismiss(animated: true, completion: nil)
//
//         }else{
//        dismissViewcontroller()
//        }
//    }
//
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
print(tableSize)
        return self.tableSize
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = weekTable.dequeueReusableCell(withIdentifier: "weeklyCell", for: indexPath) as! WeeklyStatementTableViewCell
        
        //cell.tablemainview.backgroundColor = UIColor.white
        //cell.tablemainview.edgeWithShadow(edge: 5)
        cell.daylbl.text = mydata.data?.weeklyData![indexPath.row].dayName
        cell.noofrideslbl.text = mydata.data?.weeklyData![indexPath.row].rides
        cell.noofrideslbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((mydata.data?.weeklyData![indexPath.row].ridesColor)!))
        cell.pricelbl.text = mydata.data?.weeklyData![indexPath.row].dayEarning
        
        let tableheight = weekTable.contentSize.height
        print(tableheight)
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            weeklymainviewheight.constant = tableheight + 50.0
            
        }else{
            
            weeklymainviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
      //  weekTable.reloadData()
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        weekTable.deselectRow(at: indexPath, animated: true)
        selectindexvalue = indexPath.row
        //print(selectindexvalue)
        weekTable.reloadData()
//        weekTable.isHidden = true
        
        AppConstants.checkdate = (mydata.data?.weeklyData![selectindexvalue].date)!

        self.presentVC("DayStatementController")
        
    }
        
        
//         let mainview : UIView = (cell.contentView.viewWithTag(3) as? UIView)!
//        let totalearning : UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
//        let datelabel : UILabel = (cell.contentView.viewWithTag(1) as? UILabel)!
//
//
//
//
//      //  print(self.newdata.details?[indexPath.row].detail?.date ?? "nil come")
//
//
//
//
//
//       mainview.layer.shadowColor = UIColor.gray.cgColor
//       mainview.layer.shadowOpacity = 1
//        mainview.layer.shadowOffset = CGSize(width: 0, height: 2)
//        mainview.layer.shadowRadius = 2
//
//
//        if (self.newdata.details?[indexPath.row].detail?.amount!)! == "0"{
//
//            mainview.isHidden = true
//
//        }else{
//
//            mainview.isHidden = false
//
//            totalearning.text =  GlobalVariables.currencysymbol + " " + (self.newdata.details?[indexPath.row].detail?.amount)!
//            datelabel.text = (self.newdata.details?[indexPath.row].day)! + " " + (self.newdata.details?[indexPath.row].date)!
//
//        }
//
//
////         if movefrom == "calender" {
////
////            let detailswwww = self.weekdata.details?[indexPath.row].detail
////            totalearning.text =  GlobalVariables.currencysymbol + " " + (self.weekdata.details?[indexPath.row].detail?.amount)!
////            datelabel.text = (self.weekdata.details?[indexPath.row].day)! + " " + (self.weekdata.details?[indexPath.row].date
////                )!
////
////
////         }else{
////
////              let detailswwww = self.newdata.details?[indexPath.row].detail
////            totalearning.text =  GlobalVariables.currencysymbol + " " + (self.newdata.details?[indexPath.row].detail?.amount)!
////            datelabel.text = (self.newdata.details?[indexPath.row].day)! + " " + (self.newdata.details?[indexPath.row].date
////                )!
////
////
////
////
////        }
//
//
//       /* if (self.newdata.details?[indexPath.row].detail?.amount!)! == "0"{
//
//            mainview.isHidden = true
//
//        }else{*/
//
//       // mainview.isHidden = false
//             // }
//
//        return cell
//
//
//
//    }
//
//    func tableView(_ tableView: UITableView,estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
//
//        if (self.newdata.details?[indexPath.row].detail?.amount!)! == "0"{
//            return 0
//        }else{
//
//            return 50
//        }
//
//
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//
//        if (self.newdata.details?[indexPath.row].detail?.amount!)! == "0"{
//            return 0
//        }else{
//
//            return 50
//        }
//
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        weekTable.deselectRow(at: indexPath, animated: true)
//        let row = indexPath.row
//        print("Row: \(row)")
//
//
//        if (self.newdata.details?[indexPath.row].detail?.amount!)! == "0"{
//
//        }
//
//        else{
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//            let next = storyBoard.instantiateViewController(withIdentifier: "DayStatementController") as! DayStatementController
//            next.selectedday = (self.newdata.details?[row].date!)!
//            self.present(next, animated:true, completion:nil)
//
//        }
//    }
//
//
//    func onSuccessState(_ data: AnyObject , resultCode: Int) {
//
////        if resultCode == 8018{
////
////            if let weekdata = data as? DriverEarningNew{
////            self.weekdata = weekdata
////            if (weekdata.result == 0){
////
////
////            }else{
////
////
////            totalEarningLabel.text = GlobalVariables.currencysymbol + " " + String(self.weekdata.weeklyAmount!)
////            completedTripsLabel.text = String(self.weekdata.totalRides!)
////
////            fareEarnedLabel.text = GlobalVariables.currencysymbol + " " + self.weekdata.fareRecevied!
////            taxiFeeLabel.text = GlobalVariables.currencysymbol + " " + self.weekdata.companyCut!
////            totalAmountLabel.text = GlobalVariables.currencysymbol + " " + String(self.weekdata.weeklyAmount!)
////            tableSize = (self.weekdata.details?.count)!
////
////            if tableSize != 0  {
////                weekDateLabel.text = (self.weekdata.details?[0].date!)! + " to " +  (self.weekdata.details?[6].date!)!
////                weekTable.isHidden = false
////
////                weekTable.reloadData()
////
////            }
////            else{
////                weekTable.isHidden = true
////            }
////
////            }
////            }
////        }
//
//***
//    }


}

extension WeeklyStatementController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
if let responseData = response as? DriverEarningDetailsModels{
    let data:DriverEarningDetailsModels = responseData
    
    mydata = data
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
        weekDateLabel.text = data.data?.dateText
        totalEarningLabel.text = data.data?.totalEarning
        completedTripsLabel.text = data.data?.totalRide
        fareEarnedLabel.text = data.data?.totalBilledToConsumer
        taxiFeeLabel.text = data.data?.totalCommisionDeducted
        totalAmountLabel.text = data.data?.totalEarning
        
        tableSize = data.data?.weeklyData?.count ?? 0
        if tableSize == 0
        {
            self.weekTable.isHidden = true
            self.weeklymainviewheight.constant = 40.0
        }
        else
        {
            self.weekTable.isHidden = false
            self.weekTable.reloadData()
        }
        
        
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



