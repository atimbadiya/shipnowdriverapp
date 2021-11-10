//
//  NewEarningController.swift
//  Apporio Taxi Driver
//
//  Created by Nitu on 15/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Charts
import ObjectMapper

class NewEarningController: BaseViewController {
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var weeklyearningsnewview: UIView!
    @IBOutlet weak var graphmainview: UIView!
    @IBOutlet weak var bottomview: UIView!
    @IBOutlet weak var weeklyearninglbl: UILabel!
    @IBOutlet weak var weeklyearningpricelbl: UILabel!
    @IBOutlet weak var totaltripslbl: UILabel!
    @IBOutlet weak var totaltripvalue: UILabel!
    
    @IBOutlet weak var datetopview: UIView!
    
    @IBOutlet weak var viewfullsummaryview: UIView!
    
    @IBOutlet weak var outstandingview: UIView!
    
    @IBOutlet weak var clicktoviewanothertextlbl: UILabel!
    
    @IBOutlet weak var viewfullsummarytextlbl: UILabel!
    // @IBOutlet weak var viewoldsummerytextlabel: UILabel!
    @IBOutlet weak var viewfullsummerytextlabel: UILabel!
    @IBOutlet weak var totalpaypotlabeltext: UILabel!
    
    @IBOutlet weak var yourearningtextlabel: UILabel!
    
    @IBOutlet weak var totaloutstandingtextlabel: UILabel!
        
    @IBOutlet weak var barchartgraph: BarChartView!
    @IBOutlet weak var outstandingpricelbl: UILabel!
    
    var tablesize = 0
    
   // var toastLabel : UILabel!
    
  //***  var mydata : DriverEarningNew!
    
    
    var unitsSold: [Double] = []
    
    
    var months: [String]!
    
    @IBOutlet weak var weekdatetext: UILabel!
    @IBOutlet weak var totalPayoutLabel: UILabel!
    @IBOutlet weak var totalOutstandingLabel: UILabel!
    
    //@IBOutlet weak var currentBalLabel: UILabel!
//***    let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    
    
    @IBAction func back_click(_ sender: Any) {
        self.dismissVC()
    }
    
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        bottomview.isHidden = false
//        viewfullsummaryview.isHidden = true
        clicktoviewanothertextlbl.text = "Date Range".localized
        weeklyearninglbl.text = "Weekly Earnings".localized
        totaltripslbl.text = "Total Trips".localized
       // viewfullsummerytextlabel.text = "VIEW FULL SUMMARY".localized
        yourearningtextlabel.text = "Your Earnings".localized
        //totaloutstandingtextlabel.text = "Total OutStanding(If Any)".localized
        totaltripslbl.text = "Total Trips".localized
        //totalpaypotlabeltext.text = "Total Outstanding(If Any)".localized
        weeklyearninglbl.text = "Weekly Earnings".localized
        totalpaypotlabeltext.text = "Total Outstanding(If Any)".localized
        
        weeklyearningsnewview.edgeWithShadow(edge: 5.0)
        outstandingview.edgeWithShadow(edge: 5.0)
        graphmainview.edgeWithShadow(edge: 5.0)
        datetopview.edgeWithShadow(edge: 5.0)
        
        
//        bottomview.layer.shadowColor = UIColor.gray.cgColor
//        bottomview.layer.shadowOpacity = 1
//        bottomview.layer.shadowOffset = CGSize(width: 0, height: 2)
//        bottomview.layer.shadowRadius = 2
        
        
     months = ["M", "T", "W", "Th", "F", "SA", "SU"]
        
         // let unitsSold = [50.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
      //  setChart(dataPoints: months, values: unitsSold)
        
        //        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-300, width: 300, height: 35))
        //        toastLabel.backgroundColor = UIColor.white
        //        toastLabel.textColor = UIColor.black
        //        toastLabel.textAlignment = NSTextAlignment.center;
        //        self.view.addSubview(toastLabel)
        //        toastLabel.text = "No Earning!!"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateInFormat = dateFormatter.string(from: NSDate() as Date)
        print(dateInFormat)
        
        AppConstants.dateselected = dateInFormat
        
        showLoaderWithoutBackground()

        let dic1 = ["date": dateInFormat] as [String : AnyObject]

        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEREARNINGS
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverEarningsModel.self)


        // Do any additional setup after loading the view.
   }
//
    override func viewWillAppear(_ animated: Bool) {

        if AppConstants.checkmovefromcalenderearning == "1"{
            AppConstants.checkmovefromcalenderearning = "0"
            showLoaderWithoutBackground()
            
            let dic1 = ["date": AppConstants.dateselected] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVEREARNINGS
            ServiceManager.sharedInstance.delegate = self            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverEarningsModel.self)
//        }else{
//
//
//        }

    }
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // self.mainview.frame.size.height = 700
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height = 500
        self.scrollview.contentSize.width = 0

    }
//
//
    func setChart(dataPoints: [String], values: [Double]) {



        barchartgraph.noDataText = "You need to provide data for the chart.".localized


        barchartgraph.legend.enabled = false

        barchartgraph.xAxis.axisMinimum = -0.5;
        barchartgraph.xAxis.axisMaximum = Double(months.count) - 0.5;

        barchartgraph.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        //Also, you probably we want to add:

        barchartgraph.xAxis.granularity = 1

        // grid lines
        barchartgraph.xAxis.drawAxisLineEnabled = false
        barchartgraph.xAxis.drawGridLinesEnabled = false
        barchartgraph.leftAxis.drawAxisLineEnabled = false
        barchartgraph.leftAxis.drawGridLinesEnabled = false
        barchartgraph.rightAxis.drawAxisLineEnabled = false
        barchartgraph.rightAxis.drawGridLinesEnabled = false

        // X-axis line
     //  barchartgraph.xAxis.drawAxisLineEnabled = true
     //   barchartgraph.xAxis.axisLineColor = UIColor.white

        // X-axis labels
        barchartgraph.xAxis.labelTextColor = UIColor.white
        barchartgraph.xAxis.labelFont = NSUIFont.systemFont(ofSize: 16.0)
        barchartgraph.xAxis.labelPosition = .bottom



        // Y-axis labels
       /* accountsBarChartView.leftAxis.labelTextColor = axisGridsAndLabelsColor
        accountsBarChartView.rightAxis.drawLabelsEnabled = false*/


       var valueColors = [UIColor]()
        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<dataPoints.count {

           let dataEntry = BarChartDataEntry(x: Double(i) , yValues: [Double(values[i])])

          //  let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)

            if values[i] < 0 {
                valueColors.append(UIColor.red)
            }
            else {
                valueColors.append(UIColor.white)
            }
        }


        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")

        chartDataSet.colors = [UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)]
       // chartDataSet.colors = [UIColor.green]
               chartDataSet.valueColors = valueColors
        chartDataSet.valueFont =  NSUIFont.systemFont(ofSize: 12.0)



        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)

       barchartgraph.data = chartData

        //barchartgraph.descriptionText = ""

        barchartgraph.rightAxis.drawGridLinesEnabled = false
        barchartgraph.rightAxis.drawAxisLineEnabled = false
        barchartgraph.rightAxis.drawLabelsEnabled = false

        barchartgraph.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)



    }

    @IBAction func weeklyearningbtn_click(_ sender: Any) {
        
        self.presentVC("WeeklyStatementController")
        
    }
    @IBAction func view_full_summary_click(_ sender: Any) {

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: WeeklyStatementController = storyboard.instantiateViewController(withIdentifier: "WeeklyStatementController") as! WeeklyStatementController
       // next.newdata = self.mydata
        self.present(next, animated: true, completion: nil)
    }




    @IBAction func view_old_summary_click(_ sender: Any) {

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
         next.checkmovefrom = ""
        self.present(next, animated: true, completion: nil)
    }

//    func onSuccessState(_ data: AnyObject , resultCode: Int) {
//
//        if resultCode == 666{
//
//            if let mydata = data as? DriverEarningNew{
//            self.mydata = mydata
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
//                //
//                //            toastLabel.isHidden = false
//                //            earningtable.isHidden = true
//                //
//
//            }else{
//
//
//               // unitsSold.removeAll()
//
//
//                if mydata.outstandingstatus == "2"{
//                    bottomview.isHidden = true
//                    viewfullsummaryview.isHidden = false
//
//                }else{
//                    bottomview.isHidden = false
//                    viewfullsummaryview.isHidden = true
//
//                }
//
//
//
//               let totalvalue = Int((mydata.details?.count)!)
//
//                for i in 0..<totalvalue{
//
//
//                    unitsSold.append(Double((mydata.details?[i].detail?.amount)!)!)
//
//                }
//
//
//                  setChart(dataPoints: months, values: unitsSold)
//
//                let startdate = (self.mydata.details?[0].date!)?.components(separatedBy: "-")
//
//                let enddate = (self.mydata.details?[6].date!)!.components(separatedBy: "-")
//
//
//
//                let date1 = (startdate?[0])! + "-" + (startdate?[1])!
//
//                let date4 = enddate[0] + "-" + enddate[1]
//
//
//                weekdatetext.text = date1  + " to " + date4
//                //weekdatetext.text = (self.mydata.details?[0].date!)! + " to " +  (self.mydata.details?[6].date!)!
//                totalPayoutLabel.text = GlobalVariables.currencysymbol + " " + String(self.mydata.weeklyAmount!)
//                //currentBalLabel.text = self.mydata.companyCut!
//                totalOutstandingLabel.text = GlobalVariables.currencysymbol + " " + self.mydata.companyPayment!
//            }
//            }
//        }
//        if resultCode == 8018{
//            if let mydata = data as? DriverEarningNew{
//                self.mydata = mydata
//                if(self.mydata.result == 419){
//
//                    NsUserDefaultManager.SingeltonInstance.logOut()
//                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                    let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
//                    self.present(next, animated: true, completion: nil)
//
//
//
//                }else if(mydata.result == 0){
//
//                    //
//                    //            toastLabel.isHidden = false
//                    //            earningtable.isHidden = true
//                    //
//
//                }else{
//
//
//                    unitsSold.removeAll()
//
//                    let totalvalue = Int((mydata.details?.count)!)
//
//                    for i in 0..<totalvalue{
//
//
//                        unitsSold.append(Double((mydata.details?[i].detail?.amount)!)!)
//
//                    }
//
//
//                    setChart(dataPoints: months, values: unitsSold)
//
//                    let startdate = (self.mydata.details?[0].date!)?.components(separatedBy: "-")
//
//                    let enddate = (self.mydata.details?[6].date!)!.components(separatedBy: "-")
//
//
//
//                    let date1 = (startdate?[1])! + "-" + (startdate?[2])!
//
//                    let date4 = enddate[1] + "-" + enddate[2]
//
//
//                    weekdatetext.text = date1  + " to " + date4
//                    //weekdatetext.text = (self.mydata.details?[0].date!)! + " to " +  (self.mydata.details?[6].date!)!
//                    totalPayoutLabel.text = GlobalVariables.currencysymbol + " " + String(self.mydata.weeklyAmount!)
//                    //currentBalLabel.text = self.mydata.companyCut!
//                    totalOutstandingLabel.text = GlobalVariables.currencysymbol + " " + self.mydata.companyPayment!
//                }
//            }
//
//        }
//    }

//    @IBAction func weeklyearningbtn_click(_ sender: Any) {
//    }
}

extension NewEarningController: ApiResponseReceiver {
    
    
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? DriverEarningsModel{
    let data:DriverEarningsModel = responseData
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
        
        let totalvalue = Int((data.data?.detail?.count)!)
        
                        for i in 0..<totalvalue{
        
        
                            unitsSold.append(Double((data.data!.detail?[i].details?.driverAmount)!)!)
        
                        }
        
        
                          setChart(dataPoints: months, values: unitsSold)
        
//                        let startdate = (data.data!.detail?[0].date!)?.components(separatedBy: "-")
//
//                        let enddate = (data.data!.detail?[6].date!)!.components(separatedBy: "-")
//
//
//
//                        let date1 = (startdate?[0])! + "-" + (startdate?[1])!
//
//                        let date4 = enddate[0] + "-" + enddate[1]
        
        
                        //weekdatetext.text = date1  + " to " + date4
        
                        weekdatetext.text = (data.data?.startDate)! + "-" + (data.data?.lastDate)!
                        //AppConstants.checkweekdatetext = weekdatetext.text!
                        //weekdatetext.text = (self.mydata.details?[0].date!)! + " to " +  (self.mydata.details?[6].date!)!
                        outstandingpricelbl.text = (data.data?.outstandAmount!)
                        self.outstandingpricelbl.textColor = PListUtility.getColorFromHex(hexString: "#" + ((data.data?.outstandColor)!))
                        weeklyearningpricelbl.text = (data.data?.totalWeeklyAmount!)
                        totaltripvalue.text = (data.data?.totalWeeklyRides!)
                        //currentBalLabel.text = self.mydata.companyCut!
                        //totalOutstandingLabel.text =  data.data.companyPayment!
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



