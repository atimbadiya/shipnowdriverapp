//
//  BookingsForPickupMarkerVC.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 30/9/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class BookingsForPickupMarkerVC: BaseViewController {

    @IBOutlet weak var lblPickupLocationName: UILabel!
    @IBOutlet weak var tblviewOrders: UITableView!
    @IBOutlet weak var btnPhoneNumber: UIButton!
    @IBOutlet weak var lblPickupAddress: UILabel!
    @IBOutlet weak var lblPhoneText: UILabel!
    var installedNavigationApps: [String] = ["Apple Maps"]

    var tripsData : [ActiveTripsRouteData] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tripsData = AppConstants.tripsByPickupAddress


    }
    
    override func viewDidAppear(_ animated: Bool) {
        lblPickupLocationName.text = tripsData[0].company_name!
        lblPickupAddress.text = tripsData[0].pickup_location!
        btnPhoneNumber.titleLabel?.text = " "
        lblPhoneText.text = tripsData[0].company_contact_number!
    }
    
    @IBAction func phoneNumberClicked(_ sender: Any) {
        if let phoneCallURL = URL(string: "telprompt://\(tripsData[0].company_contact_number!)") {

               let application:UIApplication = UIApplication.shared
               if (application.canOpenURL(phoneCallURL)) {
                   if #available(iOS 10.0, *) {
                       application.open(phoneCallURL, options: [:], completionHandler: nil)
                   } else {
                       // Fallback on earlier versions
                        application.openURL(phoneCallURL as URL)
                   }
               }
           }
    }
    
    
    @IBAction func backBtnClicked(_ sender: Any) {
        dismissVC()
    }
    
    
    @IBAction func navigationBtnClicked(_ sender: UIButton) {
        
        let location_latitude = tripsData[0].pickup_latitude!
        let location_longitude = tripsData[0].pickup_longitude!
        
            self.installedNavigationApps.removeAll()
            
        if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.apple.com")! as URL)){
            
            self.installedNavigationApps.append("Apple Maps")

        }
            if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)){
                
                self.installedNavigationApps.append("Google Maps")
            }
            
            // if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.waze.com")! as URL)){
            
            if(UIApplication.shared.canOpenURL(URL(string:"waze://")!)){
                
                self.installedNavigationApps.append("Waze")
            }
            
            let alert = UIAlertController(title: NSLocalizedString("Selection".localized, comment: ""), message: NSLocalizedString("Select Navigation App".localized, comment: ""), preferredStyle: .actionSheet)
            for app in self.installedNavigationApps {
                let button = UIAlertAction(title: app, style: .default, handler: { (action) in
                    
            if(app == "Google Maps"){
           
            UIApplication.shared.open(NSURL(string:"comgooglemaps-x-callback://?saddr=&daddr=\(location_latitude),\(location_longitude)&directionsmode=driving")! as URL, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                })
            }
            else if(app == "Waze"){
                        
            let urlStr:NSString = NSString(format: "waze://?ll=%f,%f&navigate=yes",location_latitude, location_longitude)
            print(urlStr)
                
            UIApplication.shared.open(NSURL(string: urlStr as String)! as URL, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
                
                //  UIApplication.shared.openURL(NSURL(string: (urlStr as String) as String)! as URL)
            }
                    
            else if(app == "Apple Maps"){
                
                UIApplication.shared.open(NSURL(string:
                    "http://maps.apple.com/?saddr=&daddr=\(location_latitude),\(location_longitude)&directionsmode=driving")! as URL, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                })
            } else{
                    
                }
            })
               
            alert.addAction(button)
            }
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""),
                                             style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            alert.popoverPresentationController?.sourceView = self.view
            alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
            alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            
            self.present(alert, animated: true){
                print("option menu presented")
            }
    }
}

extension BookingsForPickupMarkerVC: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblviewOrders.dequeueReusableCell(withIdentifier: "PickupOrdersViewCell", for: indexPath) as! PickupOrdersViewCell
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.lblBookingID.text = tripsData[indexPath.row].tracking_id!
        cell.lblBookingDate.text = tripsData[indexPath.row].booking_date!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppConstants.bookingid = "\(tripsData[indexPath.row].booking_id!)"
        AppConstants.fullTripDetailsData = tripsData[indexPath.row]
        AppConstants.IsOrderMultiPickup = false
        
        self.presentVC("FullTripDetailsViewController")
    }
}

