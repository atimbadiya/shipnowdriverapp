//
//  ManagePresonalDocsTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/9/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ManagePresonalDocsTableViewCell: UITableViewCell {

    @IBOutlet weak var managedocdriverimgview: UIImageView!
    @IBOutlet weak var managedocmainview: UIView!
    @IBOutlet weak var idnamelbl: UILabel!
    @IBOutlet weak var uploaddatelbl: UILabel!
    @IBOutlet weak var expierydatelbl: UILabel!
    @IBOutlet weak var verificationstatuslbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
