//
//  PersonalDocsTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class PersonalDocsTableViewCell: UITableViewCell {

    @IBOutlet weak var personaldocumenttypelabel: UILabel!
    @IBOutlet weak var personaluploaddocument: UILabel!
    @IBOutlet weak var mandatoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
