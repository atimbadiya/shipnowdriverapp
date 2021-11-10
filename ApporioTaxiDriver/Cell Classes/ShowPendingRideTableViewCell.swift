//
//  ShowPendingRideTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Atul Jain on 19/02/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ShowPendingRideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var namephonetext: UILabel!
    @IBOutlet weak var ongoningridetext: UILabel!
    @IBOutlet weak var ratingispendingtext: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var gotoridebtn: UIButton!
    
    @IBOutlet weak var maiview: UIView!
    
    @IBOutlet weak var gotorideview: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
