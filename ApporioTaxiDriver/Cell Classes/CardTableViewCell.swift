//
//  CardTableViewCell.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 28/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var deletebtn: UIButton!
    
    @IBOutlet weak var cardnumbertext: UILabel!
    
    @IBOutlet weak var expdatetext: UILabel!
    
    @IBOutlet weak var deletebtnview: UIView!
    
    @IBOutlet weak var selectbtnview: UIView!
    
    @IBOutlet weak var selectbtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
