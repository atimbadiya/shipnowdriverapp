//
//  OutstationUpcomingTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class OutstationUpcomingTableViewCell: UITableViewCell {

    @IBOutlet weak var outstationcellmainview: UIView!
    @IBOutlet weak var outstationcelltopview: UIView!
    @IBOutlet weak var outstationcelllocview: UIView!
    @IBOutlet weak var outstationcellbottomview: UIView!
    
    @IBOutlet weak var outpaymentmethodlbl: UILabel!
    @IBOutlet weak var outcarnamenolbl: UILabel!
    @IBOutlet weak var outdatetimelbl: UILabel!
    @IBOutlet weak var outpickuplbl: UILabel!
    @IBOutlet weak var outdroplbl: UILabel!
   
    @IBOutlet weak var outuservisibleview: UIView!
    @IBOutlet weak var outusernamelbl: UILabel!
    @IBOutlet weak var outuserimgview: UIImageView!
    
    @IBOutlet weak var outrideststuslbl: UILabel!
    
    @IBOutlet weak var outusercontactlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
