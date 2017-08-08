//
//  Refresh.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/8.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit
import MJRefresh

class Refresh: MJRefreshGifHeader {

    override func prepare() {
     
        super.prepare()
        var ideleImage = [UIImage]()
        var pullingImages = [UIImage]()
        var refreshingImages = [UIImage]()
        
        for i in 0...10 {
        
            ideleImage.append(UIImage(named:String(format: "loading_dragdown_%02d",i))!.resetImageSize(100))
        }
        
        pullingImages.append(UIImage(named: "loading_00")!.resetImageSize(100))
        for i in 0...22 {
            refreshingImages.append(UIImage(named: String(format: "loading_%02d",i))!.resetImageSize(100))
        }
        
        lastUpdatedTimeLabel.isHighlighted = true
        stateLabel.isHidden = true
        setImages(ideleImage, for: MJRefreshState.idle)
        setImages(pullingImages, for: MJRefreshState.pulling)
        setImages(refreshingImages, for: MJRefreshState.refreshing)
        
        
    }
    
}
