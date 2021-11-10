//
//  ScheduledTripTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ScheduledTripTableViewCell: UITableViewCell {

    @IBOutlet weak var schedulecellmainview: UIView!
    @IBOutlet weak var schedulecelltopview: UIView!
    @IBOutlet weak var schedulecelllocview: UIView!
    @IBOutlet weak var schedulecellbottomview: UIView!
    @IBOutlet weak var lblTripIndex: UILabel!
    @IBOutlet weak var schedulepaymentmethodlbl: UILabel!
    @IBOutlet weak var schedulecarnamenolbl: UILabel!
    @IBOutlet weak var scheduledatetimelbl: UILabel!
    @IBOutlet weak var schedulepickuploclbl: UILabel!
    @IBOutlet weak var scheduledroploclbl: UILabel!
    @IBOutlet weak var userimgnamenoview: UIView!
    @IBOutlet weak var scheduletripstatuslbl: UILabel!
    @IBOutlet weak var scheduleuserimgview: UIImageView!
    @IBOutlet weak var scheduleusername: UILabel!
    @IBOutlet weak var scheduleusercontact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
