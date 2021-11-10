//
//  VehicleListTableCell.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 21/02/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class VehicleListTableCell: UITableViewCell {

    //MARK:- IBOUTLETS
    //================
    
    
    @IBOutlet weak var radioimageview: UIImageView!
    @IBOutlet weak var radiobuttonview: UIView!
    
    
    @IBOutlet weak var vehicleidtext: UILabel!
    
    
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var vehicleName: UILabel!
    @IBOutlet weak var vehicleNumber: UILabel!
    @IBOutlet weak var vehicle_Name_Model: UILabel!
    @IBOutlet weak var vehicleServices: UILabel!
    @IBOutlet weak var vehicleMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data: VehicleListData,CheckValue: Int)
    {
        //SET VEHICLE IMAGE
        //================
        
        
        if CheckValue == 3000{
            
            self.radiobuttonview.isHidden = true
            
        }else{
            self.radiobuttonview.isHidden = false
            self.radioimageview.image = UIImage(named: "icons8-0-percent-filled-50")
        }
        
        
        
        let newString = data.vehicleTypeImage
        AppConstants.downloadimage(imagename: newString!, imageview: self.vehicleImage, placeholderimage: "mandy")
        self.vehicleName.text = data.vehicleType ?? "Not Found"
        
        self.vehicleidtext.text = "Vehicle Id :".localized + (data.shareCode ?? "")
        
        self.vehicle_Name_Model.text = "\(data.vehicleMake ?? "Not Found") | \(data.vehicleModel ?? "Not Found")"
        self.vehicleServices.text = data.serviceTypes ?? "Not Found"
        self.vehicleMessage.text = data.showMsg ?? "No Message"
        self.vehicleNumber.text = data.vehicleNumber ?? "Not found"
    }
}
