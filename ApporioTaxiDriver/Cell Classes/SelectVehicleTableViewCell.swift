//
//  SelectVehicleTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class SelectVehicleTableViewCell: UITableViewCell {

    @IBOutlet weak var selectvehicletype: UILabel!
    @IBOutlet weak var selectvehicleimageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
