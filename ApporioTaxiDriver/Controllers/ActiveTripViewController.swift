//
//  ActiveTripViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ActiveTripViewController: BaseViewController {
    
    @IBOutlet weak var activetriptableview: UITableView!
    var activeridedata: ActiveRideModel!
    var tablecount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.callApi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.callApi()
//        if AppConstants.cancelbtnvaluematch == "2"{
//            AppConstants.cancelbtnvaluematch  = ""
//            self.callApi()
//        }
    }

    func callApi(){

        tablecount = 0
        showLoaderWithoutBackground()
        AppConstants.tripstype = String((AppConstants.driverconfiguredata.data?.segments![0].id ?? 0)!)
        let dic1 = ["type": AppConstants.tripstype as AnyObject,
                    
                    ] as [String : AnyObject]
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.ACTIVERIDES
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ActiveRideModel.self)
    }
}

extension ActiveTripViewController: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = activetriptableview.dequeueReusableCell(withIdentifier: "activetrip", for: indexPath) as! ActivetripTableViewCell

        cell.mainview.edgeWithShadow(edge: 4.0)
        cell.mainview.layer.cornerRadius = 10
        cell.lblTripIndex.text = "\(activeridedata.data![indexPath.row].order_position ?? 0)"
        cell.rideidtext.text = activeridedata.data![indexPath.row].highlightedLeftText ?? ""
        
        cell.rideidtext.textColor = PListUtility.getColorFromHex(hexString:  activeridedata.data![indexPath.row].highlightedLeftText!)
        
        cell.datetext.text = activeridedata.data![indexPath.row].smallLeftText ?? ""

        cell.paymentmethodtext.text = activeridedata.data![indexPath.row].highlightedRightText ?? ""

        cell.paymentmethodtext.textColor = PListUtility.getColorFromHex(hexString: "#" + activeridedata.data![indexPath.row].highlightedRightTextColor!)

        cell.pickuplocationtext.text = activeridedata.data![indexPath.row].pickLocation ?? ""

        cell.droplocationtext.text = activeridedata.data![indexPath.row].dropLocation ?? ""

        cell.ridestatustext.text = activeridedata.data![indexPath.row].statusText ?? ""

        cell.ridestatustext.textColor = PListUtility.getColorFromHex(hexString: "#" + activeridedata.data![indexPath.row].statusTextColor!)

        if activeridedata.data![indexPath.row].userDescriptionLayoutVisibility!{

            cell.userviewvisible.isHidden = false

            cell.userimageview.makeViewCircular()

            let newstring = activeridedata.data?[indexPath.row].circularImage ?? ""

            if newstring == ""
            {
            }
            else
            {
                AppConstants.downloadimage(imagename: newstring, imageview: cell.userimageview, placeholderimage: "mandy")
            }

            //cell.driverratingvalue.editable = false

            cell.usernametext.text = activeridedata.data![indexPath.row].userNameText

            //cell.driverratingvalue.rating = Float((activeridedata.data![indexPath.row].driverRating)!)!

        }else{

            cell.userviewvisible.isHidden = true
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activetriptableview.deselectRow(at: indexPath, animated: true)

        AppConstants.bookingid = String((activeridedata.data![indexPath.row].bookingId)!)
        AppConstants.triptypeid = 1
        self.presentVC("FullTripDetailsViewController")
    }
}

extension ActiveTripViewController: ApiResponseReceiver{

    func onSuccess<T>(_ response: T) where T : Mappable {

        if let responseData = response as? ActiveRideModel{

            let data:ActiveRideModel = responseData

            activeridedata = data

            if activeridedata.result == "1" {

                hideLoaderWithoutBackground()
                activetriptableview.isHidden = false
                
                self.toastLabel.isHidden = true
                tablecount = (activeridedata.data?.count)!
                activetriptableview.reloadData()

            }else if activeridedata.result == "999" {

                UserDefaultUtility.removeAllUserDefault()

                self.presentVC("SplashViewController")

            } else {
                self.view.addSubview(toastLabel)
                self.toastLabel.text = data.message!
                self.toastLabel.isHidden = false
                
                activetriptableview.isHidden = true
                hideLoaderWithoutBackground()
             //   showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)

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
