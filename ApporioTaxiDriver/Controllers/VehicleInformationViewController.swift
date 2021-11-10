//
//  VehicleInformationViewController.swift
//  Ozyca Driver
//
//  Created by Atul Jain on 08/02/19.
//  Copyright © 2019 apporio. All rights reserved.
//

import UIKit
import CarbonKit

class VehicleInformationViewController: UIViewController,CarbonTabSwipeNavigationDelegate {
    
    @IBOutlet weak var vehicleinformationtoplbl: UILabel!
    
    var catArray = [String]()
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    var movedFrom = movedFromDocVer.loginScreen.rawValue
    @IBOutlet weak var carbonkitview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicleinformationtoplbl.text = "Vehicle Information".localized
        
        if AppConstants.driverconfiguredata.data?.generalConfig?.existingVehicleEnable == true
        {
            catArray = ["New Vehicle".localized,"Existing Vehicle".localized]
        }
        else
        {
            catArray = ["New Vehicle".localized]
        }
        
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: catArray, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self, andTargetView: carbonkitview)
        self.style()
        // Do any additional setup after loading the view.
    }
    
    
    func style() {
        
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.toolbar.barTintColor = UIColor.white
        carbonTabSwipeNavigation.setIndicatorColor(UIColor(red:77.0/255.0, green:137.0/255.0, blue:124.0/255.0, alpha:1.0))
        carbonTabSwipeNavigation.setIndicatorHeight(1.0)
        
        let n = catArray.count
        
        let s1 = CGFloat(n)
        for i in 0...n-1{
            carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth((view.frame.width)/s1, forSegmentAt: i)
        }
        carbonTabSwipeNavigation.setSelectedColor(UIColor(red:0.39, green:0.49, blue:0.55, alpha:1.0), font: UIFont.boldSystemFont(ofSize: 13))
        carbonTabSwipeNavigation.setNormalColor(UIColor(red:0.39, green:0.49, blue:0.55, alpha:1.0) , font: UIFont.boldSystemFont(ofSize: 13))
//        carbonTabSwipeNavigation.setSelectedColor(UIColor(red:77.0/255.0, green:137.0/255.0, blue:124.0/255.0, alpha:1.0), font: UIFont(name: "segoeui", size: 14)!)
//        carbonTabSwipeNavigation.setNormalColor(UIColor(red:77.0/255.0, green:137.0/255.0, blue:124.0/255.0, alpha:1.0), font: UIFont(name: "segoeui", size: 14)!)
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        switch index {
            
        case  0:
            
            
            let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
            let vc  = mainStory.instantiateViewController(withIdentifier: "VehicleDetailsViewController") as! VehicleDetailsViewController
            let INDEX: Int  = Int(index)

            vc.movedFrom = movedFrom
            print(INDEX)
            
            return vc
            
            
        case 1:
            
            
            let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
            let vc  = mainStory.instantiateViewController(withIdentifier: "ExistingVehicleViewController") as! ExistingVehicleViewController
            vc.movedFrom = movedFrom
            let INDEX: Int  = Int(index)
            print(INDEX)
            
            return vc
            
        default:
            return self.storyboard!.instantiateViewController(withIdentifier: "VehicleDetailsViewController")
            
        }
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAt index: UInt) {
        
        
    }


    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    

}
