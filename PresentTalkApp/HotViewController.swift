//
//  HotViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 17/4/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

import MJRefresh

class HotViewController: BaseGoodsFeedViewController {
    
    fileprivate var refreshControl: UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()

         title = "热门"
        
        
        
    }

    
    fileprivate func setUpUI() {
    
//      view.backgroundColor = Color_GlobalBackground
//        navigationItem.rightBarButtonItem = UIBarButtonItem(searchBtnAction: self,action: #selector(HomeViewController.searchBtnAction))
//    
//    
    }
    
    fileprivate func setupRefresh() {
//        let header = Refresh(refreshingTarget: self, refreshingAction: #selector(HotViewController.pullDownLoadData))

        
        
        
    
    }
    
    @objc fileprivate func pullDownLoadData() {
    
    
    
    
    }
    
    @objc fileprivate func searchBtnAction() {
    
    
    
    }
    
    
 

   
}
