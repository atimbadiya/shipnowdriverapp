//
//  SetRadiusGuideViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 19/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class SetRadiusGuideViewController: BaseViewController {

    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var getStartButton: UIButton!
    @IBOutlet weak var firstRuleLabel: UILabel!
    @IBOutlet weak var secondRuleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var setRadiusBoldTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    
    //MARK:- VIEW LIFE CYCLE
    //======================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SETUP
        //=====
        self.viewTitleLabel.text = "Set Radius".localized
        self.getStartButton.layer.cornerRadius = 20.0
        self.getStartButton.setTitle("Get Started".localized, for: .normal)
        self.firstRuleLabel.text = "Drag the marker to the location from where you want to receive the user requests for ride.".localized
        self.secondRuleLabel.text = "Then set the Radius(e.g. 10) in the field below.".localized
        self.noteLabel.text = "NOTE : You will only get the requests from user under the defined radius.".localized
        self.setRadiusBoldTitle.text = "Set Radius on Map".localized
        self.subTitle.text = "Makes Your Trip Planning Easy".localized
        

    }
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backBtnTapped(_ sender: Any)
    {
        self.dismissVC()
    }
    
    @IBAction func getStartTapped(_ sender: Any)
    {
        self.presentVC("SetRadiusViewController")
    }
    
    
}
