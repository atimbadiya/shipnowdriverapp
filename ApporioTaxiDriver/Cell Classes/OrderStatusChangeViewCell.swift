//
//  OrderStatusChangeViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 8/10/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit

class OrderStatusChangeViewCell: UITableViewCell {

    @IBOutlet weak var cellBackView: UIView!
    
    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var btnCellSelected: UIButton!
    
    @IBOutlet weak var imgCellSelected: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
