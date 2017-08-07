//
//  TabBarViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 17/4/13.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        
        
    }
    
    fileprivate func addChildViewControllers() {
        addChildViewController(HomeViewController(), title: "礼物说", imageName: "tabbar_home")
        
        addChildViewController(HotViewController(), title: "热门", imageName: "tabbar_gift")
        
        addChildViewController(ClassifyViewController(), title: "分类", imageName: "tabbar_category")
        addChildViewController(MeViewController(), title: "我", imageName: "tabbar_me")
        
    
    }

    // fileprivate是指在本文件类还可以共享  private 只能本类或者结构体使用 不能
    fileprivate func addChildViewController(_ controller: UIViewController,title:String,imageName:String) {
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.selectedImage = UIImage (named: imageName + "_selected")
        controller.tabBarItem.title = title;
        let nav = NavigationViewController()
        nav.addChildViewController(controller)
        addChildViewController(nav)
     }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
