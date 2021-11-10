//
//  UIImageExtension.swift
//
//  Copyright © 2018 Apporio. All rights reserved.
//

import UIKit

extension UIImageView{
     func getImageViewWithImageTintColor(color: UIColor){
        self.tintColor = color
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
    }
    
    func getImageViewWithOutImageTintColor(color: UIColor){
        self.tintColor = color
        self.image = self.image!.withRenderingMode(.alwaysOriginal)
    }
    
    func addGradientImage() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.black.withAlphaComponent(0.3).cgColor, UIColor.black.withAlphaComponent(0.3).cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
