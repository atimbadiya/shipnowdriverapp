//
//  Colors.swift
//  Marketing - JUDGE·FOOD
//
//  Created by Nikita jain on 7/25/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//
import UIKit

class Colors {
    var gl:CAGradientLayer!
    
   
    
     
    
    init() {
        let colorTop = UIColor(red: 249.0 / 255.0, green: 249.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0).cgColor
        let colormiddle = UIColor(red: 223.0 / 255.0, green: 223.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 175.0 / 255.0, green: 175.0 / 255.0, blue: 175.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colormiddle, colorBottom]
        self.gl.locations = [0.0, 0.5, 1.0]
    }
}
