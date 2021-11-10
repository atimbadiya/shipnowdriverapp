//
//  NewRequestUpcomingTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class NewRequestUpcomingTableViewCell: UITableViewCell {

    @IBOutlet weak var newupcomingmainview: UIView!
    @IBOutlet weak var newupcomingcelltopview: UIView!
    
    @IBOutlet weak var newupcomingcelllocview: UIView!
    @IBOutlet weak var newdatetimelbl: UILabel!
    
    @IBOutlet weak var newupcomingcellbottomview: UIView!
    
    @IBOutlet weak var newupcomingpaymentlbl: UILabel!
    @IBOutlet weak var newupcomingcarnamenolbl: UILabel!
    @IBOutlet weak var newpickuplbl: UILabel!
    
    @IBOutlet weak var newdroplbl: UILabel!
    
    @IBOutlet weak var newuserimgnamenoview: UIView!
    
    @IBOutlet weak var newuserridestatuslbl: UILabel!
    @IBOutlet weak var newuserimgview: UIImageView!
    
    @IBOutlet weak var newusernamelbl: UILabel!
    @IBOutlet weak var newuserphonelbl: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
