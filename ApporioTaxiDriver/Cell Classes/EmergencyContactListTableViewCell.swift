//
//  EmergencyContactListTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 4/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class EmergencyContactListTableViewCell: UITableViewCell {

    @IBOutlet weak var deletebtnview: UIView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var phonenolbl: UILabel!
    @IBOutlet weak var cellmainview: UIView!
    @IBOutlet weak var deletebtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
