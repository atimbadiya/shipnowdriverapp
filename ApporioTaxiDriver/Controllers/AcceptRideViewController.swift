//
//  AcceptRideViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import AVFoundation
import ObjectMapper

class AcceptRideViewController: BaseViewController {
    
    
    @IBOutlet weak var infoimageview: UIView!
    
    @IBOutlet weak var itemsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var receverDetailsBackView: UIView!
    @IBOutlet weak var deliverDetailsView: UIView!
    @IBOutlet weak var deliveryDetailsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var productDetailsLabel: UILabel!
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var receiverNameTextfiled: UITextField!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var receiverContactLabel: UILabel!
    @IBOutlet weak var productImagesLabel: UILabel!
    @IBOutlet weak var receiverContactTextField: UITextField!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!
    
    @IBOutlet weak var receiverDetailsLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var mutipledropstextlbl: UILabel!
    @IBOutlet weak var hiddencancelbtntext: UIButton!
    
    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var innerhiddenview: UIView!
    
    var tablecount = 0
    
    var timetoshow = 0.0
    var calculatedtimestamp = 0
//    var acceptrejectTimer: Timer = Timer()
//    var helloWorldTimer: Timer = Timer()
//    var player: AVAudioPlayer?
    
    var autoStatus = ""
    
    
    
    @IBOutlet weak var acceptridebtntext: UIButton!
    
    @IBOutlet weak var packagenameheightview: NSLayoutConstraint!
    @IBOutlet weak var rejectrideview: UIView!
    @IBOutlet weak var rejectridebtn: UIButton!
    @IBOutlet weak var carimageview: UIImageView!
    @IBOutlet weak var ridetypelbl: UILabel!
    @IBOutlet weak var packagenamelbl: UILabel!
    @IBOutlet weak var packagename: UILabel!
    @IBOutlet weak var timerview: CircleTimer!
    @IBOutlet weak var paymentmethodlbl: UILabel!
    @IBOutlet weak var datetimelbl: UILabel!
    @IBOutlet weak var estimateFare: UILabel!
    @IBOutlet weak var lineview: UIView!
    @IBOutlet weak var pickfromlbl: UILabel!
    @IBOutlet weak var droplbl: UILabel!
    @IBOutlet weak var pickLocation: UILabel!
    @IBOutlet weak var dropLocation: UILabel!
    @IBOutlet weak var pickUpStackView: UIStackView!
    @IBOutlet weak var dropStackView: UIStackView!
    @IBOutlet weak var notesStackView: UIStackView!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var notesText: UILabel!
    @IBOutlet weak var packagenamecompleteview: UIView!
    
    @IBOutlet weak var firstLineView: NSLayoutConstraint!
    
    @IBOutlet weak var lblProductHeight: NSLayoutConstraint!
    
    @IBOutlet weak var productImageViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        receiverContactLabel.text = "Receiver's Contact".localized
        productDetailsLabel.text = "Product's Details".localized
        productImagesLabel.text = "Product's Images".localized
        receiverDetailsLabel.text = "Receiver's Details".localized
        receiverNameLabel.text = "Receiver's Name".localized
        
        
        
        itemsTableViewHeight.constant = CGFloat(AppConstants.productDetailsData.count * 55)
        
        deliveryDetailsViewHeight.constant = 450 + CGFloat(AppConstants.productDetailsData.count * 55)
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        AppConstants.driverlocationtimer?.cancel()
        AppConstants.driverlocationtimer = nil
        
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
       
        self.sayHello1()
        
        hiddenview.isHidden = true
        
        receiverNameTextfiled.isUserInteractionEnabled = false
        receiverContactTextField.isUserInteractionEnabled = false
        
        receiverNameTextfiled.edgeWithOutShadow(edge: 4.0)
        receiverContactTextField.edgeWithOutShadow(edge: 4.0)
        
        
        receiverNameTextfiled.text = AppConstants.receiverDetails.name
        receiverContactTextField.text = AppConstants.receiverDetails.contact
        
        //为UIImageView1添加点击事件
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(scanBigImageClick1(_:)))
        firstImageView.addGestureRecognizer(tapGestureRecognizer1)
        //让UIImageView和它的父类开启用户交互属性
        firstImageView.isUserInteractionEnabled = true

        //为UIImageView1添加点击事件
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(scanBigImageClick1(_:)))
        secondImageView.addGestureRecognizer(tapGestureRecognizer2)
        //让UIImageView和它的父类开启用户交互属性
        secondImageView.isUserInteractionEnabled = true
        
        //为UIImageView1添加点击事件
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(scanBigImageClick1(_:)))
        thirdImageView.addGestureRecognizer(tapGestureRecognizer3)
        //让UIImageView和它的父类开启用户交互属性
        thirdImageView.isUserInteractionEnabled = true
        
        //为UIImageView1添加点击事件
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(scanBigImageClick1(_:)))
        fourthImageView.addGestureRecognizer(tapGestureRecognizer4)
        //让UIImageView和它的父类开启用户交互属性
        fourthImageView.isUserInteractionEnabled = true
        
        //为UIImageView1添加点击事件
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(scanBigImageClick1(_:)))
        fifthImageView.addGestureRecognizer(tapGestureRecognizer5)
        //让UIImageView和它的父类开启用户交互属性
        fifthImageView.isUserInteractionEnabled = true

        if AppConstants.productImages?.count == 0 {
            
//            self.firstLineView.constant = 0
//            self.lblProductHeight.constant = 0
//            self.productImageViewHeight.constant = 0
            
        }else{
            if AppConstants.productImages?.count == 1{
                let newString = AppConstants.productImages![0]
                AppConstants.downloadimage(imagename: newString, imageview: firstImageView, placeholderimage: "mandy")
            }
            else if AppConstants.productImages?.count == 2{
                
                let newString = AppConstants.productImages![0]
                AppConstants.downloadimage(imagename: newString, imageview: firstImageView, placeholderimage: "mandy")
                
                let newString1 = AppConstants.productImages![1]
                AppConstants.downloadimage(imagename: newString1, imageview: secondImageView, placeholderimage: "mandy")
            }
            else if AppConstants.productImages?.count == 3{
                
                let newString = AppConstants.productImages![0]
                AppConstants.downloadimage(imagename: newString, imageview: firstImageView, placeholderimage: "mandy")
                
                let newString1 = AppConstants.productImages![1]
                AppConstants.downloadimage(imagename: newString1, imageview: secondImageView, placeholderimage: "mandy")
                
                let newString2 = AppConstants.productImages![2]
                       AppConstants.downloadimage(imagename: newString2, imageview: thirdImageView, placeholderimage: "mandy")
                   }
            else if AppConstants.productImages?.count == 4{
                
                let newString = AppConstants.productImages![0]
                AppConstants.downloadimage(imagename: newString, imageview: firstImageView, placeholderimage: "mandy")
                
                let newString1 = AppConstants.productImages![1]
                AppConstants.downloadimage(imagename: newString1, imageview: secondImageView, placeholderimage: "mandy")
                
                let newString2 = AppConstants.productImages![2]
                       AppConstants.downloadimage(imagename: newString2, imageview: thirdImageView, placeholderimage: "mandy")
                
                let newString3 = AppConstants.productImages![3]
                AppConstants.downloadimage(imagename: newString3, imageview: fourthImageView, placeholderimage: "mandy")
                
            }
            else if AppConstants.productImages?.count == 5{
                
                let newString = AppConstants.productImages![0]
                AppConstants.downloadimage(imagename: newString, imageview: firstImageView, placeholderimage: "mandy")
                
                let newString1 = AppConstants.productImages![1]
                AppConstants.downloadimage(imagename: newString1, imageview: secondImageView, placeholderimage: "mandy")
                
                let newString2 = AppConstants.productImages![2]
                       AppConstants.downloadimage(imagename: newString2, imageview: thirdImageView, placeholderimage: "mandy")
                
                let newString3 = AppConstants.productImages![3]
                AppConstants.downloadimage(imagename: newString3, imageview: fourthImageView, placeholderimage: "mandy")
                
                let newString4 = AppConstants.productImages![4]
                AppConstants.downloadimage(imagename: newString4, imageview: fifthImageView, placeholderimage: "mandy")
                
            }
            self.firstLineView.constant = 2
            self.lblProductHeight.constant = 30
            self.productImageViewHeight.constant = 100
        }
        
         autoStatus = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.AUTO_ACCEPT_VALUE)
        
        AppConstants.screenfromaccept = "1"
        
        pickfromlbl.text = "Pick From".localized
        
        notesLabel.text = "Additional Notes".localized
        self.rejectrideview.layer.cornerRadius = 2
        
        if (AppConstants.multipleVisable)!{
            
            
            tablecount = AppConstants.mutiplestops.count
            
            infoimageview.isHidden = false
            droplbl.text = ("Drop Point".localized + " (" + String(tablecount) + ")")
            
            
        }else{
            infoimageview.isHidden = true
            droplbl.text = "Drop Point".localized
        }
       
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(AcceptScreen),
            name: NSNotification.Name(rawValue: "acceptscreen"),
            object: nil)
       
       
        
        if AppConstants.servicetypeid == "1" {
            self.packagename.text = ""
            self.packagenamelbl.text = ""
            self.packagenameheightview.constant = 0
            
        }else{
            self.packagename.text = AppConstants.packagename
            self.packagenamelbl.text = "Package Name".localized
           self.packagenameheightview.constant = 55
        }
     
        self.rejectridebtn.setTitle("Reject Ride".localized, for: .normal)
        
        self.acceptridebtntext.setTitle("Accept Ride".localized, for: .normal)
        self.ridetypelbl.text = AppConstants.vehiclename
        self.paymentmethodlbl.text = AppConstants.paymentmethod
        self.datetimelbl.text = AppConstants.estimatedistance +  " | "  + AppConstants.estimatetime
        
        //ADDITIONAL NOTES VISIBILITY
        //===========================
        if AppConstants.additionalNotes == ""
        {
            self.notesStackView.isHidden = true
        }
        else
        {
            self.notesStackView.isHidden = false
            self.notesText.text = AppConstants.additionalNotes
        }
        
        //DROP POINT VISIBILITY
        //=====================
        if AppConstants.driverconfiguredata.data?.receiving?.dropPoint == false
        {
            self.dropStackView.isHidden = true
        }
        else
        {
            self.dropStackView.isHidden = false
            self.dropLocation.text = AppConstants.dropLocation
        }

        //ESTIMATE FARE VISIBILITY
        //========================
        if AppConstants.driverconfiguredata.data?.receiving?.estimateFare == false
        {
            self.estimateFare.isHidden = true
        }
        else
        {
            self.estimateFare.isHidden = false
            self.estimateFare.text = "Est. Fare : ".localized + AppConstants.estimateFare
        }
        
        self.pickLocation.text = AppConstants.pickuplocation
        
        
        let newImageString = AppConstants.vehicleimage
        AppConstants.downloadimage(imagename: newImageString, imageview: carimageview, placeholderimage: "mandy")
        
        
    }
    
    @objc func scanBigImageClick1(_ tap: UITapGestureRecognizer?) {
        print("点击图片")
        let clickedImageView = tap?.view as? UIImageView
        XWScanImage.scanBigImage(with: clickedImageView)
    }
    
    @objc func AcceptScreen(notification: NSNotification){
        
        
        DispatchQueue.main.async(execute: {
            
            
            self.timerview.stop()
            AppConstants.player?.stop()
            self.timerview.isActive = false
            AppConstants.acceptrejectTimer.invalidate()
            AppConstants.helloWorldTimer.invalidate()
            
            self.view.window?.rootViewController?.dismiss(animated: true, completion: {
                AppConstants.viewcontrollerself.viewDidLoad()
            })
            
//            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
//
//            if let window = self.view.window{
//                window.rootViewController = nextController
//            }
            
        })
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        AppConstants.screenfromaccept = "1"
        
        
        if autoStatus == "1"{
        
        
        timerview.stop()
        AppConstants.player?.stop()
        timerview.isActive = false
        
        AppConstants.acceptrejectTimer.invalidate()
        AppConstants.helloWorldTimer.invalidate()
        
        showLoaderWithoutBackground()
        
        print(AppConstants.bookingid)
        
        let dic1 = ["latitude":AppConstants.driverselectaddressLat,
                    "longitude":AppConstants.drivertselectaddressLng,
                    "booking_id":AppConstants.bookingid,
                    "accuracy":AppConstants.calculatedAccuracy
            ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERACCEPTRIDE
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameterLocationtimer1(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverAcceptModels.self)
        
        
        }else{
            
            
            showLoaderWithoutBackground()
            
            let dic2 = ["booking_id":AppConstants.bookingid] as [String : AnyObject]
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERTIMESTAMPURL
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameterLocationtimer1(apiRequestUrl, andRequestDictionary: dic2, requestHeader: AppConstants.dicauthorization, returningClass: TimeStampModel.self)
            
            
        
        guard let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            AppConstants.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = AppConstants.player else { return }
            
            player.play()
            
        } catch let error {
            
            guard let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3") else { return }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                
                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                AppConstants.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                
                guard let player = AppConstants.player else { return }
                
                player.play()
                
            } catch let error {
                
               
                print(error.localizedDescription)
            }
        }
            
        }
        
//        let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3")!
//
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else { return }
//            player.prepareToPlay()
//            player.play()
//        }
//        catch let error as NSError {
//            print(error.description)
//        }
    }
    
    
    @IBAction func infobtnclick(_ sender: Any) {
        
        hiddenview.isHidden = false
        tableview.reloadData()
        
        
    }
    
    
    func getCurrentMillis()->Int64 {
        print(Int64(Date().timeIntervalSince1970 * 1000))
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    @objc func sayHello()
    {
        timerview.stop()
        AppConstants.player?.stop()
        timerview.isActive = false
        AppConstants.acceptrejectTimer.invalidate()
        AppConstants.helloWorldTimer.invalidate()
        showLoaderWithoutBackground()
        
        let dic1 = ["booking_id":AppConstants.bookingid] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERRIDEREJECT
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverRideRejectModel.self)
//        self.acceptrejectTimer.invalidate()
//        self.timerview.stop()
//        self.timerview.isActive = false
    }
    
    
    @objc func sayHello1()
    {
        guard let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            AppConstants.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = AppConstants.player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
//        let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3")!
//
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else { return }
//            player.prepareToPlay()
//            player.play()
//        }
//        catch let error as NSError {
//            print(error.description)
//        }
        
        
    }
    
    
    @IBAction func rejectridebtn_click(_ sender: Any) {
        
        self.timerview.stop()
        AppConstants.player?.stop()
        self.timerview.isActive = false
        AppConstants.acceptrejectTimer.invalidate()
        AppConstants.helloWorldTimer.invalidate()
       
        showLoaderWithoutBackground()
        
        let dic1 = ["booking_id":AppConstants.bookingid] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERRIDEREJECT
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverRideRejectModel.self)
        
    }
    
    
    @IBAction func hiddencancelbtnclick(_ sender: Any) {
        
        hiddenview.isHidden = true
    }
    
    
    
    
    @IBAction func activeridebt_click(_ sender: Any) {
        
        timerview.stop()
        AppConstants.player?.stop()
        timerview.isActive = false
        
        AppConstants.acceptrejectTimer.invalidate()
        AppConstants.helloWorldTimer.invalidate()
        
        showLoaderWithoutBackground()
        let dic1 = ["latitude":AppConstants.driverselectaddressLat,
                    "longitude":AppConstants.drivertselectaddressLng,
                    "booking_id":AppConstants.bookingid,
                    "accuracy":AppConstants.calculatedAccuracy
                     ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERACCEPTRIDE
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverAcceptModels.self)
        
    }
    
}
extension AcceptRideViewController: ApiResponseReceiver {
    
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        if let responseData = response as? TimeStampModel{
            let data:TimeStampModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
//                let timestamp = NSDate().timeIntervalSince1970
//
//                calculatedtimestamp = Int(Double(timestamp) - Double(AppConstants.timestamp)!)
//                print(AppConstants.timestamp)
//                print(calculatedtimestamp)
                
                timetoshow = Double(Int(AppConstants.driverrequesttimeout)! - ((data.data?.diffrance)!))// -  self.timerview.elapsedTime
                print(timetoshow)
                
              
                if timetoshow <= 0{
                    
                    self.timerview.stop()
                    AppConstants.player?.stop()
                    self.timerview.isActive = false
                    AppConstants.acceptrejectTimer.invalidate()
                    AppConstants.helloWorldTimer.invalidate()
                    showLoaderWithoutBackground()
                    
                    let dic1 = ["booking_id":AppConstants.bookingid] as [String : AnyObject]
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERRIDEREJECT
                    ServiceManager.sharedInstance.delegate = self                    
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverRideRejectModel.self)
                }else{
                    self.timerview.totalTime = TimeInterval(timetoshow)
                    self.timerview.isActive = true
                    self.timerview.start()
                    self.timerview.elapsedTime = TimeInterval(timetoshow)
                    self.timerview.font = UIFont.boldSystemFont(ofSize: 30.0)
                    self.timerview.fontColor = UIColor.black
                    
                    AppConstants.acceptrejectTimer = Timer.scheduledTimer(timeInterval: TimeInterval(timetoshow), target: self, selector: #selector(AcceptRideViewController.sayHello), userInfo: nil, repeats: false)
                    
                    AppConstants.helloWorldTimer = Timer.scheduledTimer(timeInterval: 17.0, target: self, selector: #selector(AcceptRideViewController.sayHello1), userInfo: nil, repeats: true)
                    
                }
               
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
        }
        
        if let responseData = response as? DriverAcceptModels{
            let data:DriverAcceptModels = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                
                
                AppConstants.player?.stop()
                self.timerview.isActive = false
                AppConstants.acceptrejectTimer.invalidate()
                AppConstants.helloWorldTimer.invalidate()
                
                
               self.presentVC("TrackRideViewController")
                
//                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let nextController: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
//
//                if let window = self.view.window{
//                    window.rootViewController = nextController
//                }
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
        }
        if let responseData = response as? DriverRideRejectModel{
            let data:DriverRideRejectModel = responseData
            
            
            
            if (data.result == "1") {
                
               //s self.acceptrejectTimer.invalidate()
                
                hideLoaderWithoutBackground()
                self.view.window?.rootViewController?.dismiss(animated: true, completion: {
                    AppConstants.viewcontrollerself.viewDidLoad()
                })
//                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
//
//                if let window = self.view.window{
//                    window.rootViewController = nextController
//                }
            }else{
                hideLoaderWithoutBackground()
                
                self.view.window?.rootViewController?.dismiss(animated: true, completion: {
                    AppConstants.viewcontrollerself.viewDidLoad()
                })
//                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let nextController: OnlineViewController = storyboard.instantiateViewController(withIdentifier: "OnlineViewController") as! OnlineViewController
//
//                if let window = self.view.window{
//                    window.rootViewController = nextController
//            }
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


extension AcceptRideViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //personaldocsarray.count
        
        if tableView.tag == 2{
            return AppConstants.productDetailsData.count
        }else{
            return tablecount
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 2{
            
            let cell = itemsTableView.dequeueReusableCell(withIdentifier: "productdetailscell", for: indexPath) as! ProductDetailsTableViewCell
            
            cell.weightTextfield.isUserInteractionEnabled = false
//            cell.cellMailView.edgeWithOutShadow(edge: 5.0)
            cell.nameLabel.text = AppConstants.productDetailsData[indexPath.row].productName ?? ""
            cell.weightTextfield.text = AppConstants.productDetailsData[indexPath.row].quantity ?? ""
            cell.unitLabel.text = AppConstants.productDetailsData[indexPath.row].weightUnit ?? ""
            
            return cell
            
        }else{
            let cell = tableview.dequeueReusableCell(withIdentifier: "manualcell", for: indexPath) as! ManualTableViewCell
          
            cell.countrynamelbl.text = AppConstants.mutiplestops[indexPath.row]
            let tableheight = tableview.contentSize.height
            if tableheight < AppConstants.screenframeheight - 200.0{
                innerhiddenviewheight.constant = tableheight + 120.0
            }else{
                innerhiddenviewheight.constant = AppConstants.screenframeheight - 200.0
            }
            return cell
        }
        

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
       
        
    }
    
    
    
}


