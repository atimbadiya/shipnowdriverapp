
//Notes:- This class is used to get value for key present in plist

import Foundation
import UIKit

class PListUtility{
    
    class func getValue(forKey: String)->Any{
        guard let infoDict = Bundle.main.infoDictionary?[forKey] else{
            NSLog("Value for \(forKey) not found in info.plist.Please Add if you want to acess it")
            return Bundle.main.infoDictionary![forKey]!
        }
        return infoDict
    }
    
    
    class func getColorFromHex(hexString:String)->UIColor{
        
        var rgbValue : UInt32 = 0
        let scanner:Scanner =  Scanner(string: hexString)
        
        scanner.scanLocation = 1
        scanner.scanHexInt32(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}


