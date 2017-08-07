//
//  MaskCoverView.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/4.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit
private var hideBlock: (()->())?

class MaskCoverView: UIView {

    override init(frame: CGRect) {
        super.init(frame: CGRect(x:0, y: 0, width: ScreenWidth, height: ScreenHeight))
        backgroundColor = UIColor(white: 0.0, alpha: 0.3)
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
