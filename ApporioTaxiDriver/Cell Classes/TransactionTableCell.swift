//
//  TransactionTableCell.swift
//  WalletScreens
//
//  Created by Gyanender on 19/02/19.
//  Copyright © 2019 Apporio Lap0026. All rights reserved.
//

import UIKit

class TransactionTableCell: UITableViewCell {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var transactionStatusLabel: UILabel!
    @IBOutlet weak var transactionImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK:- SET DATA IN CELL
    //=======================
    func setData(data: RecentTransactoin)
    {
        let newstring = data.icon
        
        AppConstants.downloadimage(imagename: newstring!, imageview: transactionImageView, placeholderimage: "mandy")
        self.amountLabel.text = data.amount
        self.dateLabel.text = data.date
        self.transactionStatusLabel.text = data.narration
    }

}
