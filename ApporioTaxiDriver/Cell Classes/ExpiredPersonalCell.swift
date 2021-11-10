//
//  ExpiredPersonalCell.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 16/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ExpiredPersonalCell: UITableViewCell {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var documentImage: UIImageView!
    @IBOutlet weak var documentName: UILabel!
    @IBOutlet weak var mandatoryLabel: UILabel!
    @IBOutlet weak var uploadDate: UILabel!
    @IBOutlet weak var expiredDate: UILabel!
    @IBOutlet weak var showStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setExpiredDocumentData(data: ExpiredPersonalDocuments)
    {
        let urlString = data.documentFile
        AppConstants.downloadimage(imagename: urlString!, imageview: self.documentImage, placeholderimage: "mandy")
        self.documentName.text = data.documentName ?? "Not Found"
        self.expiredDate.text = data.documentExpiryDate ?? "Not Found"
        self.uploadDate.text = ""
        let verificationStatus = data.documentVerificationStatus ?? 4
        if verificationStatus == 0
        {
            self.showStatus.text = "Upload Document".localized
        }
        if verificationStatus == 1
        {
            self.showStatus.text = "Verification Pending".localized
        }
        if verificationStatus == 2
        {
            self.showStatus.text = "Verified".localized
        }
        if verificationStatus == 3
        {
            self.showStatus.text = "REJECTED".localized
        }
        if verificationStatus == 4
        {
            self.showStatus.text = "EXPIRED".localized
        }
    }
    
    
    
    func setPersonalDocumentData(data: DriverPersonalData)
    {
        let urlString = data.image
        AppConstants.downloadimage(imagename: urlString!, imageview: self.documentImage, placeholderimage: "mandy")
        self.documentName.text = data.documentname ?? ""
        self.expiredDate.text =  "Expiry: ".localized + (data.expireDate ?? "")
        self.uploadDate.text = "Uploaded on: ".localized + (data.uploadedAt ?? "")
        let verificationStatus = data.documentVerificationStatus ?? 4
        if verificationStatus == 0
        {
            self.showStatus.text = "Upload Document".localized
        }
        if verificationStatus == 1
        {
            self.showStatus.text = "Verification Pending".localized
        }
        if verificationStatus == 2
        {
            self.showStatus.text = "Verified".localized
        }
        if verificationStatus == 3
        {
            self.showStatus.text = "REJECTED".localized
        }
        if verificationStatus == 4
        {
            self.showStatus.text = "EXPIRED".localized
        }
    }

}
