//
//  PastTripTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class PastTripTableViewCell: UITableViewCell {

    @IBOutlet weak var pastmainview: UIView!
    @IBOutlet weak var pastcelltopview: UIView!
    @IBOutlet weak var pastcelllocview: UIView!
    @IBOutlet weak var pastcellbottomview: UIView!
    @IBOutlet weak var lblTripIndex: UILabel!
    @IBOutlet weak var pastpaymentlbl: UILabel!
    @IBOutlet weak var pastcarnamenolbl: UILabel!
    @IBOutlet weak var pastdatetimelbl: UILabel!
    @IBOutlet weak var pastpickuploclbl: UILabel!
    @IBOutlet weak var pastdroploclbl: UILabel!
    //@IBOutlet weak var pastimgnamenolbl: UIView!
    @IBOutlet weak var pastimgnamenoview: UIView!
    @IBOutlet weak var pastridestatuslbl: UILabel!
    @IBOutlet weak var pastuserimgview: UIImageView!
    @IBOutlet weak var pastusernamelbl: UILabel!
    @IBOutlet weak var pastusercontactlbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
