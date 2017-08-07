//
//  UIButton+Extension.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 17/4/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

extension UIButton {
  
    
    convenience init(x:CGFloat, iconName: String, target: AnyObject?,action:Selector,imageEdgeInsets:UIEdgeInsets) {
        self.init()
        
        frame = CGRect(x:x,y:0,width:44,height: 44)
        setImage(UIImage(named: iconName as String), for: UIControlState())
        setImage(UIImage(named: iconName as String), for: UIControlState.highlighted)
        self.imageEdgeInsets = imageEdgeInsets
        addTarget(target, action: action, for: .touchUpInside)
        
    }
    
    // 导航栏返回按钮
    convenience init(backTarget: AnyObject?,action: Selector) {
        self.init()
        setImage(UIImage(named: "back"), for: UIControlState())
        frame = CGRect(x: 0,y: 0,width: 44.0,height: 44.0)
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        addTarget(backTarget, action: action, for: UIControlEvents.touchUpInside)
    }
    






}
