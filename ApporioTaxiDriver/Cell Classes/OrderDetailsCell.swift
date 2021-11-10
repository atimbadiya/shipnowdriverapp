//
//  OrderDetailsCell.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 14/7/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit

class OrderDetailsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var lblOrderBarcodeValue: UILabel!
    @IBOutlet weak var lblrowIndex: UILabel!
    @IBOutlet weak var lblScanned: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblSkuNumber: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
