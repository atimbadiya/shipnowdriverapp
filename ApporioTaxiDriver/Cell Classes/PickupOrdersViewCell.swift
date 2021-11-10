//
//  PickupOrdersViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 30/9/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit

class PickupOrdersViewCell: UITableViewCell {

    @IBOutlet weak var lblBookingID: UILabel!
    @IBOutlet weak var lblBookingDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
