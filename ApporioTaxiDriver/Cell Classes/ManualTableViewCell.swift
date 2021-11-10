//
//  ManualTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/26/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ManualTableViewCell: UITableViewCell {
    @IBOutlet weak var cellmainview: UIView!
    @IBOutlet weak var countrynamelbl: UILabel!
    @IBOutlet weak var selectedimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
