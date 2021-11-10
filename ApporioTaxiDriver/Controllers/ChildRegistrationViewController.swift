//
//  ChildRegistrationViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 4/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class ChildRegistrationViewController: UIViewController {

    @IBOutlet weak var addmemberlbl: UILabel!
    @IBOutlet weak var wecarefortextlbl: UILabel!
    @IBOutlet weak var togethertomaketextlbl: UILabel!
    @IBOutlet weak var addyourchildlbl: UILabel!
    @IBOutlet weak var textfieldview: UIView!
    @IBOutlet weak var firsttxtfld: UITextField!
    @IBOutlet weak var secondtxtfld: UITextField!
    @IBOutlet weak var thirdtxtfld: UITextField!
    @IBOutlet weak var submitbtn: UIButton!
    @IBOutlet weak var countrycodeview: UIView!
    @IBOutlet weak var countrycodelbl: UILabel!
    @IBOutlet weak var hiddenview: UIView!
    @IBOutlet weak var innerhiddenview: UIView!
    @IBOutlet weak var selectcountrylbl: UILabel!
    @IBOutlet weak var okbtn: UIButton!
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var addchildrentableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenview.isHidden = true
        
        addmemberlbl.text = "ADD MEMBER".localized
        wecarefortextlbl.text = "We Care For You".localized
        togethertomaketextlbl.text = "Together To Make Ride Better".localized
        addyourchildlbl.text = "Add your child details below to enjoy the service".localized
        firsttxtfld.placeholder = "Child Name".localized
        secondtxtfld.placeholder = "Child Phone".localized
        thirdtxtfld.placeholder = "Child Age".localized
        submitbtn.setTitle("Submit".localized, for: .normal)

        
    }
    @IBAction func backbtn_click(_ sender: Any) {
        
        self.dismissVC()
        
    }
    @IBAction func submitbtn_click(_ sender: Any) {
        
        
    }
    @IBAction func countrycodebtn_click(_ sender: Any) {
        
        hiddenview.isHidden = false
    }
    @IBAction func hiddencancelbtn_clcik(_ sender: Any) {
        
        hiddenview.isHidden = true
        
    }
    @IBAction func hiddenokbtn_click(_ sender: Any) {
        
        hiddenview.isHidden = true
        
    }
    
}
