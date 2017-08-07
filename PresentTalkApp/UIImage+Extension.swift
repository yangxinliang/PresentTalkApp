//
//  UIImage+Extension.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 17/4/13.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

// extension 可以扩展类方法 和 属性
extension UIImage {
    
    
    class func imageWithColor(_ color: UIColor,size: CGSize) -> UIImage {
        let rect = CGRect(x:0,y:0,width:size.width == 0 ? 1.0 : size.width,height: size.height == 0 ? 1.0 : size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image;
        
    }
    
    func resetImageSize(_ newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth,height: newHeight))
        self.draw(in: CGRect(x:0, y: 0,width: newWidth,height: newHeight))
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
}
