//
//  InputByDriverTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 9/13/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class InputByDriverTableViewCell: UITableViewCell {

    @IBOutlet weak var amounttypelabel: UILabel!
    @IBOutlet weak var amounttextfield: UITextField!
    @IBOutlet weak var lineview: UIView!
    @IBOutlet weak var infobtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
