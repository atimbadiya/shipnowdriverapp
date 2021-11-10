//
//  SubscriptionListTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 26/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit


class SubscriptionListTableViewCell: UITableViewCell {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var subscriptionPackageImage: UIImageView!
    @IBOutlet weak var subscriptionPackageName: UILabel!
    @IBOutlet weak var SubscriptionPackagePrice: UILabel!
    @IBOutlet weak var activeStatusLabel: UILabel!
    @IBOutlet weak var subscriptionPackView: UIView!
    @IBOutlet weak var subscriptionMaxRidesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.subscriptionPackView.edgeWithShadow(edge: 2.0)
        self.subscriptionPackageImage.layer.cornerRadius = 35.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setSubscriptionData(data: SubscriptionData)
    {
        let imageUrl = data.image ?? ""
        AppConstants.downloadimage(imagename: imageUrl, imageview: self.subscriptionPackageImage, placeholderimage: "mandy")
        self.subscriptionPackageName.text = data.name ?? "Not Found"
        self.SubscriptionPackagePrice.text = data.showPrice ?? "Not Found"
        subscriptionMaxRidesLabel.text = "Maximum Rides" +  ": \(data.maxTrip ??  0)"
        
        
        self.activeStatusLabel.isHidden = true
        
//        if data.active == true
//        {
//            self.activeStatusLabel.isHidden = false
//        }
//        else
//        {
//            self.activeStatusLabel.isHidden = true
//        }
    }

}
