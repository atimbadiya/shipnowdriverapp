//
//  SuperDriverTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 3/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class SuperDriverTableViewCell: UITableViewCell {

    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var driverimageview: UIImageView!
    @IBOutlet weak var celldrivername: UILabel!
    @IBOutlet weak var celltotaltrips: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
