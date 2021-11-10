//
//  FulltripCancelReasonTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 4/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class FulltripCancelReasonTableViewCell: UITableViewCell {
    @IBOutlet weak var cancelreasonlbl: UILabel!
    @IBOutlet weak var cancelreasonimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
