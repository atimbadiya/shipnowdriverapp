//
//  UIViewExtension.swift
//  ApporioEats
//
//  Created by Apporio on 19/05/18.
//  Copyright © 2018 Apporio. All rights reserved.
//

import Foundation
import UIKit


extension UIView{
    
    /**
     This method is used to make the view circular
     */
    
    
    
   
    
    
    func makeViewCircular(){
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
    
    /**
     This method is used to set corner radius to a view with given width
     
     -parameter width : CGFloat
     
     -returns : Void
     */
    func setCornerCircular(_ width:CGFloat) -> Void {
        self.layer.cornerRadius = width
        self.layer.masksToBounds = true
    }
    
    
    /**
     This method is used to border to the view with given color and broder width
     
     -parameter width: CGFloat
     -parameter color: UIColor default value .white
     
     - returns : Void
     */
    
    func edgeWithShadow (edge: CGFloat)
    {
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = edge
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    
    func edgeWithOutShadow (edge: CGFloat)
    {
      
        self.layer.borderWidth = edge
        self.layer.cornerRadius = edge
        self.layer.borderColor = UIColor.clear.cgColor
        
        
    }
    
    func edgeWithOutShadowcolor(edge: CGFloat)
    {
        
        self.layer.borderWidth = edge
        self.layer.cornerRadius = edge
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
    
    // for gradientColor
    func applyGradient(colours: [UIColor] , location: [NSNumber]?) -> Void {
        self.addGradient(colours: colours, locations: location ?? [0 ,1.0])
    }
    
    private func addGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }

    
    func setBorderToView(withWidth width:CGFloat,color:UIColor = .black) -> Void {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = 4.0
    }
    
//    func setBorderToView(withWidth width:CGFloat,color:UIColor = .white) -> Void {
//        self.layer.borderColor = color.cgColor
//        self.layer.borderWidth = width
//        self.layer.cornerRadius = 22.0
//        self.layer.masksToBounds = true
//    }
    
    func applyHorizontalGradient(){
        let diagonalMode = false
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.bounds.size
        gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor.purple.cgColor,UIColor.blue.cgColor]
        gradientLayer.locations = [0.5,1.0]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyVerticalGradient(){
        let diagonalMode = false
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.frame.size
        gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        gradientLayer.colors = [UIColor.white.cgColor,UIColor.clear.cgColor]
        gradientLayer.locations = [0.4,1.0]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.layer.masksToBounds = true
    }
    
    func slideLeft()
    {
        
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.layer.add(transition, forKey: kCATransition)
    }
    
    
    
    func slideRight()
    {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.layer.add(transition, forKey: kCATransition)
        
        
    }
    
    func slidebottom()
    {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        self.layer.add(transition, forKey: kCATransition)
        
        
    }
    
    func slidetop()
    {
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        self.layer.add(transition, forKey: kCATransition)
        
        
    }
    
    
    func addGradient() {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [UIColor.black.withAlphaComponent(0.4).cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 0.2]
        
        self.layer.insertSublayer(gradient, at: 1)
    }
    
    func getGradienFrom(view: UIView) -> CAGradientLayer? {
        
        for layer in view.layer.sublayers! {
            
            if layer.isKind(of: CAGradientLayer.self) {
                
                return (layer as! CAGradientLayer)
            }
        }
        
        return nil
    }
    
    
    /**
     This method is used to end the superview editing.
     
     - returns : Void
     */
    func endSuperViewEditing() ->Void{
        self.superview!.endEditing(true)
    }
    
    /**
     This method is used to end the view editing.
     
     - returns : Void
     */
    func endViewEditing() ->Void{
        self.endEditing(true)
    }
}
