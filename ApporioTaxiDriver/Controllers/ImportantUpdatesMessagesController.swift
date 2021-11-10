//
//  ImportantUpdatesMessagesController.swift
//  ApporioTaxiDriver
//
//  Created by Ship Now 2 on 1/11/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import DTPhotoViewerController

class ImportantUpdatesMessagesController: BaseViewController {

    @IBOutlet weak var scrollviewMessages: UIScrollView!
    
    @IBOutlet weak var adminMessageView: UIView!
    @IBOutlet weak var adminInnerTxtview: UIView!
    @IBOutlet weak var txtAdminMessage: UITextView!
    @IBOutlet weak var adminMsgviewHeight: NSLayoutConstraint!
    @IBOutlet weak var lblNumOfAdminMsg: UILabel!
    
    @IBOutlet weak var userMessageView: UIView!
    @IBOutlet weak var userInnerTxtview: UIView!
    @IBOutlet weak var txtUserMessage: UITextView!
    @IBOutlet weak var userInnerImageview: UIView!
    @IBOutlet weak var imgUserMessage: UIImageView!
    @IBOutlet weak var userMsgviewHeight: NSLayoutConstraint!
    @IBOutlet weak var lblNumOfUserMsg: UILabel!
    var imgUserAssigned : UIImage?
    @IBOutlet weak var corporateMessageView: UIView!
    @IBOutlet weak var corporateInnerMsgview: UIView!
    @IBOutlet weak var txtCorporateMsg: UITextView!
    @IBOutlet weak var corporateMsgviewHeight: NSLayoutConstraint!
    @IBOutlet weak var lblNumOfCorporateMsg: UILabel!
    var additionalInfoData : DriverTripAdditionalDropoffInfoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        additionalInfoData = AppConstants.additionalDropoffInfo
        
        adminMsgviewHeight.constant = 130.0
        userMsgviewHeight.constant = 270.0
        corporateMsgviewHeight.constant = 130.0
        self.loadInfoAndManageSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func imgUsermsgClicked(_ sender: Any) {
        let viewController = DTPhotoViewerController(referencedView: imgUserMessage, image: imgUserAssigned)
        self.present(viewController, animated: true, completion: nil)
    }
    
    @objc func displayImageWithPhotoViewer(sender: UITapGestureRecognizer){
        
        let viewController = DTPhotoViewerController(referencedView: imgUserMessage, image: imgUserAssigned)
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    func loadInfoAndManageSubviews()
    {
        if let operation_message = additionalInfoData?.operation_message{
            if operation_message != ""{
                txtAdminMessage.text = operation_message
                adminInnerTxtview.isHidden = false
            }
            else{
                adminMsgviewHeight.constant -= 80.0
                adminInnerTxtview.isHidden = true
            }
        }
        
        if let customer_message = additionalInfoData?.customer_message{
            
            if customer_message != ""
            {
                txtUserMessage.text = customer_message
                userInnerTxtview.isHidden = false
            }else{
                userMsgviewHeight.constant -= 80.0
                userInnerTxtview.isHidden = true
            }
        }
        
        if let customer_images = additionalInfoData?.customer_images{
            if customer_images != ""
            {
                DispatchQueue.global().async { [weak self] in
                            if let data = try? Data(contentsOf: URL(string:customer_images)!) {
                                if let image = UIImage(data: data) {
                                    DispatchQueue.main.async { [self] in
                                        self!.imgUserMessage.image = image
                                        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self!.displayImageWithPhotoViewer(sender:)))
                                        self!.imgUserAssigned = image
                                        self!.imgUserMessage.addGestureRecognizer(tapGesture)
                                    }
                                }
                            }
                        }
                                        
                userInnerImageview.isHidden = false
            }else{
                userMsgviewHeight.constant -= 140.0
                userInnerImageview.isHidden = true
            }
        }
        
        if let corporate_information = additionalInfoData?.corporate_information{
            if corporate_information != ""
            {
                txtCorporateMsg.text = corporate_information
                corporateInnerMsgview.isHidden = false
            }else{
                corporateMsgviewHeight.constant -= 80.0
                corporateInnerMsgview.isHidden = true
            }
        }
    }
}






