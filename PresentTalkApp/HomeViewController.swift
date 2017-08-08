//
//  HomeViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 17/4/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // 创建 string 类型的数组
    var categoryTitles: [String]
    {
        return ["精选", "海淘", "创意生活", "送女票", "科技范", "送爸妈", "送基友", "送闺蜜", "送同事", "送宝贝", "设计感", "文艺范", "奇葩搞怪", "萌萌哒"]
    }
    
    // 创建一个UIView 类型的可变数组
    var cacheCategoryViews = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "礼物说"
        setupUI()

    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpUIFrame()
    }
    
    // MARK: - 视图
    fileprivate func setupUI () {
        view.backgroundColor = Color_GlobalBackground
        view.addSubview(scrollView)
        view.addSubview(popoverCategoryView)
        
        for i in 0..<categoryTitles.count {
            let categoryVC = i == 0 ? ChoiceStrategyViewController() : CommonStrategyViewController()
            addChildViewController(categoryVC)
            scrollView.addSubview(categoryVC.view)
            cacheCategoryViews.append(categoryVC.view)
     
        }

    }
    
    fileprivate func setUpUIFrame(){
        popoverCategoryView.frame = CGRect(x: 0,y: 0,width: view.bounds.width, height: 44.0)
        scrollView.frame = CGRect(x: 0,y: popoverCategoryView.frame.maxY, width: view.bounds.width, height: view.bounds.height - popoverCategoryView.bounds.height - 44.0)
        for i in 0..<cacheCategoryViews.count {
            let view = cacheCategoryViews[i]
            view.frame = CGRect(x: scrollView.bounds.width * CGFloat(i), y: 0,width: scrollView.bounds.width, height: scrollView.bounds.height)
            
        }
        scrollView.contentSize = CGSize(width: CGFloat(cacheCategoryViews.count) * scrollView.bounds.width, height: 0)
        
    
    }
    
    
    
    // MARK: - 懒加载
    // 自定义的view
    fileprivate lazy var popoverCategoryView: PopoverCategoryView = {
        let view = PopoverCategoryView.init(frame: CGRect(x: 0,y: 0,width: ScreenWidth, height: 44.0))
        view.delegate = self
        view.categoryTitles = self.categoryTitles
        return view
    }()
    
   // 创建UIScrollView
    fileprivate lazy var scrollView: UIScrollView = {
       let SlView = UIScrollView()
        SlView.delegate = self
        SlView.showsHorizontalScrollIndicator = false
        SlView.isPagingEnabled = true;
        return SlView
    }();

    
}


extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index  = scrollView.contentOffset.x / scrollView.bounds.width
         print(index)
        popoverCategoryView.scrollCategoryBtnByIndex(NSInteger(index))
    
    }
}
extension HomeViewController: PopoverCategoryViewDelegate {
    func selecyedCategoryENDWithIndex(_ index: NSInteger) {
        
        print("点击了第\(index)")
        scrollView.setContentOffset(CGPoint(x: CGFloat(index) * scrollView.bounds.width, y: 0), animated: true)
        
    }

}
































