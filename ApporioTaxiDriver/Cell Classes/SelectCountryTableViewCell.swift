//
//  SelectCountryTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class SelectCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryname: UILabel!
    @IBOutlet weak var countryimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
