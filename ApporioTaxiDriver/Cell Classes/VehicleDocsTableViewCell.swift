//
//  VehicleDocsTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class VehicleDocsTableViewCell: UITableViewCell {
    @IBOutlet weak var vehicledocnamelabel: UILabel!
    @IBOutlet weak var vehicleuploaddoclabel: UILabel!
    @IBOutlet weak var mandatoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
