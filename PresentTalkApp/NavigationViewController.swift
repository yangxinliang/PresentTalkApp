//
//  NavigationViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 17/4/13.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer!.delegate = nil;
        
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = false
        appearance.setBackgroundImage(UIImage.imageWithColor(Color_NavBackground, size: CGSize(width: 1, height: 1)), for: UIBarMetrics.default)
        var textAttrs: [String : AnyObject] = Dictionary()
        textAttrs[NSForegroundColorAttributeName] = UIColor.white
        textAttrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 16)
        appearance.titleTextAttributes = textAttrs;
    
    }

    lazy var backbtn : UIButton = UIButton(backTarget: self,action: #selector(NavigationViewController.backBtnAction))
    
    func backBtnAction() {
        self.popViewController(animated: true)
    
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:backbtn)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
