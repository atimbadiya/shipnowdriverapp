//
//  AddNewAddressTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/16/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class AddNewAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var selectimageview: UIImageView!
    @IBOutlet weak var firstlbl: UILabel!
    @IBOutlet weak var secondlbl: UILabel!
    @IBOutlet weak var cellmainview: UIView!
     @IBOutlet weak var deletebtn_click: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
