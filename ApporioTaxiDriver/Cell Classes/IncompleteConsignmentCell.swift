//
//  IncompleteConsignmentCell.swift
//  ApporioTaxiDriver
//
//  Created by Ankit's Mac on 17/6/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit

class IncompleteConsignmentCell: UITableViewCell {

    @IBOutlet weak var cellBackView: UIView!
    @IBOutlet weak var lblTrackingID: UILabel!
    @IBOutlet weak var lblScheduledDate: UILabel!
    @IBOutlet weak var lblPickupAddress: UILabel!
    @IBOutlet weak var lblDeliveryAddress: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    
    @IBOutlet weak var lblReceiverName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblBookingStatus: UILabel!
    @IBOutlet weak var lblConsignment: UILabel!
    @IBOutlet weak var btnNavigation: UIButton!
    
    @IBOutlet weak var lblNumOfScannedParcels: UILabel!
    @IBOutlet weak var lblRowIndex: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }

}
