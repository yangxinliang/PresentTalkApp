//
//  UIBarButtonItem+Extension.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/25.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    // 礼物
    convenience init(gitTarget: AnyObject?, action: Selector) {
    
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "feed_signin"), for: UIControlState())
        btn.frame = CGRect(x: 0,y: 0, width: 44, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.addTarget(gitTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    
    }

    // 搜索
    convenience init(searchTarget: AnyObject?, action: Selector) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "icon_navigation_search"), for: UIControlState())
        btn.frame = CGRect(x: 0,y: 0,width: 44, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.addTarget(searchTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    
    
    
    }
    

    //  选礼神器
    convenience init(chooseGifTarget: AnyObject?, action: Selector) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 0,y: 0,width: 60, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.setTitle("选礼神器", for: UIControlState())
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.setTitleColor(UIColor.white, for: UIControlState())
        btn.addTarget(chooseGifTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
        
        
        
    }
    


}
