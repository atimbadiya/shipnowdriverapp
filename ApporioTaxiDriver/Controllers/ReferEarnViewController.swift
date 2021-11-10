//
//  ReferEarnViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 28/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ReferEarnViewController: BaseViewController {
    
    
    @IBOutlet weak var referthisfollowingtextlbl: UILabel!
    @IBOutlet weak var refercodeandearnmoretextlbl: UILabel!
    @IBOutlet weak var topreferearntextlbl: UILabel!
    
    @IBOutlet weak var topimagview: UIImageView!
    
    @IBOutlet weak var startdatetextlbl: UILabel!
    
    @IBOutlet weak var enddatetextlbl: UILabel!
    
    @IBOutlet weak var enddatetext: UILabel!
    @IBOutlet weak var startdatetext: UILabel!
    @IBOutlet weak var shareyourcodebtntext: UIButton!
    
    @IBOutlet weak var invitecodetext: UILabel!
    
    var ioslink = ""
    var code = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topreferearntextlbl.text = "Refer & Earn".localized
        refercodeandearnmoretextlbl.text = "Refer Code and Earn More".localized
        startdatetextlbl.text = "Start Date".localized
        enddatetextlbl.text = "End Date".localized
        shareyourcodebtntext.setTitle("Share your code".localized, for: UIControl.State.normal)
        
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DriverRefer
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: ReferEarnModel.self)
        
      
        
       //  invitecodetext.sizeToFit()
        
         let borderLayer  = dashedBorderLayerWithColor(color: UIColor.appThemeColor().cgColor)
        
       // let borderLayer  = dashedBorderLayerWithColor(color: UIColor.appThemeColor() as! CGColor)
        
        self.invitecodetext.layer.addSublayer(borderLayer)
        
       

        // Do any additional setup after loading the view.
    }
    
    
    func dashedBorderLayerWithColor(color:CGColor) -> CAShapeLayer {
        
        let  borderLayer = CAShapeLayer()
        borderLayer.name  = "borderLayer"
        let frameSize = invitecodetext.frame.size
        
        let shapeRect = CGRect(x: 0.0, y: 0.0, width: frameSize.width, height: frameSize.height)
        
        borderLayer.bounds=shapeRect
        borderLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color
        borderLayer.lineWidth=1.5
        borderLayer.lineJoin=CAShapeLayerLineJoin.round
        borderLayer.lineDashPattern = NSArray(array: [NSNumber(value: 8),NSNumber(value:4)]) as? [NSNumber]
        
        let path = UIBezierPath.init(roundedRect: shapeRect, cornerRadius: 0)
        
        borderLayer.path = path.cgPath
        
        return borderLayer
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func shareyourcodebtnclick(_ sender: Any) {
        
        let shareText = code
        
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        
        self.present(activityViewController, animated: true) {
            print("option menu presented")
        }
        
    }
    
}


extension ReferEarnViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? ReferEarnModel{
            
            let data:ReferEarnModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                let status = data.data?.referStatus
                if status == "DEACTIVE"
                {
                    self.startdatetext.isHidden = true
                    self.enddatetext.isHidden = true
                    self.startdatetextlbl.isHidden = true
                    self.enddatetextlbl.isHidden = true
                }
                else
                {
                    self.startdatetextlbl.isHidden = false
                    self.enddatetextlbl.isHidden = false
                    self.startdatetext.isHidden = false
                    self.enddatetext.isHidden = false
                    self.startdatetext.text = data.data?.startDate
                    self.enddatetext.text = data.data?.endDate
                }
                
                invitecodetext.text = data.data?.referCode ?? ""
                refercodeandearnmoretextlbl.text = data.data?.referHeading
                referthisfollowingtextlbl.text = data.data?.referExplanation
                
                let newstring = data.data?.referImage
                
                AppConstants.downloadimage(imagename: newstring!, imageview: topimagview, placeholderimage: "mandy")
                
                code = (data.data?.sharingText!)!
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
    
    
}



