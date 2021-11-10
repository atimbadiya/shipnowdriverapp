//
//  DayStatementTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class DayStatementTableViewCell: UITableViewCell {

    @IBOutlet weak var daydetaillbl: UILabel!
   // @IBOutlet weak var daylabel: UILabel!
    @IBOutlet weak var numberofrideslbl: UILabel!
    @IBOutlet weak var cellmainview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
