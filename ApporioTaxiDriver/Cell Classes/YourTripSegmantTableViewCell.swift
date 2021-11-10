//
//  YourTripSegmantTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 26/07/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class YourTripSegmantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryimageview: UIImageView!
    
    @IBOutlet weak var selectedview: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
