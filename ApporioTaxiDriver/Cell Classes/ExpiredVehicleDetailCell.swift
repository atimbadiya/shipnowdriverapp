//
//  ExpiredVehicleCell.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 16/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

protocol UploadDocumentProtocol {
    func loadUploadCpntroller() -> Void
}


class ExpiredVehicleDetailCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var vehicleName: UILabel!
    @IBOutlet weak var vehicleNumber: UILabel!
    @IBOutlet weak var expiredDocumentTableView: UITableView!
    var documentData: [DriverVehicleDocument]!
    var documentData1: [DriverPersonalVehicleDocuments]!
    var tableCount = 0
    var delegate: UploadDocumentProtocol?
    var id = 0
    
    var comefrom = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.expiredDocumentTableView.delegate = self
        self.expiredDocumentTableView.dataSource = self

        // Configure the view for the selected state
    }
    
    //MARK:- FUNCTIONS
    //================
    func setExpiredVehicleData(data: ExpiredVehicleDocuments)
    {
        
        self.comefrom = "expire"
        
        let urlString = data.vehicleImage
        AppConstants.downloadimage(imagename: urlString!, imageview: self.vehicleImage, placeholderimage: "mandy")
        self.vehicleName.text = (data.vehicleMakeName ?? "") + " | " + (data.vehicleModelName ?? "")
        self.vehicleNumber.text = data.vehicleNumber ?? ""
        self.documentData = data.driverVehicleDocument ?? []
        self.tableCount = self.documentData.count
        self.expiredDocumentTableView.reloadData()
    }
    
    
    func setPersonalVehicleData(data: DriverPersonalVehicleDocument)
    {
        
        self.comefrom = "personal"
        
        let urlString = data.vehicleImage
        AppConstants.downloadimage(imagename: urlString!, imageview: self.vehicleImage, placeholderimage: "mandy")
      //  self.vehicleName.text = ""
     //   self.vehicleNumber.text = ""
       self.vehicleName.text = (data.vehicletype ?? "") + " | " + (data.vehiclemodel ?? "")
       self.vehicleNumber.text = data.vehiclenumber ?? ""
        self.documentData1 = data.vehicleDocuments ?? []
        self.tableCount = self.documentData1.count
        self.expiredDocumentTableView.reloadData()
    }
    
    //MARK:- TABLEVIEW DELEGATE AND DATA SOURCE
    //=========================================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ExpiredDocumentCell", owner: self, options: nil)?.first as! ExpiredPersonalCell
        
        
        if self.comefrom == "expire"{
        
        
        let urlString = self.documentData?[indexPath.row].document ?? ""
        
        print("dghfwej")
        AppConstants.downloadimage(imagename: urlString, imageview: cell.documentImage, placeholderimage: "mandy")
        cell.documentName.text = self.documentData?[indexPath.row].documentName ?? "Not Found"
        cell.uploadDate.text =  "" //self.data?[indexPath.row].documentName
        cell.expiredDate.text = self.documentData?[indexPath.row].expireDate ?? "Not Found"
        let verificationStatus = self.documentData?[indexPath.row].documentVerificationStatus ?? 4
        if verificationStatus == 0
        {
            cell.showStatus.text = "Upload Document".localized
        }
        if verificationStatus == 1
        {
            cell.showStatus.text = "Verification Pending".localized
        }
        if verificationStatus == 2
        {
            cell.showStatus.text = "Verified".localized
        }
        if verificationStatus == 3
        {
            cell.showStatus.text = "REJECTED".localized
        }
        if verificationStatus == 4
        {
            cell.showStatus.text = "EXPIRED".localized
        }
            
            
        }else{
            
            let urlString = self.documentData1?[indexPath.row].image ?? ""
            
            print("dghfwej")
            AppConstants.downloadimage(imagename: urlString, imageview: cell.documentImage, placeholderimage: "mandy")
            cell.documentName.text = self.documentData1?[indexPath.row].documentname ?? "Not Found"
            cell.uploadDate.text =  "Uploaded on: ".localized + (self.documentData1?[indexPath.row].uploadedAt ?? "Not Found")
            cell.expiredDate.text = "Expiry: ".localized +  (self.documentData1?[indexPath.row].expireDate ?? "Not Found")
            let verificationStatus = self.documentData1?[indexPath.row].documentVerificationStatus ?? 4
            if verificationStatus == 0
            {
                cell.showStatus.text = "Upload Document".localized
            }
            if verificationStatus == 1
            {
                cell.showStatus.text = "Verification Pending".localized
            }
            if verificationStatus == 2
            {
                cell.showStatus.text = "Verified".localized
            }
            if verificationStatus == 3
            {
                cell.showStatus.text = "REJECTED".localized
            }
            if verificationStatus == 4
            {
                cell.showStatus.text = "EXPIRED".localized
            }
            
            
            
            
        }
            
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
         if self.comefrom == "expire"{
        
        if let delegate = delegate as? ExpiredDocumentsViewController
        {
            print(self.id)
            AppConstants.drivervehicleid = String((self.documentData[indexPath.row].driverVehicleId)!)
            
            UserDefaultUtility.saveStringWithKey(String((self.documentData[indexPath.row].driverVehicleId ?? 0)!), key: AppConstants.UserDefaultKeys.VEHICLE_ID)
            
            AppConstants.documentstatus = "1"
            AppConstants.selecteddocumentId = String((self.documentData[indexPath.row].documentId)!)
            delegate.loadUploadCpntroller()
        }
            
         }else{
            
            if let delegate = delegate as? NewPersonalDocumentViewController
            {
                
                
                let verificationStatus = self.documentData1?[indexPath.row].documentVerificationStatus ?? 4
                
                
                if (self.documentData1?[indexPath.row].tempdocupload)!{
                    
                    AppConstants.drivervehicleid = String((self.id))
                    AppConstants.managedocumenttype = "2"
                    AppConstants.documentstatus = "1"
                    AppConstants.selecteddocumentId = String((self.documentData1[indexPath.row].id)!)
                    
                    delegate.loadUploadCpntroller()
                }else{
                
                
                if (verificationStatus == 0 || verificationStatus == 3 || verificationStatus == 4){
                    AppConstants.drivervehicleid = String((self.id))
                    AppConstants.managedocumenttype = "1"
                    AppConstants.documentstatus = "1"
                    AppConstants.selecteddocumentId = String((self.documentData1[indexPath.row].id)!)
                    
                    delegate.loadUploadCpntroller()
                }
                else{
                    
                    
                }
                
                }
            }
            
            
            
        }
    }

}
