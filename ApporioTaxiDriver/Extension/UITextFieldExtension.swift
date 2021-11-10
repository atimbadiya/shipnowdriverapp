
//Notes:- UITextField an d UIView Extension.s

import Foundation
import UIKit

extension UITextField{
    
    func getBorderBottom(){
        let sizeTextField = self.bounds.size
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: sizeTextField.height-1.0, width: sizeTextField.width, height: 1.0)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        self.layer.addSublayer(bottomBorder)
    }
    
   
    
}

