//
//  AddChildrenTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 4/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class AddChildrenTableViewCell: UITableViewCell {

    @IBOutlet weak var cellmainview: UIView!
    @IBOutlet weak var countryimage: UIImageView!
    @IBOutlet weak var countrylbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
