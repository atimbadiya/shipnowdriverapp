//
//  AddNewAddressViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/16/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
//import GooglePlacePicker
import ObjectMapper

//var placepicker:

class AddNewAddressViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate{
    
    var checkvalue = 0
    var placelatitude = ""
    var placelongitude = ""
    var placelocation = ""
    var tablecount = 0
    var tablecount1 = 0
    var check = 0
    var selectindexvalue = 0
    var olddata: DriverHomeLoadTimeModel!
    //var selectedcellvalue = ""
    var addnewdata: DriverHomeAddressModel!
    var checktableforvalue = "0"
    var selectedaddressid = 0
    var selectedid = 0
    
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var hiddeninnerview: UIView!
    @IBOutlet weak var saveaddresslbl: UILabel!
    @IBOutlet weak var placenamelbl: UILabel!
    @IBOutlet weak var enterplacetxtfld: UITextField!
    @IBOutlet weak var tophomeaddressview: UIView!
    @IBOutlet weak var addnewtableview: UITableView!
    @IBOutlet weak var yourhometoplbl: UILabel!
    @IBOutlet weak var hiddencancelbtn: UIButton!
    @IBOutlet weak var savebtn: UIButton!
    @IBOutlet weak var addnewbtn: UIButton!
    
    //var placepicker: GMSPlacePickerViewController!
    
    //var id = 0
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yourhometoplbl.text = "Your Home Address".localized
        
        saveaddresslbl.text = "Save Address".localized
        
        hiddencancelbtn.setTitle("CANCEL".localized, for: .normal)
        
        savebtn.setTitle("SAVE".localized, for: .normal)
        
        addnewbtn.setTitle("Add New".localized, for: .normal)
        
        hiddeninnerview.edgeWithShadow(edge: 4)
        hiddenview.isHidden = true
        tophomeaddressview.edgeWithShadow(edge: 0)
        
     self.callApi()
     
    }
    
    
    func callApi(){
        
        showLoaderWithoutBackground()
        
        let dic1 = [:] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSHOWADDEDADDRES
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverHomeLoadTimeModel.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("checkvalue \(checkvalue)")
        if checkvalue == 1{
        
        hiddenview.isHidden = false
        placenamelbl.text = name
         
        }else{
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
    self.presentingViewController?.presentingViewController?.dismissVC()
        
        
    }
    @IBAction func hiddencancelbtn_click(_ sender: Any) {
        
       hiddenview.isHidden = true
        
    }
    @IBAction func savebtn_click(_ sender: Any) {
        
        showLoaderWithoutBackground()
        
        let dic1 = ["latitude": placelatitude,
                    "location": name,
                    "address_name": enterplacetxtfld.text!,
                    "longitude": placelongitude] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERADDHOMEADDRESS
        ServiceManager.sharedInstance.delegate = self
        print("entered addresss \(enterplacetxtfld.text!)")
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverHomeAddressModel.self)
        
    }
    @IBAction func addnewbtn_click(_ sender: Any) {
        
//        let config = GMSPlacePickerConfig(viewport: nil)
//        let placePicker = GMSPlacePickerViewController(config: config)
//        placePicker.delegate = self
//        present(placePicker, animated: true, completion: nil)
        let center = CLLocationCoordinate2DMake(Double(AppConstants.driverselectaddressLat)!, Double(AppConstants.drivertselectaddressLng)!)
        let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
        let bounds = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.autocompleteBounds = bounds
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
        
    }
    
    @objc func deleteTapped(sender : UIButton!) {
        if checktableforvalue == "1"{
        selectedid = addnewdata.data![sender.tag].id!
            
        }
        else{
        selectedid = olddata.data![sender.tag].id!
        }
        print(selectedid)
        let dic1 = ["address_id":selectedid
                ] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERHOMELOCATIONDELETE
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverHomeLocationDeleteModel.self)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tablecount
        
//        if checktableforvalue == "1"{
//         return tablecount
//        }else{
//            return tablecount1
//        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addnewtableview.dequeueReusableCell(withIdentifier: "addnewaddrcell", for: indexPath) as! AddNewAddressTableViewCell
        cell.cellmainview.edgeWithShadow(edge: 4)
        
       //  if checktableforvalue == "1"{
        print("received addresss \(olddata.data![indexPath.row].addressValue!)")

        cell.secondlbl.text = olddata.data![indexPath.row].addressValue
        cell.firstlbl.text = olddata.data![indexPath.row].addressName
            cell.deletebtn_click.tag = indexPath.row
            cell.deletebtn_click.addTarget(self, action: #selector(deleteTapped(sender:)), for: .touchUpInside)
            
            if (olddata.data![indexPath.row].checkVisibility!){
               cell.selectimageview.image = UIImage(named: "radio-on-button")
            }else{
               cell.selectimageview.image = UIImage(named: "icons8-0-percent-filled-50")
            }
//        }
//         else{
//            cell.secondlbl.text = olddata.data![indexPath.row].addressValue
//            cell.firstlbl.text = olddata.data![indexPath.row].addressName
//            cell.deletebtn_click.tag = indexPath.row
//            cell.deletebtn_click.addTarget(self, action: #selector(deleteTapped(sender:)), for: .touchUpInside)
//
//            if (olddata.data![indexPath.row].checkVisibility!){
//                cell.selectimageview.image = UIImage(named: "radio-on-button")
//            }else{
//                cell.selectimageview.image = UIImage(named: "icons8-0-percent-filled-50")
//            }
//
//        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addnewtableview.deselectRow(at: indexPath, animated: true)
        check = indexPath.row
        selectindexvalue = indexPath.row
      //  addnewtableview.reloadData()
        //hiddenview.isHidden = true
        
//        if checktableforvalue == "1"{
//        selectedaddressid = ((addnewdata.data![selectindexvalue].id)!)
//        }else{
        selectedaddressid = ((olddata.data![selectindexvalue].id)!)
   //     }
        
        let dic1 = ["address_id":selectedaddressid,
                    "status": "1"] as [String : AnyObject]
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSELECTEDHOMEADDRESS
        ServiceManager.sharedInstance.delegate = self
        print(apiRequestUrl)
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverHomeLocationSelectionModel.self)
        
       // AppConstants.selectedcellvalue = addnewdata.data![selectindexvalue].addressValue!
        
    }

//func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
//    // Dismiss the place picker, as it cannot dismiss itself.
//
//    print("Place name \(place.name)")
//    print("Place address \(place.formattedAddress)")
//    print("Place attributions \(place.attributions)")
//    place.placeID
//    placelatitude = String((place.coordinate.latitude))
//    placelongitude = String((place.coordinate.longitude))
//    placelocation = place.formattedAddress ?? ""
//    //print(place.placeID)
//    //id = Int((place.placeID))!
//    name = place.name!
//    checkvalue = 1
//    //addnewtableview.reloadData()
//    viewController.dismiss(animated: true, completion: nil)
//
//}
//
//func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
//    // Dismiss the place picker, as it cannot dismiss itself.
//    viewController.dismiss(animated: true, completion: nil)
//
//    print("No place selected")
//}
  
}


extension AddNewAddressViewController: GMSAutocompleteViewControllerDelegate{
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print(place)
        
        placelatitude = String((place.coordinate.latitude))
        placelongitude = String((place.coordinate.longitude))
        placelocation = place.formattedAddress ?? ""
        //print(place.placeID)
        //id = Int((place.placeID))!
        name = place.formattedAddress!
        checkvalue = 1
        hiddenview.isHidden = false
        placenamelbl.text = name
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

extension AddNewAddressViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {

if let responseData = response as? DriverHomeAddressModel{
    let data:DriverHomeAddressModel = responseData
    
    addnewdata = data
    
    if (data.result == "1") {
        
        hideLoaderWithoutBackground()
         self.callApi()
//        hiddenview.isHidden = true
//        checktableforvalue = "1"
//        tablecount = (data.data?.count)!
        addnewtableview.reloadData()
    }
    else if data.result == "999" {
        
        UserDefaultUtility.removeAllUserDefault()
        
        self.presentVC("SplashViewController")
    }else{
      
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
    }
}
        
        if let responseData = response as? DriverHomeLoadTimeModel{
            let data:DriverHomeLoadTimeModel = responseData
            
            olddata = data
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                hiddenview.isHidden = true
                addnewtableview.isHidden = false
                tablecount = (olddata.data?.count)!
                
//                hello = data.data
                addnewtableview.reloadData()
                //addnewtableview
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                addnewtableview.isHidden = true
                tablecount = 0
                hideLoaderWithoutBackground()
//                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverHomeLocationSelectionModel{
            let data:DriverHomeLocationSelectionModel = responseData
            
            if (data.result == "1") {
                
                hideLoaderWithoutBackground()
                self.callApi()
               // tablecount = (data.data?.count)!
              // addnewtableview.reloadData()
            }
            else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
            }else{
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
        
        if let responseData = response as? DriverHomeLocationDeleteModel{
            let data:DriverHomeLocationDeleteModel = responseData
            
            if (data.result == "1") {
                
//                addnewtableview.reloadData()
                //hideLoaderWithoutBackground()
               self.callApi()
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



