//
//  ActivateSubscriptionTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 14/10/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ActivateSubscriptionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var rideprogresslabel: UIProgressView!
    @IBOutlet weak var topcontainerview: UIView!
    
    @IBOutlet weak var rideleftlabel: UILabel!
    @IBOutlet weak var maxactiveridelabel: UILabel!
    
    @IBOutlet weak var activesubtitlelabel: UILabel!
    
    @IBOutlet weak var validtilllabel: UILabel!
    
    
    @IBOutlet weak var viewactivedetailsbtn: UIButton!
    
    @IBOutlet weak var activepackagename: UILabel!
    @IBOutlet weak var activepackageiamge: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
