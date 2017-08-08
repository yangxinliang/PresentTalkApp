//
//  ChoiceStrategyViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/7.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class ChoiceStrategyViewController: BaseStrategyFeedController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUIFrame()
    }
    // 构建UI
    fileprivate func setUpUI() {
      
        headerView.addSubview(banner)
        headerView.addSubview(topic)
        tableView.tableHeaderView = headerView;
    
    }
    
    // 设置视图的frame
    fileprivate func setUIFrame() {
        banner.frame = CGRect(x: 0,y: 0,width: self.tableView.bounds.width, height: 170.0)
        topic.frame = CGRect(x: 0,y: banner.bounds.height, width: tableView.bounds.width, height: 120)
        headerView.frame = CGRect(x: 0,y: 0,width: tableView.bounds.width,height: banner.bounds.height + topic.bounds.height + 10.0)
        // 设置完高度需要重现赋值，否则高度可能不准确
        tableView.tableHeaderView = headerView;
        
     
    }
    
    // mark: -- 赖加载
    
    fileprivate lazy var headerView:UIView = UIView()
    
    fileprivate lazy var banner: BannerCollectionView = BannerCollectionView(frame:CGRect.zero,collectionViewLayout: BannerFlowLayout())
    
    fileprivate lazy var topic: TopicCollectionView = TopicCollectionView(frame:CGRect.zero,collectionViewLayout: TopicFlowLayout())
 
}
