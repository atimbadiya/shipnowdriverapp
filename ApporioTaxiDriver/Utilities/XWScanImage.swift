//
//  XWScanImage.swift
//  ApporioTaxiDriver
//
//  Created by Xiaochun on 30/1/21.
//  Copyright © 2021 Atul Jain. All rights reserved.
//

import Foundation
import UIKit

var oldframe = CGRect.zero

class XWScanImage {
    /// 浏览大图 - 如果图片不是在imageView上可用此方法.
    /// - Parameters:
    ///   - image: 查看的图片对象
    ///   - pOldframe: 当前imageview的原始尺寸->将像素currentImageview.bounds由currentImageview.bounds所在视图转换到目标视图window中，返回在目标视图window中的像素值 [currentImageview convertRect:currentImageview.bounds toView:window];
    class func scanBigImage(with image: UIImage?, frame pOldframe: CGRect) {
        oldframe = pOldframe
        //当前视图
        let window = UIApplication.shared.keyWindow
        //背景
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        backgroundView.backgroundColor = UIColor(red: 107 / 255.0, green: 107 / 255.0, blue: 99 / 255.0, alpha: 0.6)
        //此时视图不会显示
        backgroundView.alpha = 0
        //将所展示的imageView重新绘制在Window中
        let imageView = UIImageView(frame: oldframe)
        imageView.image = image
        imageView.tag = 1024
        backgroundView.addSubview(imageView)
        //将原始视图添加到背景视图中
        window?.addSubview(backgroundView)

        //添加点击事件同样是类方法 -> 作用是再次点击回到初始大小
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideImageView(_:)))
        backgroundView.addGestureRecognizer(tapGestureRecognizer)

        //动画放大所展示的ImageView

        UIView.animate(withDuration: 0.4, animations: {
            var y: CGFloat
            var width: CGFloat
            var height: CGFloat
            
            let boundHeight = UIScreen.main.bounds.size.height
            let a = image?.size.height ?? 0.0
            let b = a * UIScreen.main.bounds.size.width
            y = (boundHeight -  b / (image?.size.width ?? 0.0)) * 0.5
            //宽度为屏幕宽度
            width = UIScreen.main.bounds.size.width
            //高度 根据图片宽高比设置
            height = (image?.size.height ?? 0.0) * UIScreen.main.bounds.size.width / (image?.size.width ?? 0.0)
            imageView.frame = CGRect(x: 0, y: y, width: width, height: height)
            //重要！ 将视图显示出来
            backgroundView.alpha = 1
        }) { finished in

        }

    }
    
    
    ///  浏览大图
    ///
    ///  - Parameter currentImageview: 图片所在的imageView
    class func scanBigImage(with currentImageview: UIImageView?) {
        let window = UIApplication.shared.keyWindow
        self.scanBigImage(with: currentImageview?.image, frame: (currentImageview?.convert(currentImageview?.bounds ?? CGRect.zero, to: window))!)
    }

    ///  恢复imageView原始尺寸
    ///
    ///  - Parameter tap: 点击@objc 事件
    @objc class func hideImageView(_ tap: UITapGestureRecognizer?) {
        let backgroundView = tap?.view
        //原始imageview
        let imageView = tap?.view?.viewWithTag(1024) as? UIImageView
        //恢复
        UIView.animate(withDuration: 0.4, animations: {
            imageView?.frame = oldframe
            backgroundView?.alpha = 0
        }) { finished in
            //完成后操作->将背景视图删掉
            backgroundView?.removeFromSuperview()
        }
    }
}
