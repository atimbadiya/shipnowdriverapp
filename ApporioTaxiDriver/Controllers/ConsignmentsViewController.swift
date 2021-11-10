//
//  ConsignmentsViewController.swift
//  ApporioTaxiDriver
//
//  Created by Ankit's Mac on 16/6/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//


import Foundation
import CarbonKit

class ConsignmentsViewController : BaseViewController, CarbonTabSwipeNavigationDelegate{
    
    
    @IBOutlet weak var carbonView: UIView!
    var catArray = [String]()
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()

    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        catArray = ["Incomplete".localized,"Completed".localized]
        
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: catArray, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self, andTargetView: carbonView)
        self.style()
        
    }

    func style() {
     
     carbonTabSwipeNavigation.toolbar.isTranslucent = false
     carbonTabSwipeNavigation.toolbar.barTintColor = UIColor.white
     carbonTabSwipeNavigation.setIndicatorColor(UIColor(red: 253.0 / 255.0, green: 182.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0))
     carbonTabSwipeNavigation.setIndicatorHeight(1.0)
     
    
     carbonTabSwipeNavigation.setSelectedColor(UIColor(red:0.39, green:0.49, blue:0.55, alpha:1.0), font: UIFont.boldSystemFont(ofSize: 13))
     carbonTabSwipeNavigation.setNormalColor(UIColor(red:0.39, green:0.49, blue:0.55, alpha:1.0) , font: UIFont.boldSystemFont(ofSize: 13))
        
        let n = catArray.count
        for i in 0...n-1{
        carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(view.frame.width/2, forSegmentAt: i)
        }
     }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        switch index {
            
        case  0:
            
            let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
            let vc  = mainStory.instantiateViewController(withIdentifier: "IncompleteConsignmentController") as! IncompleteConsignmentController
            let INDEX: Int  = Int(index)
            print(INDEX)
            
            return vc
            
        case 1:
                        
            let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
            let vc  = mainStory.instantiateViewController(withIdentifier: "CompletedConsignmentController") as! CompletedConsignmentController
            let INDEX: Int  = Int(index)
            print(INDEX)
            
            return vc
            
        default:
            return self.storyboard!.instantiateViewController(withIdentifier: "IncompleteConsignmentController")
            
        }
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismissVC()
    }
    
    
}
