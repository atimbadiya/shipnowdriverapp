//
//  ManageVehicleDocsTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 04/07/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ManageVehicleDocsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var managedocdriverimgview: UIImageView!
    @IBOutlet weak var managedocmainview: UIView!
    @IBOutlet weak var idnamelbl: UILabel!
    @IBOutlet weak var uploaddatelbl: UILabel!
    @IBOutlet weak var expierydatelbl: UILabel!
    @IBOutlet weak var verificationstatuslbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
