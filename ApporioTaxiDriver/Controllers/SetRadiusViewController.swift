//
//  SetRadiusViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 19/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import ObjectMapper

class SetRadiusViewController: BaseViewController {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var currentLocationText: UILabel!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var currenLocationImage: UIImageView!
    @IBOutlet weak var radiusTextField: UITextField!
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var radiusTitle: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK:- VARIABLES
    //================
    var locationManager = CLLocationManager()
    var lat = ""
    var lng = ""
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.radiusTextField.delegate = self
        
        self.viewTitle.text = "Choose Location".localized
        self.radiusTitle.text = "Set a Radius".localized
        self.submitButton.setTitle("SUBMIT", for: .normal)
        
        currenLocationImage.image = currenLocationImage.image!.withRenderingMode(.alwaysTemplate)
        currenLocationImage.tintColor = UIColor.appTextMidLightColor()

        self.locationView.layer.cornerRadius = 16.0
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        AppConstants.calculatedAccuracy = self.locationManager.desiredAccuracy
        self.locationManager.pausesLocationUpdatesAutomatically = false
        //  self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        
        self.locationManager.startUpdatingLocation()
        self.mapView.delegate = self
        self.mapView.isMyLocationEnabled = true
        self.mapView.animate(toZoom: 15)
    }
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backBtnTapped(_ sender: Any)
    {
        self.dismissVC()
    }
    
    @IBAction func currentLocBtnTapped(_ sender: Any)
    {
        self.locationManager.startUpdatingLocation()
        self.mapView.animate(toZoom: 16)
    }
    
    @IBAction func submitBtnTapped(_ sender: Any)
    {
        if radiusTextField.text == ""
        {
            showErrorAlert("Alert".localized, alertMessage: "Please enter radius (in KM)".localized, VC: self)
        }
        else
        {
            let dic1 = ["latitude": self.lat,
                        "longitude": self.lng,
                "radius": radiusTextField.text!
            ] as [String : AnyObject]
            
        showLoaderWithoutBackground()
            
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.SETDRIVERRADIUS
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SetRadiusModel.self)

        }
    }
    
}

//MARK:- CURRENT LOCATION DELEGATE
//================================
extension SetRadiusViewController: CLLocationManagerDelegate
{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.first
        {
            reverseGeocodeCoordinate(coordinate: location.coordinate)
            lat = String(location.coordinate.latitude)
            lng = String(location.coordinate.longitude)
            let userLocation = locations.last
            let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude, zoom: 16);
            self.mapView.camera = camera
            self.locationManager.stopUpdatingLocation()
        }
    }
}

//MARK:- CURRENT LOCATION DELEGATE
//================================
extension SetRadiusViewController: GMSMapViewDelegate
{
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition)
    {
        
        reverseGeocodeCoordinate(coordinate: position.target)
    }
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D)
    {
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate)
        { response, error in
            if let address = response?.firstResult()
            {
                        self.lng = String(coordinate.longitude)
                        self.lat = String(coordinate.latitude)
                        let lines = address.lines
                        self.currentLocationText.text = lines!.joined(separator: " ")
            }
        }
    }
}

//MARK:- CURRENT LOCATION DELEGATE
//================================
extension SetRadiusViewController: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == -1 || string == ""
        {
            return true
        }
        return Int(string) != nil
    }
}

//MARK:- API RESPONSE
//===================
extension SetRadiusViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? SetRadiusModel
        {
            let data:SetRadiusModel = responseData
            if (data.result == "1")
            {
                hideLoaderWithoutBackground()
                let alertController = UIAlertController(title: "Alert".localized, message: data.message ?? "Not Message Found", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "ok".localized, style: .default)
                { (action) in
                    self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true)
            }
            else if data.result == "999"
            {
                
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
    }
    func onError(_ errorResponse: String, errorObject: AnyObject?)
    {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }

}
