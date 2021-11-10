//
//  WeeklyStatementTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class WeeklyStatementTableViewCell: UITableViewCell {

    @IBOutlet weak var tablemainview: UIView!
    @IBOutlet weak var daylbl: UILabel!
    @IBOutlet weak var noofrideslbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
