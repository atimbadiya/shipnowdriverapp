//
//  VehicleModelDataTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class VehicleModelDataTableViewCell: UITableViewCell {

    @IBOutlet weak var vehiclemodeldatalbl: UILabel!
    @IBOutlet weak var vehiclemodeldataimageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        accessoryType = selected ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
    }

}
