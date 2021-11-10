//
//  UIButton.swift
//  Apporio Laundry
//
//  Created by Nikita jain on 9/14/18.
//  Copyright © 2018 Nikita jain. All rights reserved.
//

import UIKit

extension UIButton{
    func setBorderToButton(withWidth width:CGFloat,color:UIColor = .white) -> Void {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = 20.0
        self.layer.masksToBounds = true
    }
}
