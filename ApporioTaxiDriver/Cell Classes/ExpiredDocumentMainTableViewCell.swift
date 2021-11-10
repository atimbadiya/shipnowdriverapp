//
//  ExpiredDocumentMainTableViewCell.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 16/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ExpiredDocumentMainTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var expiredVehicleDocumentTableView: UITableView!
    @IBOutlet weak var vehicleDetailsView: UIView!
    
    @IBOutlet weak var expiredDocumentTabelViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        expiredVehicleDocumentTableView.delegate = self
        expiredVehicleDocumentTableView.dataSource = self

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expiredVehicleDocumentTableView.dequeueReusableCell(withIdentifier: "expiredVehicleDocumentCell") as! ExpiredVehicleDocumentCell
        return cell
    }

}

